Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151634B2087
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 09:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270239.464458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRaB-0002cU-Vc; Fri, 11 Feb 2022 08:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270239.464458; Fri, 11 Feb 2022 08:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRaB-0002Zc-Ro; Fri, 11 Feb 2022 08:47:11 +0000
Received: by outflank-mailman (input) for mailman id 270239;
 Fri, 11 Feb 2022 08:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOdK=S2=epam.com=prvs=4041dc41fc=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nIRaA-0002Sr-Br
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 08:47:10 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316654c5-8b17-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 09:47:08 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21B8gP8d012181;
 Fri, 11 Feb 2022 08:47:03 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e5krx886g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 08:47:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4709.eurprd03.prod.outlook.com (2603:10a6:20b:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 08:46:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 08:46:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 316654c5-8b17-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwjEsBHv2ZQmmPTTpZ4kLZbmP3e5L2TIZIppjgePbL2+POe43OfVifDBBJCYF2FhvWSue3eSEao7TfPF6vkrfNrK+R+FS6FKYXtQqiJ2NG2GfRpN5Dx9aoEFjDK2BsS5hhi5u2MJ38kPq0ETdI6DlnnJaUjCdLv8GSA5IyKCO4cArt4vmuZJ3x9siLeAKIBFRcC/IobswpQsHe6cbGkmkfbwyZDkyyTt5AraZolbmRwkbExOqOPh0Q72TN32BELkzCCXUj1QRYSWznyEVIaQ9uB1TNQgu3lDNcjyj+d6esJTgczeUksfnkbICBp5fuzRCLNUKcFNtomeJdyhCttUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeuJjIm0ppIE4mbB5Upuc8Cu1bqR0aTx12VuRlgGjBw=;
 b=mhg1lGSsmVQLu+tMq/SbhcebpM5K3Lcaa/REQfCyIPyjbXnHi9/hJcavprKBcdUkXfvXpwrDZXt0q35MJUla9MpJp8l9Vd1YbcuqA0BoFRo3vA1g28EwjEqLxbjQoIKLTLnJKi4DAzmjk8Uf5XxHJtyLeGmScm55jLooahhe6rCTaDFXaULHkPEN5yTFZ40Ow7+Z+iq4SA/5Nn4qm4AsoDPjq/OCkHz+hM/BuINes3dWIdDawAc2AdoKFAlbCkGrYcXyFONXS/BgmaKLTmPVAItaLvOg6O3bXP0Gm0qlIdg1kyIPov80uYQwqZao3ly3l56ZO1eah1qR6b2nuljjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeuJjIm0ppIE4mbB5Upuc8Cu1bqR0aTx12VuRlgGjBw=;
 b=doKot9rhQH93GgK8Y0SPwoxRbbx1yUCJfBurcFVctuWGJO21+n/CspweYGMwABNm86sCicxOLUBzYOfOt1usbCghRwfGMylxRUZkc9Q+kizxhkayBz2ysWDuylPrX1JwcORjAIC2aJjOPQYsmaarYvHBZv1YiJvNX2LK/PKkOsjbMDd/ayaabgtC1btFOvy0S89a1ZPgZiWEUsESjldu+BIXwEdko7SxsdjFlEAA0v1U07NYEy/sseuMyn/fJIVimgqvz4FC4nSweegkQJAUTz2cvnT77WbQfs87KB+ORyjkLSSsgmFUapUSy1uBdXYoe2YCJZKkfSz+JUyJdrlayg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAEU1AA=
Date: Fri, 11 Feb 2022 08:46:59 +0000
Message-ID: <878371dd-4269-6e44-4e73-344a74a04a84@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
In-Reply-To: <YgU6Snk8GTytJXZp@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8be8efcb-81fa-4e46-6a96-08d9ed3b111c
x-ms-traffictypediagnostic: AM6PR03MB4709:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB4709116243DAC91347927A2EE7309@AM6PR03MB4709.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vLEYTj4/yrqfYl7BsCHpYv1WF3tUpnFW3EDWt7zxqwPFLq3cEFGtr02+XtlcSJlUAAqzC4QdK93d8KKHRZoxEFMb/EXQfE07tFziaS4nYas5oMv2TugPNjNXa0+PvthpuCNIIgGcV6VLHA1XpHvtctVOrZFyNqpCDG6Tnp3r4kBthQ/INwjAFO7D87FsYskFoA4qEfkuDgTUU94taGJKeeWWBitx6y3QKe5Q9KMb6jsIIp4Nn5tJYvmy7CTMYQtoOlUoq9+++nX/XJOipkFDyssD9Vp4g8d+f31oRdjfVZD01vO8M9ZRuksVcizw/88Bry/rpoLpiO7I8G6MA3ptZmzLizUKpjtaSv0CngUZ7+DfyGB3+5g+Ib6oZ639uXTFnMzW5x49e6DkA4MyvaXGd92Z/BSM1OMdwtaflyAo1IqyGkuiRuRcS99fJoxmglZxpn6ASXsSDDl818KyaHMZf3hbKUs83Ro/4NbXNMk4skh7CRJjzF5/dl+70gCMgHWlBxdWpW+NHJaQdDI1I1N7o0IixXiglLvo3ShyyaGdGy5a4JhRzkxtZdQvKpKvxtMnFuRrqasZZoKzW2yVDGpa3MFK6BVsWpQ5natUwFdMQBCwk72uY5fjPBNIJfFXhGUSxrZJ0V1C7wXZGjixUwLDmKWAcIM7j5ZrPEArZjV9pXc1Pvvt8AkAfhndiMHR4aXxe8BzkTKNX/pJV6AYamIu3CFwroAJhs2RjJbrH6+B+jhA41HkVDi0PkSOSwWCkvXV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(8936002)(6512007)(83380400001)(2616005)(107886003)(31686004)(186003)(26005)(2906002)(6506007)(316002)(38070700005)(8676002)(71200400001)(53546011)(55236004)(508600001)(86362001)(6486002)(122000001)(91956017)(54906003)(5660300002)(31696002)(4326008)(38100700002)(66476007)(66446008)(64756008)(6916009)(66946007)(76116006)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ditvMSttVUNGTWZncVdKbitaRjRpUHRZT0RMZUUvWHAyaFg2ald4YjUzM29p?=
 =?utf-8?B?cVJVelRQOXhqd0ltUS9QZ1loWVBtNXd6dXZmRDZ1dExIbFJndnVUd2w1a0Yz?=
 =?utf-8?B?Z1pPcGdwdUhEc0lYZDc5VDdiT0JMVk5uRTVsWjlyYXNOUDBpRW9CWjVTQk9W?=
 =?utf-8?B?dm56cnFLWUhWd3ZTNklLcWo5aU92bk1QRm5yUGtZWkR0TngzUFpVdGxoMWRY?=
 =?utf-8?B?YmUwNG5XajV6YjAyUWpOaXhXQ1BSRTVObU0xUU9ua2wxQ0lyS3FsQ3YrMjBr?=
 =?utf-8?B?cjhqdW05RER6Mnp4S2VqU085dGUxaVdQa01LeVZ0d08zNzFMa2Z3b0czcWZk?=
 =?utf-8?B?L0RSK2lWdnpTUXBOc3lVY1BBanEvWHVaNkJNWHh5Smo2QThZV1ZYRkVHbnJh?=
 =?utf-8?B?Um50Njh1anZZcmFzRmUwWVU3YTA4RGx1dzJXUDg4RDFWUzJtU1JTSkxqbEJV?=
 =?utf-8?B?dkxzY3pRdjZOMVRSZ0VCN0tCckNaZWRVQnlOdjc2RXBadWdCMEwvR2NFaW1k?=
 =?utf-8?B?OHk5cjEydFlGMGxHRjFJbHhrU1Z6T1ZUZVY3NTRNVlUzZ2w2RnNnSUVsNE8z?=
 =?utf-8?B?ZTBNeU5rZVp0RCtxZ0RNZ2R2UXlSMEFWaVRMZHMyYmVLUXh1R2VKTTE1ZkVL?=
 =?utf-8?B?VGxoRXpKS0xwM0lEcUxGQ2d4dWlwZXV1Q0M2SGZjVlU1NkFVWnpCa0ZyQWpw?=
 =?utf-8?B?UXJYV256SmltaTNaRHF0anNJcDV4KzlQQVFoTHFIWnhzaTZvdjlFSUtvOEFW?=
 =?utf-8?B?OTBKRVVyQUlGc2NJMXl5eGhkeW9OdVRuVElHTjdoMHhUcjBCOGV1N3daSmdS?=
 =?utf-8?B?SDYyNkZaTVNYMm8yamE4cldYbGFVRUF1ejJUclJkakJUbjNuOUdMUGQ2SGpD?=
 =?utf-8?B?dmUyUTcwL1V6Y0oxdHZlbmVSUVdQMldVelBEUFBQSHVkS2taTVFnNHA3amts?=
 =?utf-8?B?TGVxdThIS0ZWZ0VqMXJyRlVtUUxjd0xoUWFML25JcWV6YnRlUnM2NEQ1Smlv?=
 =?utf-8?B?OU82ZzBucVFvZzBoNnRhVjYrL0I0S0R0YzF2eUNlK01EdTJraVZSZ0MramJv?=
 =?utf-8?B?UnFIQkZRcHBTLzk0b2w3enR5T0M5QWMrMmlNdnFzYlZ6RXhRNU1Cb09sZGhs?=
 =?utf-8?B?MFRoZzZSOSs5WGhDTEk1bjlmeHY0NWJGS3F0M0dlUXFDcW9GeFJhVW9tQm5Q?=
 =?utf-8?B?Y0ZieUJ1VVJDUDIzREhHdkVGWStyZUk2Y3dWSkZUY2lRb1A3VU5nM0NiVkJ4?=
 =?utf-8?B?Wk5ELzl1MUdrUHI3YVUzbGJ2cDlJUW5idVlCUkprZWsyclBCR0YvSURBcUQz?=
 =?utf-8?B?ajErL01EaC9qTlVaVmxSdm1VR2twUENXdE5KOWd6b0VJL0twa2h0REc5alFG?=
 =?utf-8?B?WGZlN2JycTk2bnNUeU9PcVVWZjd0OFdPZ2k5LzU3OHQwZ3JhRWxvV3BxKzFF?=
 =?utf-8?B?OS8xeEtlbjY3NHNJK3N0V1FKZ0QvaWJaN1F3Q3c2U1BJYk9yWXhNd1BWU3ZN?=
 =?utf-8?B?cUJYUmdJNmhaZDQvSDJWVGF4QzVxYS9QdFV5VnRuTkloYi84SXN0NnVLb3F4?=
 =?utf-8?B?WWNOMjBBaTBVNzk1bzYvbWJIRUJaUThmRVUrK1NweTE0SlJ1dTNkRnlZT0Zq?=
 =?utf-8?B?Ny80OUViZHJlN0hYenVXSFgwQjAvdXVIc0VQU3k0d1hvU2dVOEw3NHJIUU5y?=
 =?utf-8?B?RG9Tdm9DbHRvUDFzdnBVWTFxYWd6YzRrMWl0cllENDRMNkpsSnRHd0haZ1Qv?=
 =?utf-8?B?bmRhUjdTTUpYY1JsUWtXWXNHc3dwenBmUHhJOTZhWGQxYkVKQXd5VjJiMEtR?=
 =?utf-8?B?OUZyNndyQ0Y3R3BuV1libmdNMUF5OE8xN2tFZXRINGhrdkMyK0lyemZUMkxM?=
 =?utf-8?B?MWt0bU96Wi9zTy9DV0wrUTJ5OUtKZ3k2NUZ2bjN3V0VmYkd4bDlWbXNQeHpZ?=
 =?utf-8?B?cjk2ckowMUlwY3BTS25IVHliY2djVGZITmhZTWIvMEppdklQNlI3TVZkaHFt?=
 =?utf-8?B?cy9jbmJMT1QrOVBxemJsdXFaVzA1ZXRUV3ZHc3dUdjlwNUx4VWI0OTVLTzBZ?=
 =?utf-8?B?emNYUEttcHdVdkViWEJ5d1hQYTFWU2ZGQzZ1V3d4MHpnQlJXSlZKeloyYith?=
 =?utf-8?B?NE5aUHU5cXdhQmlsZll1VnA2Qk1tbXMvYm9ZTThYbFRiZ2dkNVNGSU9TZUda?=
 =?utf-8?B?SlQ5cEJWZG03cG9IR1hxRGpoelVTb3dsR0FrNHJENnF1MmFlR0NPR2lmWTVl?=
 =?utf-8?B?SmdTV0lDQXJRYXhKYTBVMlN0SG1DYlZta0Q3ekZZUWFsTUZEMGNxN2pKeEVW?=
 =?utf-8?B?ZlUvUk9HWVpIVjB3Zm54ZVpTOFg5VzF0cyt1TEhGaUpXYlRzWGR6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7BA105B38477942A3BEB757E18D626D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be8efcb-81fa-4e46-6a96-08d9ed3b111c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 08:46:59.4470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxnwIyUAtDKz8vuSYKPF/R7MZWG3avgj2l15g//u2l8YeC/cUVAp08eM0Iq8+n6+FUpPJs7c9bB/NlBmEP0ykMb+G5BjNkp4OWVG2zaEOQ8bvxuMALc/7J4LI4dYzS2N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4709
X-Proofpoint-ORIG-GUID: fijSHzZ8kZqIfyCcBWHUarCSW0_gHVjA
X-Proofpoint-GUID: fijSHzZ8kZqIfyCcBWHUarCSW0_gHVjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_03,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110048

DQoNCk9uIDEwLjAyLjIyIDE4OjE2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IEZlYiAwOSwgMjAyMiBhdCAwMzozNjoyN1BNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBJbnRyb2R1Y2UgYSBwZXItZG9tYWluIHJlYWQv
d3JpdGUgbG9jayB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2VudCwNCj4+IHNvIHdlIGFy
ZSBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0byB0aGUgY29udGVudHMgb2YgdGhlIHZwY2kg
c3RydWN0DQo+PiBpZiBub3QuIFRoaXMgbG9jayBjYW4gYmUgdXNlZCAoYW5kIGluIGEgZmV3IGNh
c2VzIGlzIHVzZWQgcmlnaHQgYXdheSkNCj4+IHNvIHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBw
ZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZQ0KPj4gbW9kZS4gUHJldmlv
dXNseSBzdWNoIHJlbW92YWwgY291bGQgcmFjZSB3aXRoIHZwY2lfcmVhZCBmb3IgZXhhbXBsZS4N
Cj4gU2FkbHkgdGhlcmUncyBzdGlsbCBhIHJhY2UgaW4gdGhlIHVzYWdlIG9mIHBjaV9nZXRfcGRl
dl9ieV9kb21haW4gd3J0DQo+IHBjaV9yZW1vdmVfZGV2aWNlLCBhbmQgbGlrZWx5IHdoZW4gdlBD
SSBnZXRzIGFsc28gdXNlZCBpbg0KPiB7ZGV9YXNzaWduX2RldmljZSBJIHRoaW5rLg0KPg0KSG93
IGFib3V0IHRoZSBiZWxvdz8gSXQgc2VlbXMgdG8gZ3VhcmFudGVlIHRoYXQgd2UgY2FuIGFjY2Vz
cyBwZGV2DQp3aXRob3V0IGlzc3VlcyBhbmQgd2l0aG91dCByZXF1aXJpbmcgcGNpZGV2c19sb2Nr
IHRvIGJlIHVzZWQ/DQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQppbmRleCBlOGIwOWQ3N2Q4ODAuLmZk
NDY0YTU4YjNiMyAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQor
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KQEAgLTkzNyw4ICs5MzcsMTQgQEAg
c3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3Qgc2Vn
LCB1aW50OF90IGJ1cywNCiDCoMKgwqDCoCB9DQoNCiDCoMKgwqDCoCBkZXZmbiA9IHBkZXYtPmRl
dmZuOw0KKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0kNCivCoMKgwqAgd3JpdGVfbG9jaygmZC0+dnBj
aV9yd2xvY2spOw0KKyNlbmRpZg0KIMKgwqDCoMKgIHJldCA9IGlvbW11X2NhbGwoaGQtPnBsYXRm
b3JtX29wcywgcmVhc3NpZ25fZGV2aWNlLCBkLCB0YXJnZXQsIGRldmZuLA0KIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2lfdG9fZGV2KHBkZXYpKTsNCisjaWZk
ZWYgQ09ORklHX0hBU19WUENJDQorwqDCoMKgIHdyaXRlX3VubG9jaygmZC0+dnBjaV9yd2xvY2sp
Ow0KKyNlbmRpZg0KIMKgwqDCoMKgIGlmICggcmV0ICkNCiDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0Ow0KDQpAQCAtMTQ3NCw2ICsxNDgwLDkgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0
cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KIMKg
wqDCoMKgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOw0KIMKg
wqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KIMKgwqDCoMKgIGludCByYyA9IDA7DQorI2lm
ZGVmIENPTkZJR19IQVNfVlBDSQ0KK8KgwqDCoCBzdHJ1Y3QgZG9tYWluICpvbGRfZDsNCisjZW5k
aWYNCg0KIMKgwqDCoMKgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQ0KIMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7DQpAQCAtMTQ4NywxNSArMTQ5NiwzNCBAQCBzdGF0aWMgaW50IGFzc2ln
bl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMy
IGZsYWcpDQogwqDCoMKgwqAgQVNTRVJUKHBkZXYgJiYgKHBkZXYtPmRvbWFpbiA9PSBoYXJkd2Fy
ZV9kb21haW4gfHwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBk
ZXYtPmRvbWFpbiA9PSBkb21faW8pKTsNCg0KKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0kNCivCoMKg
wqAgLyogcGRldi0+ZG9tYWluIGlzIGVpdGhlciBod2RvbSBvciBkb21faW8uIFdlIGRvIG5vdCB3
YW50IHRoZSBsYXRlci4gKi8NCivCoMKgwqAgb2xkX2QgPSBwZGV2LT5kb21haW4gPT0gaGFyZHdh
cmVfZG9tYWluID8gcGRldi0+ZG9tYWluIDogTlVMTDsNCivCoMKgwqAgaWYgKCBvbGRfZCApDQor
wqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmb2xkX2QtPnZwY2lfcndsb2NrKTsNCisjZW5kaWYN
CisNCiDCoMKgwqDCoCByYyA9IHBkZXZfbXNpeF9hc3NpZ24oZCwgcGRldik7DQogwqDCoMKgwqAg
aWYgKCByYyApDQorwqDCoMKgIHsNCisjaWZkZWYgQ09ORklHX0hBU19WUENJDQorwqDCoMKgwqDC
oMKgwqAgaWYgKCBvbGRfZCApDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2so
Jm9sZF9kLT52cGNpX3J3bG9jayk7DQorI2VuZGlmDQogwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGRv
bmU7DQorwqDCoMKgIH0NCg0KIMKgwqDCoMKgIHBkZXYtPmZhdWx0LmNvdW50ID0gMDsNCg0KIMKg
wqDCoMKgIGlmICggKHJjID0gaW9tbXVfY2FsbChoZC0+cGxhdGZvcm1fb3BzLCBhc3NpZ25fZGV2
aWNlLCBkLCBkZXZmbiwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHBjaV90b19kZXYocGRldiksIGZsYWcpKSApDQorwqDCoMKgIHsNCisjaWZk
ZWYgQ09ORklHX0hBU19WUENJDQorwqDCoMKgwqDCoMKgwqAgaWYgKCBvbGRfZCApDQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJm9sZF9kLT52cGNpX3J3bG9jayk7DQorI2Vu
ZGlmDQogwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGRvbmU7DQorwqDCoMKgIH0NCg0KIMKgwqDCoMKg
IGZvciAoIDsgcGRldi0+cGhhbnRvbV9zdHJpZGU7IHJjID0gMCApDQogwqDCoMKgwqAgew0KDQpJ
IHRoaW5rIHdlIGRvbid0IGNhcmUgYWJvdXQgcGNpX3JlbW92ZV9kZXZpY2UgYmVjYXVzZToNCg0K
aW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQp7DQpbc25p
cF0NCiDCoMKgwqAgcGNpZGV2c19sb2NrKCk7DQogwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkg
KCBwZGV2LCAmcHNlZy0+YWxsZGV2c19saXN0LCBhbGxkZXZzX2xpc3QgKQ0KIMKgwqDCoMKgwqDC
oMKgIGlmICggcGRldi0+YnVzID09IGJ1cyAmJiBwZGV2LT5kZXZmbiA9PSBkZXZmbiApDQogwqDC
oMKgwqDCoMKgwqAgew0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnBjaV9yZW1vdmVfZGV2aWNl
KHBkZXYpOw0KDQphcyB2cGNpX3JlbW92ZV9kZXZpY2Ugd2lsbCB0YWtlIGNhcmUgdGhlcmUgYXJl
IG5vIHJlYWRlcnMgYW5kDQp3aWxsIHNhZmVseSByZW1vdmUgdnBjaS4NCg0KVGhhbmsgeW91LA0K
T2xla3NhbmRy

