Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87C4A95AA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 09:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265187.458495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuQN-0000KD-A4; Fri, 04 Feb 2022 08:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265187.458495; Fri, 04 Feb 2022 08:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuQN-0000Gr-4d; Fri, 04 Feb 2022 08:58:35 +0000
Received: by outflank-mailman (input) for mailman id 265187;
 Fri, 04 Feb 2022 08:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFuQL-0000Gl-C5
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 08:58:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a010830f-8598-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 09:58:31 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2148wQdT018409;
 Fri, 4 Feb 2022 08:58:27 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e113t800b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:58:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB5879.eurprd03.prod.outlook.com (2603:10a6:20b:e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 08:58:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 08:58:19 +0000
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
X-Inumbo-ID: a010830f-8598-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1qoKf+dd3SD2OEzvPVJfMCg9g7jk3N8p0AN6ojWWngO0mGPev95noW/pnD0KYC0ZQqV2BIxteRfAoa8hhLqVk0z4SUU3ISJX64gGV0/u+Ai8Du7kAxqwUEQ3MRvZBqhhqkR9NcxKEVfi3EpMNawvlAOYa3TsPolW0auB9V6DNYQUoEjNAfeq40bpvKaveJA7RM1CTzgQ3tneVvJp2uqv2JbD8ml7FucMGLECky3VUxGWXqgUt+oXxXnW8w0NcJi8XaG0rSVQOqeaG4qhFkXnNEae9t8+9j5QY3Oyf5Kdf1Q+djEmeW/D75G3zTTIznEvzQVcLSicAv0HEynbAforw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sR02q3Oc3IfIcioWn60pYhXcrx/3K1XrtBzaE15zDFw=;
 b=GB16q80nQnz0cvxI85klfdLh1nWcIqg9ssfL7+wMkrUTiqhZTuJwX9QGKmg5ALvyztT7/KjdZIyB9kBe3BCinzO8G3LLGDD7T+/xy4blivAoTFZKi5+LzWKICPiBvxjxAZr9TyukIcxnWwVCMVoxQfG7JIIaY7OwnYYWBU0peCFqRIE892dZ/QlgouAerSIWEUWlh1JasbCxSLHj4qe4ugWwNa+asnVYOsXadBCMleeJx8E+4N6L8A4ew6dG8Cf4VUKbq6CnfLOKQTDJIrncLiBOcf+iI0rF9T/w1+REwOjYJrEy3sqAkKAKM9oyx5N+Yx4pZmg+VeggmKnfAeag9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR02q3Oc3IfIcioWn60pYhXcrx/3K1XrtBzaE15zDFw=;
 b=VgmbQ6+znF7mjzocvoFLj+zirm1fKvVugw8L0AUApDn1kEupmOQuokv+oOxG5wHUFHP8bOgp5TOGKWo5dp8yxZR6A7htQeQav9QzFGsrIoPWMXtt3IBKLYgVgDSqmxjDtgLKVjvM9599p7BYJZ/OekSY7pN7eMDQDC1biC6jKPkl9ETpFnlWd8YuIEq51yCdtzrxSaKK6rTi765NBNB2kdEAqd0RS7RTqE9UL91R4omnBRXZbJKOk7oHUcm9bxR1h1ifNB3ufg4mixqkmQtBVlKM/hh3Ot40hwTDSGhxG/6ehdng6cxWcZF5bdADBGwDBy1R4UMi/VLNdLIeg6FKvQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSAA=
Date: Fri, 4 Feb 2022 08:58:19 +0000
Message-ID: <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
In-Reply-To: <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f601c9c8-6668-42c2-c85c-08d9e7bc7d5c
x-ms-traffictypediagnostic: AM6PR03MB5879:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB58796438DA3D98BA8ECF78ECE7299@AM6PR03MB5879.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3dMki5hXvl97dPxS/md2NH32gV57TLlpWZYlwqSjayXQenHp7LlDrfEWU46tQ+b4fVcA+03b9W7Ghkn2CY+nhgjCI6PTmzTjxWCHhclNslkCmv4FKz0t4KgQqer9isclTMaFXyXqyS+gSAKX46ywFqan4ZOtmmizqE8OnvxAX6k+uI7Ij9wMmQHX7PK9bKd8PUfXbeObk/v55+EeDno0Ww3XPOuNBoMq5DSVKWptobkiHnEWMv5TGVHHAUpi1KAreoMYeyNz6o4u6ruaGr4RZA+DvIZhy3LOWmNjGL92CLEU0mbdva/5LkxRUtO1hADH9c7zUuiqYhyNG9bdZupXO1EQ3u02y8sSedHWbVgNFqvIfk0ZTvBMEavEQ3ghhRXFIkleovXWPIkTGDxiBLzeJVKkoynF2JabxQaMQ4GurY24Y4zqad23pi4UOcnnOPzlYVlTs/Rd4igWl6UUbpDd9LZgvSSPRNBfetNTjmlK8Fedor/GI0wx8K5mCYuiCk5SrtEdGUQIVHJxxu0A8FpbKLSbEYURq6Fws5woodAjbMFo3RAJ03lY3p/cGdJOfp07hcSHnmIf3CDafnLH3ZCdsI/9m8288EYhqb4ykZ6H5KLQapen1mmK3HgexrFBZ/aTgwXYtlj5qUuKu5M0Qx9pnpRj2RifFCLMMUl5to2d6f7mzDcCL8uucIz6mZHsX6qUT5BPbZ7+OXcrDqZLmGeiWZMn7+Sn45/+j/MpMqTY7yG5dNQf9w0TkBwDTMPK3vaTsAlgosrx22xuc8sAA8Zxkg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(107886003)(6486002)(5660300002)(6512007)(71200400001)(7416002)(53546011)(186003)(26005)(31686004)(2906002)(36756003)(508600001)(2616005)(6506007)(38070700005)(86362001)(31696002)(38100700002)(122000001)(316002)(64756008)(66446008)(66476007)(110136005)(66556008)(54906003)(66946007)(76116006)(8936002)(8676002)(4326008)(91956017)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R2F2ZFRWVzdTcjRIWXFDTG0wOUE3ZEs2S2l2RzE3V2c0RDlHeFFBOWQzVk9n?=
 =?utf-8?B?b0JsMCtvMEhDaFFUcmduNFZVUi9tWjIwajJnWHlNcktZdCswbXFiUWZHeDJx?=
 =?utf-8?B?TFlmOXlPclR4R3Q5R3g0M1R4SzJSaU5jdmFxVnVZTFRrM2VrWWhoc29lTFI0?=
 =?utf-8?B?Y2t1a2VMaEpTNVQzUDkzdC9ZOHYvVUVQRGNuVDBhM004TW43a1RkV1dpd3NY?=
 =?utf-8?B?SXZBVHNxNXlHTHpRNkFraUViMm9LQkFxMnliMWx6elN3OGZZZUtxeDRNaHN3?=
 =?utf-8?B?WjMyZUlqaXJmekFGTm16aUdUa21rR3IzNEdwU0grV3VaZktqYlNMdU5yMGpD?=
 =?utf-8?B?a2s1Wjd4WVJhY1lHT0Y1MCtsWWE0bFVya3k3L0kyam9NMVJWSmFPbkNTRUI4?=
 =?utf-8?B?ZGMyWkovcStEbEFVNHMrYktwMHF1SEhGR3Y1LysxSWtRc2F4Ync0eDZhR2lM?=
 =?utf-8?B?U1dKYjZuN2hEQk1HRzQrS1d4TUtzSGRGZUk0eXJTYXB2QUhxc1JzdWt1bFg2?=
 =?utf-8?B?SzA2SzZoK05DbTJCdEw0T0FVdWJLY0s3eXNMMmhKOGllSjl4K3BIZm9MQ0Jz?=
 =?utf-8?B?T2ZoRnJQL2dDZGh4OUovZ09NTUZRNHRiQi95QkpXZ1ExQ2JXMVg5RUYyRDRT?=
 =?utf-8?B?dFlnd0RtN29PWkZDZ2VSS0JqZGZpNmNjV1VMZXJ3YWw5MTlEUDJrYVJ0cEFG?=
 =?utf-8?B?VWIxVjhTSWdKelRuUjJNUWZMcjROdGQ4OE10N0FINCt0MmZMamQvcHNwc0VD?=
 =?utf-8?B?cFBUTldMMWJBVWlTVjBGK1NoUzU1eTVzZGtpcEJjeFNzdjRjenZQcXoyaUc4?=
 =?utf-8?B?M01TOVp5NnJSaUVnS2k4MzlHKzdoamZCd0xWanpLTU1JdGVQTFM4Q1hlOStv?=
 =?utf-8?B?V2J0dmZaeHRkQXNtRFNyK3lzNFFwYUlNajlWSUcwa2Uza2pTcVFOd0RjaUxF?=
 =?utf-8?B?N2tHTVVhWWlncnlkQmt1T1RJZnllc1dpR1pxR2FxbURFcEM3T3Q1Z2NyNnRj?=
 =?utf-8?B?S1NnNjdrZ3VEZGZwUTJLQkJSYWhTT3pNYjIyKzl6MzRkOXAxdjREQkI2bkYr?=
 =?utf-8?B?R3YyUlppNWpCNFJTMTFBYWxHVVdJM3R2Ri9iZE4zTnk3NElMNHJRYzBod2VT?=
 =?utf-8?B?aEFtSDNSbWtrcU1rOHBDcUpxNXFmMWw2TnA3Y1lpYVowMFBLNnFvRjZlbThn?=
 =?utf-8?B?Q1lFOWxWdDQ3dzBzRWdpaytRZkFpSlFpbndIdVJrSnVITE1PTnhsVFdhSUFE?=
 =?utf-8?B?YTZ3Qm8yVGJQeEFKZ2NIUE5mdVpERVdJQTg3MGtBaE8vQm90VzhtNFVvSWZJ?=
 =?utf-8?B?NDNUaUQzSnlBekR5L05iSC9GRTg0MjhMZDVOZ0FGODBwSDM2bjZHMExsUlpq?=
 =?utf-8?B?eHhIcDdkcm51OUhUaEU0RFV1dXMxckJVakRaN1lDdkozRHJyWWd0KytBdlRM?=
 =?utf-8?B?b2s5UFdlQ3ZSdm91M2FXVXBRNGhPSTVubHg2UTJWaXhuNjNOMzRVYi9semVW?=
 =?utf-8?B?MEoxa0xSM2ozTUNtVFkxWU5McWtqcUozemtDK0VKWW1QZGU2MU1KSEdYZkQ0?=
 =?utf-8?B?OU5WU1ZiVkFsamJVQU1qSGk3d3FiNXdoRmZLTlluOThRVC9CWVljNS8yb0Vm?=
 =?utf-8?B?RU93d3dTQ0taY08ydUZ5cTZnT0lPTnBHZHM1WjFhZENDSlIvMmJBOUlxcU9R?=
 =?utf-8?B?R2kzakMyUjdHdUV3U3lTSDcvOWZhdkgzZmo5dXRiTWNMUDhJeHlubnBlOXdV?=
 =?utf-8?B?VjhqeDNVVFVYLzVhRTNGWWZ4QUI5TVo0NHdKaUhvK29ua3ZQcGJDSGdvSmhL?=
 =?utf-8?B?QWtSVHg1c3dVMkhhMU45YkZhajU2R1pOQmc2SWdLYVdWTDNkT0ViWHEwc0lz?=
 =?utf-8?B?Q3B2bW1vb0lGaU5qdWtUSi9mbHNXVkJpUjg3ZkJnaHYva1RodVZGUGJtNk1C?=
 =?utf-8?B?bWFHaWIrVGgrblFPT21zY3o1eWJObCtPc1RDQ2szMXpYekRMRkx4NTVnYzk5?=
 =?utf-8?B?ZjdsTUp6aVRqNmFhN3BXVC9OR2NLV0JhWi9rRlN3c2V3U3hsL3BpRUxPRHFm?=
 =?utf-8?B?cGtXSEFZVWg4TGw0bm5LbDhHWTZhN2lNZ1VPbm43YWwzVjE0RDl2dTV5ZSth?=
 =?utf-8?B?OUFLT08wbmtGMTFIZ3dSNkI3Njlrc2xKK1hSNy9raGozWFJMREZYUHZuN2lC?=
 =?utf-8?B?WDFDUCsweWRUdVRnMVdvS1VRenQ0dVdyVWwrUTB0NFBjNUcwT3NKWUZYMm9o?=
 =?utf-8?B?RHI5YjRERnU3Tzl0RDRGRzVkM3p1YWlBNTNKY1VkNEp4V1EwcVdpVW9NK0VS?=
 =?utf-8?B?ZUJ2ZnFMajkwKzZiRmk4L1BhdzlOcWRZelNPT3NvWHExTnQxU0MvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5995A2B662924C4E941714726182A791@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f601c9c8-6668-42c2-c85c-08d9e7bc7d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 08:58:19.2111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxmNq4izbCHSA8biEXPn089z+qzyXHeHlcRsOdKxLhefjtrwEzgRq9r19NGF5ELu+ewOXzPBpEIMYSSbIJqxW9+PtNlpqtMToM4Dyq3kaxYaEV+UmOiPM9efN/YfSe3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5879
X-Proofpoint-ORIG-GUID: tdCBd3h8HUkjpJmjYfyJV73aBXOe8Zzy
X-Proofpoint-GUID: tdCBd3h8HUkjpJmjYfyJV73aBXOe8Zzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040047

SGksIEphbiENCg0KT24gMDQuMDIuMjIgMDk6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
NC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEBAIC0y
ODUsNiArMjg2LDEyIEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4+ICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOw0KPj4gICAgICAgICAgIH0NCj4+ICAgDQo+PiArICAgICAgICBzcGluX2xv
Y2soJnRtcC0+dnBjaV9sb2NrKTsNCj4+ICsgICAgICAgIGlmICggIXRtcC0+dnBjaSApDQo+PiAr
ICAgICAgICB7DQo+PiArICAgICAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+dnBjaV9sb2NrKTsN
Cj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgIH0NCj4+ICAgICAgICAgICBm
b3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodG1wLT52cGNpLT5oZWFkZXIuYmFycyk7IGkrKyAp
DQo+PiAgICAgICAgICAgew0KPj4gICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIg
KmJhciA9ICZ0bXAtPnZwY2ktPmhlYWRlci5iYXJzW2ldOw0KPj4gQEAgLTMwMywxMiArMzEwLDE0
IEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVp
bnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4+ICAgICAgICAgICAgICAgcmMgPSByYW5nZXNl
dF9yZW1vdmVfcmFuZ2UobWVtLCBzdGFydCwgZW5kKTsNCj4+ICAgICAgICAgICAgICAgaWYgKCBy
YyApDQo+PiAgICAgICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2so
JnRtcC0+dnBjaV9sb2NrKTsNCj4+ICAgICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19X
QVJOSU5HICJGYWlsZWQgdG8gcmVtb3ZlIFslbHgsICVseF06ICVkXG4iLA0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQsIHJjKTsNCj4+ICAgICAgICAgICAgICAgICAgIHJh
bmdlc2V0X2Rlc3Ryb3kobWVtKTsNCj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+
ICAgICAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIH0NCj4+ICsgICAgICAgIHNwaW5fdW5sb2Nr
KCZ0bXAtPnZwY2lfbG9jayk7DQo+PiAgICAgICB9DQo+IEF0IHRoZSBmaXJzdCBnbGFuY2UgdGhp
cyBzaW1wbHkgbG9va3MgbGlrZSBhbm90aGVyIHVuanVzdGlmaWVkIChpbiB0aGUNCj4gZGVzY3Jp
cHRpb24pIGNoYW5nZSwgYXMgeW91J3JlIG5vdCBjb252ZXJ0aW5nIGFueXRoaW5nIGhlcmUgYnV0
IHlvdQ0KPiBhY3R1YWxseSBhZGQgbG9ja2luZyAoYW5kIEkgcmVhbGl6ZSB0aGlzIHdhcyB0aGVy
ZSBiZWZvcmUsIHNvIEknbSBzb3JyeQ0KPiBmb3Igbm90IHBvaW50aW5nIHRoaXMgb3V0IGVhcmxp
ZXIpLg0KV2VsbCwgSSB0aG91Z2h0IHRoYXQgdGhlIGRlc2NyaXB0aW9uIGFscmVhZHkgaGFzICIu
Li50aGUgbG9jayBjYW4gYmUNCnVzZWQgKGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0
IGF3YXkpIHRvIGNoZWNrIHdoZXRoZXIgdnBjaQ0KaXMgcHJlc2VudCIgYW5kIHRoaXMgaXMgZW5v
dWdoIGZvciBzdWNoIHVzZXMgYXMgaGVyZS4NCj4gICBCdXQgdGhlbiBJIHdvbmRlciB3aGV0aGVy
IHlvdQ0KPiBhY3R1YWxseSB0ZXN0ZWQgdGhpcywgc2luY2UgSSBjYW4ndCBoZWxwIGdldHRpbmcg
dGhlIGltcHJlc3Npb24gdGhhdA0KPiB5b3UncmUgaW50cm9kdWNpbmcgYSBsaXZlLWxvY2s6IFRo
ZSBmdW5jdGlvbiBpcyBjYWxsZWQgZnJvbSBjbWRfd3JpdGUoKQ0KPiBhbmQgcm9tX3dyaXRlKCks
IHdoaWNoIGluIHR1cm4gYXJlIGNhbGxlZCBvdXQgb2YgdnBjaV93cml0ZSgpLiBZZXQgdGhhdA0K
PiBmdW5jdGlvbiBhbHJlYWR5IGhvbGRzIHRoZSBsb2NrLCBhbmQgdGhlIGxvY2sgaXMgbm90IChj
dXJyZW50bHkpDQo+IHJlY3Vyc2l2ZS4gKEZvciB0aGUgM3JkIGNhbGxlciBvZiB0aGUgZnVuY3Rp
b24gLSBpbml0X2JhcnMoKSAtIG90b2gNCj4gdGhlIGxvY2tpbmcgbG9va3MgdG8gYmUgZW50aXJl
bHkgdW5uZWNlc3NhcnkuKQ0KV2VsbCwgeW91IGFyZSBjb3JyZWN0OiBpZiB0bXAgIT0gcGRldiB0
aGVuIGl0IGlzIGNvcnJlY3QgdG8gYWNxdWlyZQ0KdGhlIGxvY2suIEJ1dCBpZiB0bXAgPT0gcGRl
diBhbmQgcm9tX29ubHkgPT0gdHJ1ZQ0KdGhlbiB3ZSdsbCBkZWFkbG9jay4NCg0KSXQgc2VlbXMg
d2UgbmVlZCB0byBoYXZlIHRoZSBsb2NraW5nIGNvbmRpdGlvbmFsLCBlLmcuIG9ubHkgbG9jaw0K
aWYgdG1wICE9IHBkZXYNCj4NCj4gVGhlbiBhZ2FpbiB0aGlzIHdhcyBwcmVzZW50IGFscmVhZHkg
ZXZlbiBpbiBSb2dlcidzIG9yaWdpbmFsIHBhdGNoLCBzbw0KPiBJIGd1ZXNzIEkgbXVzdCBiZSBt
aXNzaW5nIHNvbWV0aGluZyAuLi4NCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5j
DQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaXguYw0KPj4gQEAgLTEzOCw3ICsxMzgsNyBA
QCBzdGF0aWMgdm9pZCBjb250cm9sX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1
bnNpZ25lZCBpbnQgcmVnLA0KPj4gICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2Jk
ZiwgcmVnLCB2YWwpOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBzdHJ1Y3QgdnBjaV9tc2l4
ICptc2l4X2ZpbmQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBhZGRyKQ0K
Pj4gK3N0YXRpYyBzdHJ1Y3QgdnBjaV9tc2l4ICptc2l4X2dldChjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIGFkZHIpDQo+PiAgIHsNCj4+ICAgICAgIHN0cnVjdCB2cGNpX21z
aXggKm1zaXg7DQo+PiAgIA0KPj4gQEAgLTE1MCwxNSArMTUwLDI5IEBAIHN0YXRpYyBzdHJ1Y3Qg
dnBjaV9tc2l4ICptc2l4X2ZpbmQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9u
ZyBhZGRyKQ0KPj4gICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShtc2l4LT50
YWJsZXMpOyBpKysgKQ0KPj4gICAgICAgICAgICAgICBpZiAoIGJhcnNbbXNpeC0+dGFibGVzW2ld
ICYgUENJX01TSVhfQklSTUFTS10uZW5hYmxlZCAmJg0KPj4gICAgICAgICAgICAgICAgICAgIFZN
U0lYX0FERFJfSU5fUkFOR0UoYWRkciwgbXNpeC0+cGRldi0+dnBjaSwgaSkgKQ0KPj4gKyAgICAg
ICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgc3Bpbl9sb2NrKCZtc2l4LT5wZGV2LT52cGNp
X2xvY2spOw0KPj4gICAgICAgICAgICAgICAgICAgcmV0dXJuIG1zaXg7DQo+PiArICAgICAgICAg
ICAgfQ0KPiBJIHRoaW5rIGRlbGliZXJhdGVseSByZXR1cm5pbmcgd2l0aCBhIGxvY2sgaGVsZCBy
ZXF1aXJlcyBhIHJlc3BlY3RpdmUNCj4gY29tbWVudCBhaGVhZCBvZiB0aGUgZnVuY3Rpb24uDQpP
aywgd2lsbCBhZGQgYSBjb21tZW50DQo+DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gICAgICAgcmV0
dXJuIE5VTEw7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIHZvaWQgbXNpeF9wdXQoc3RydWN0
IHZwY2lfbXNpeCAqbXNpeCkNCj4+ICt7DQo+PiArICAgIGlmICggIW1zaXggKQ0KPj4gKyAgICAg
ICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICBzcGluX3VubG9jaygmbXNpeC0+cGRldi0+dnBjaV9s
b2NrKTsNCj4+ICt9DQo+IE1heWJlIHNob3J0ZXINCj4NCj4gICAgICBpZiAoIG1zaXggKQ0KPiAg
ICAgICAgICBzcGluX3VubG9jaygmbXNpeC0+cGRldi0+dnBjaV9sb2NrKTsNCkxvb2tzIGdvb2QN
Cj4NCj4gPyBZZXQgdGhlcmUncyBvbmx5IG9uZSBjYXNlIHdoZXJlIHlvdSBtYXkgcGFzcyBOVUxM
IGluIGhlcmUsIHNvDQo+IG1heWJlIGl0J3MgYmV0dGVyIGFueXdheSB0byBtb3ZlIHRoZSBjb25k
aXRpb25hbCAuLi4NCj4NCj4+ICAgc3RhdGljIGludCBtc2l4X2FjY2VwdChzdHJ1Y3QgdmNwdSAq
diwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPj4gICB7DQo+PiAtICAgIHJldHVybiAhIW1zaXhfZmlu
ZCh2LT5kb21haW4sIGFkZHIpOw0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9tc2l4ICptc2l4ID0gbXNp
eF9nZXQodi0+ZG9tYWluLCBhZGRyKTsNCj4+ICsNCj4+ICsgICAgbXNpeF9wdXQobXNpeCk7DQo+
PiArICAgIHJldHVybiAhIW1zaXg7DQo+PiAgIH0NCj4gLi4uIGhlcmU/DQpZZXMsIEkgY2FuIGhh
dmUgdGhhdCBjaGVjayBoZXJlLCBidXQgd2hhdCBpZiB0aGVyZSBpcyB5ZXQNCmFub3RoZXIgY2Fs
bGVyIG9mIHRoZSBzYW1lPyBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgaXQgaXMgYmV0dGVyDQp0byBo
YXZlIHRoZSBjaGVjayBpbiBtc2l4X2dldCBvciBhdCB0aGUgY2FsbGVyIHNpdGUuDQpBdCB0aGUg
bW9tZW50ICh3aXRoIGEgc2luZ2xlIHBsYWNlIHdpdGggTlVMTCBwb3NzaWJsZSkgSSBjYW4NCm1v
dmUgdGhlIGNoZWNrLiBAUm9nZXI/DQo+DQo+PiBAQCAtMTg2LDcgKzIwMCw3IEBAIHN0YXRpYyBp
bnQgbXNpeF9yZWFkKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVk
IGludCBsZW4sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKmRhdGEp
DQo+PiAgIHsNCj4+ICAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47DQo+
PiAtICAgIHN0cnVjdCB2cGNpX21zaXggKm1zaXggPSBtc2l4X2ZpbmQoZCwgYWRkcik7DQo+PiAr
ICAgIHN0cnVjdCB2cGNpX21zaXggKm1zaXggPSBtc2l4X2dldChkLCBhZGRyKTsNCj4+ICAgICAg
IGNvbnN0IHN0cnVjdCB2cGNpX21zaXhfZW50cnkgKmVudHJ5Ow0KPj4gICAgICAgdW5zaWduZWQg
aW50IG9mZnNldDsNCj4+ICAgDQo+PiBAQCAtMTk2LDcgKzIxMCwxMCBAQCBzdGF0aWMgaW50IG1z
aXhfcmVhZChzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBpbnQg
bGVuLA0KPj4gICAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOw0KPj4gICANCj4+ICAgICAg
IGlmICggIWFjY2Vzc19hbGxvd2VkKG1zaXgtPnBkZXYsIGFkZHIsIGxlbikgKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICBtc2l4X3B1dChtc2l4KTsNCj4+ICAgICAgICAgICByZXR1cm4gWDg2RU1V
TF9PS0FZOw0KPj4gKyAgICB9DQo+PiAgIA0KPj4gICAgICAgaWYgKCBWTVNJWF9BRERSX0lOX1JB
TkdFKGFkZHIsIG1zaXgtPnBkZXYtPnZwY2ksIFZQQ0lfTVNJWF9QQkEpICkNCj4+ICAgICAgIHsN
Cj4+IEBAIC0yMjIsMTAgKzIzOSwxMCBAQCBzdGF0aWMgaW50IG1zaXhfcmVhZChzdHJ1Y3QgdmNw
dSAqdiwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBpbnQgbGVuLA0KPj4gICAgICAgICAg
ICAgICBicmVhazsNCj4+ICAgICAgICAgICB9DQo+PiAgIA0KPj4gKyAgICAgICAgbXNpeF9wdXQo
bXNpeCk7DQo+PiAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsNCj4+ICAgICAgIH0NCj4+
ICAgDQo+PiAtICAgIHNwaW5fbG9jaygmbXNpeC0+cGRldi0+dnBjaS0+bG9jayk7DQo+PiAgICAg
ICBlbnRyeSA9IGdldF9lbnRyeShtc2l4LCBhZGRyKTsNCj4+ICAgICAgIG9mZnNldCA9IGFkZHIg
JiAoUENJX01TSVhfRU5UUllfU0laRSAtIDEpOw0KPiBZb3UncmUgaW5jcmVhc2luZyB0aGUgbG9j
a2VkIHJlZ2lvbiBxdWl0ZSBhIGJpdCBoZXJlLiBJZiB0aGlzIGlzIHJlYWxseQ0KPiBuZWVkZWQs
IGl0IHdhbnRzIGV4cGxhaW5pbmcuIEFuZCBpZiB0aGlzIGlzIGRlZW1lZCBhY2NlcHRhYmxlIGFz
IGENCj4gInNpZGUgZWZmZWN0IiwgaXQgd2FudHMganVzdGlmeWluZyBvciBhdCBsZWFzdCBzdGF0
aW5nIGltby4gU2FtZSBmb3INCj4gbXNpeF93cml0ZSgpIHRoZW4sIG9idmlvdXNseS4NClllcywg
SSBkbyBpbmNyZWFzZSB0aGUgbG9ja2luZyByZWdpb24gaGVyZSwgYnV0IHRoZSBtc2l4IHZhcmlh
YmxlIG5lZWRzDQp0byBiZSBwcm90ZWN0ZWQgYWxsIHRoZSB0aW1lLCBzbyBpdCBzZWVtcyB0byBi
ZSBvYnZpb3VzIHRoYXQgaXQgcmVtYWlucw0KdW5kZXIgdGhlIGxvY2sNCj4gICAoSSdtIG5vdCBz
dXJlIFJvZ2VyIGFjdHVhbGx5IGltcGxpZWQgdGhpcw0KPiB3aGVuIHN1Z2dlc3RpbmcgdG8gc3dp
dGNoIHRvIHRoZSBnZXQvcHV0IHBhaXIuKQ0KPg0KPj4gQEAgLTMyNyw3ICszMzQsMTIgQEAgdWlu
dDMyX3QgdnBjaV9yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWdu
ZWQgaW50IHNpemUpDQo+PiAgICAgICBpZiAoICFwZGV2ICkNCj4+ICAgICAgICAgICByZXR1cm4g
dnBjaV9yZWFkX2h3KHNiZGYsIHJlZywgc2l6ZSk7DQo+PiAgIA0KPj4gLSAgICBzcGluX2xvY2so
JnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gKyAgICBzcGluX2xvY2soJnBkZXYtPnZwY2lfbG9jayk7
DQo+PiArICAgIGlmICggIXBkZXYtPnZwY2kgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBzcGlu
X3VubG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4+ICsgICAgICAgIHJldHVybiB2cGNpX3JlYWRf
aHcoc2JkZiwgcmVnLCBzaXplKTsNCj4+ICsgICAgfQ0KPiBEaWRuJ3QgeW91IHNheSB5b3Ugd291
bGQgYWRkIGp1c3RpZmljYXRpb24gb2YgdGhpcyBwYXJ0IG9mIHRoZSBjaGFuZ2UNCj4gKGFuZCBp
dHMgdnBjaV93cml0ZSgpIGNvdW50ZXJwYXJ0KSB0byB0aGUgZGVzY3JpcHRpb24/DQpBZ2Fpbiwg
SSBhbSByZWZlcnJpbmcgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGFzIGRlc2NyaWJlZCBhYm92ZQ0K
Pg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

