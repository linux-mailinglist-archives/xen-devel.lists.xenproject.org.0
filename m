Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DCF46DBAD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 19:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242582.419540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv28q-0002Xv-Ti; Wed, 08 Dec 2021 18:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242582.419540; Wed, 08 Dec 2021 18:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv28q-0002Vm-QG; Wed, 08 Dec 2021 18:58:12 +0000
Received: by outflank-mailman (input) for mailman id 242582;
 Wed, 08 Dec 2021 18:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8t+=QZ=epam.com=prvs=2976427baf=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mv28p-0002V9-CB
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 18:58:11 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8e041b5-5858-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 19:58:10 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B8IIcHf017591;
 Wed, 8 Dec 2021 18:58:00 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cu1v5r3c7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 18:57:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4756.eurprd03.prod.outlook.com (2603:10a6:208:ce::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Wed, 8 Dec
 2021 18:57:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 18:57:54 +0000
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
X-Inumbo-ID: c8e041b5-5858-11ec-9d12-4777fae47e2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tm3SnDGL8Iz+bz2RZGeUUOQNEgIyla1pVH/K04IbZTe/K05q+UZUHYC8gRGxgY+GFwkpmpEbmYSaaSJxDvf/qK8/u7nS0vtVQnxcSWebWNsBqqSJUxyLgbJFcMOP1KVnyH+15fw4Vn7ynrRQC9VGGgqoUIDbF+9cPHH5fvikfyoS1d0+jtALWCmCYGMqt05GL7G6rQIBL1FWG1353nskIW/Tu6uzo27/l1WN5HShqVEtI99ZJnvTRKQK7DD6vQulvhMGXU7dxah6QQsG6l0aH20KMEh1bYKkquJRaiLQNrhry1P1JYJX3pewPwJ92DgkIXQ0keMaKJLuwYeQ3IChOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtwYOVErdYcnDE29dzp/1xiMaWcfQH+VYOP7Z9qTzPg=;
 b=Xtl2k1xkkVfyzwfyg+sbA8EZa/YXX1Vwb6/4fQVbGj1dCSjqxlm4x2ZoddGd6XCabXwsf1VyZet5RuunI37oXthmPurQQfe8+rWPC9LuOgnrATgX3bEgg3nl6M9zF5eAhPTqMO7BDqq6fUzi33wWZrx7UzS/m/FvaX/jT3BXQ5Ts2k1WhcI7TAV92Pd5iD2WQtcIlNP0Hp9go54ECV93SFtzjDQQPXXbhzUK22kbog0tln8066cySFN2SQZhZsJgfltn/wi3WjJIR7a28eC0O+0YTWPlZ1B7KPNrYo4VLyssJ0Khtc6GoV9rkbLRdxVuSKv8Kp+u363g+KOfGmOoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtwYOVErdYcnDE29dzp/1xiMaWcfQH+VYOP7Z9qTzPg=;
 b=fz5WiMITSSfp58dUgeYcXpfLhL+/Std80BR522mvxN4XLXixUsml1JaM7fbzERPq6SG8x6NU5Vs3KkBT6I7Weql9V0fjgCmL3ts6bJYwfZvesvzJ7Fg81qntrgK3P+ZOmLsBYe9tGOA+2nBEHfLn7ZyvqNS8rZnXHY4x3itGXnh2Uj8Bs/W7/ih+zTgo/eGVDSFnaXoedDjCWu2neSkfNzly0qzRbBVrQccv4cjy2SIHY27V9c/TeUFLDORcpk69O0Z1g0M8TqoN94jGQWDesmYiA3UdYRXJs5yF4EVR21bPuFoc8LBLUJBxgBlFcsSVYP8Wcq5YbE+HaKIyDyrm6Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host
 bridge
Thread-Topic: [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host
 bridge
Thread-Index: AQHX4QlHTkep1sCXwU6sAzOhbUDnn6wo5hsAgAAi1QA=
Date: Wed, 8 Dec 2021 18:57:54 +0000
Message-ID: <de027721-5240-cf79-b932-4a1e36077e41@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-5-andr2000@gmail.com>
 <77326c24-9d2a-22ef-00cf-b89f1e70eaaf@xen.org>
In-Reply-To: <77326c24-9d2a-22ef-00cf-b89f1e70eaaf@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 258fa729-035e-4b8c-5441-08d9ba7ca48b
x-ms-traffictypediagnostic: AM0PR03MB4756:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB475634B5B65E285178C1A975E76F9@AM0PR03MB4756.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8wAg4pmHW30YVTEwme4vip0vSxqjPw7XwZH8ZLPMS4gHLb9+xvGdUDtVEZpdhdMB3PPLLpHKkc2WAi0F9qOriS8aQLwj1RHM0CUpqatu9d49Z5SPX8mK+Xmkn/ou+LDznnlBDb3Q10opwbmjtT1TrpwKeWQo3JK9e8pmV/aPYRbycz2rBKXvQJi7JLzi46hmHWzMUCy4/cKRGBtmeGaXOLVLF4Vf8G+DY0F8SA7fE8CaychmbjN5qPFixpy5KywCQyiJAY3omRpz1aTbqfrC9R1SyMneupP1LlWGsEfg/qmDoYnITL/Pmyo7MskUB1AzROWsculBp0PYkLG5qXg1HnmSQ0KMwEM+yvTxUP+GeR8gtitXKylx/uWgawAtJBmlL56vTuq/Tn3A3S+7HwzBySoevYygRHMwoUA2wuUjMbw3SdE6Le8cdTdInAS9hocFBtaH2LPQD2gW6kdXAPBapha1hkuXWZ8u047hbol7UQ70tM84nckBnnMYr+gwiJHtEkApmm89riwBk8AdJypyOVDdFsaU3S+RLLj1ya7cGKtZV7K0KXky2OJggBjahjbDorvZWQ6yeUCxOxv4rweglOIjuU2qboMq9HrvSA/EldObJaZ3jvWxj4y3o4ON4L56SIhgpVIl1ImFQX7fckD2kq4XHDSSd8LIIEqrUmeMcNF5rxQ11k1rlWj1s58EnWSHpb71yOFQ2j/rpvKu+iLe4Gys70Zc51JKDimRT5xG5sA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(55236004)(26005)(5660300002)(38070700005)(6512007)(122000001)(186003)(107886003)(4326008)(31696002)(508600001)(15650500001)(8936002)(110136005)(66446008)(6506007)(38100700002)(2616005)(86362001)(2906002)(66946007)(83380400001)(53546011)(66476007)(6486002)(31686004)(66556008)(64756008)(54906003)(36756003)(91956017)(7416002)(8676002)(76116006)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TENyQVMwVjFwUGxadmZkZllWK0tSdWllWDRnTEZjU3o3bjEvcTZKTnE5WVZl?=
 =?utf-8?B?YUxkN0hCMUkrYlh6aDhwd2Flc3VFZEk2WXNmUjRDNFIwcGRQOTlMbmk4L2tE?=
 =?utf-8?B?VnFvdnAyZG5jT0RuYkw5UWdyMHZSRTVxNzZyNjJyZFVBVzQxd0hlcTVDdTRY?=
 =?utf-8?B?RCs2c3hzRFhGTDhyQmFJa3cyYXBMYWM0UFZaMzVpdUZNcmdJWWV4ZnhuQ3Vu?=
 =?utf-8?B?cWlleHY2NG5JYk1hN1RNNGlma01HQkZMamlNU1ZWVWN3NUpqOGZ3OE0rY2RK?=
 =?utf-8?B?OXhQTVdIaTh6TitHUnB6RjRVN09yeEh6bHd4MVAybndqM1lTQkFCMi9UZGc0?=
 =?utf-8?B?QnBYY1RqNFFOT3l2QkZqRDZaNHI3NVg3M2Q1ejJ4cEVKWG5PQ1kySjE0OUhB?=
 =?utf-8?B?YysvK1c1SGR4MUNCZzNkU0txK0NOaVRYNzA1RUoycFdybUNNQVhDOHlYV3NC?=
 =?utf-8?B?TVRoblBUQlpOYXNmK09QaU1MQkQ0UUNtOHQ2dWhSOXo4dVVMeEZrZXZ6aXhz?=
 =?utf-8?B?UXFSRVpEY0J1ZTFGMWxEWW9LZlNSaHlOaFhob3V5dmRjUStENDNsWWpkWkJX?=
 =?utf-8?B?bHhPZUlsNjBqZ0NJekxobXVmOGdxNHNjSjlFNUdaRXRZQkczVzNGT2YvblJt?=
 =?utf-8?B?SFREZmRYM1FiZmpydGlBRFR4Vjdrc0NpeHpVbmFkZms1RnFxclB6Y2laV0oy?=
 =?utf-8?B?NUcrK1R5WisvN2NsZFJRK0dNTy9SOHU0RVFxQTFRdjZMVmtkR2NPMTRpczU3?=
 =?utf-8?B?bkFFOHpmWDA2OENHMDB0Z2cyU3VZd2lUYkZJL3JmaUMxd0ZGWlRXRU5zVlh2?=
 =?utf-8?B?MWJjMm9ldUNTdEp1dGsyR0pXTkJ5Y09yOXhnWTJRZzZld1dLQ2ZSUGlkZ2ZN?=
 =?utf-8?B?VFF2dkZWdDVVRmlRcjZEY09ONlU2dURaSzlveUNrVS9JSlhuQW9GRjA3S3du?=
 =?utf-8?B?VXd6dm9FQmM0SHh4YUZWV1JsUW44TVU3d2Q1RFAraktNUmtjcVdXUzFJa3F4?=
 =?utf-8?B?eDdGTXNndEdGek1WQWFwM0NZUVQ5WU15UjlqUVJzRjJGeERKb2dJem91Rjlv?=
 =?utf-8?B?aGl5UUxTYmIvTDRtMW50YjdHVEpDcUQrZDZyWjJTc1ljL0FvTEFnTnhMVVM5?=
 =?utf-8?B?NnlRREh4cCtsU2xKenlUYWRmQjFER3JGT0l6WmErc3pmZEZzNVZrckdkK2RD?=
 =?utf-8?B?U0pPRmc3N2JDaWFlQlFsbU1rOVRkS2tveVFmQzd3S09sZVFHbi9HNlNDN0lj?=
 =?utf-8?B?amlERWVtV2VNZjA3NW5pOTI1K1hUc2ZGUWtoekJrTHNGUnRBTGxURDZUWWNm?=
 =?utf-8?B?UHd1aUUvOTRRRk5MOVYzTlExYkVXcjhONVdYTFRQYXR5YjBDTHpzVjg3cVIy?=
 =?utf-8?B?MjFNQjVFYWZQYVhtVG93bWMySkF4YzlnSFRwMUN6WlVXQnVpNUwvc1dCTGZO?=
 =?utf-8?B?am9vMXR2SExZRzlaTUVGNVd6Y0ZIL2xpVU1ZWGlXUVZFa0t3THgwQ2wvQWwz?=
 =?utf-8?B?N21RL3FSdnF5YVhKNThBWDNmdi9MbXg4N0lUd0p4SjV0bDNmUkNsK0VVR2pt?=
 =?utf-8?B?dGU2bGdLMVJUZWJ4Umx6RmFLZUJaUlU4SngyVGR5cVVlTzJhdVFuaUowb3VG?=
 =?utf-8?B?VW90RDVlR3N0bFhkOFowY01WblZoL1ZPdnM5N1FLUHBqUEp0a0VleFZ1Zjdt?=
 =?utf-8?B?cXZzWUJZZ3FVNmRIL2JXMmtQMmM0T0ZVMWhKUnZWQm1uRnBLVWllMmsxemhZ?=
 =?utf-8?B?QUFKaDZPdkdIRXdpeGtHWUVMZy8zdU9TY3VNWE54M2RuempHNjVGZThnRlZE?=
 =?utf-8?B?Q0NrOUdsS1dYRFRPajRkb0lsa1pZMnI2WUdiaDVMUnZvaXY1MGQyQWRwU0Jq?=
 =?utf-8?B?T01jUmJhV0U5dVB4cS9PbDBiaHhXNzRQd2hzN3pob2tKN0R0WCt2NFdjam5Q?=
 =?utf-8?B?Qmp2WElaMjNvbUJGQ0lCeDdkTnQ2VGRTL2o4TUNZazJyeE5rcENXWGtMSU5L?=
 =?utf-8?B?TzJ6dVcwbnlMTVFob1p5bS9LYXlEMTAxYUxKa01ibUVjZldsRjhnckZKdEVl?=
 =?utf-8?B?eFczY0tVc1pVUFo5S0FQb2gzSFhyQVZDYXpheUNjWVNyQXhzS0Z2cjVXbmRM?=
 =?utf-8?B?NVVMU3VkeWloWXIyUXI3WWxhMjZ1UWw1TGZWamxUSTJYT3ljcHg4Z0FSY1hv?=
 =?utf-8?B?Z1dHUkkxc2JBZTdDYWtjdnRlRjJmM0gweW80SEp0dFdzbndzR0FPczNBdjEz?=
 =?utf-8?B?TmljM2krREt5ZXk3VC9sREw4NUpQOEdPSjQwbTJFN3ZpdjlCMThVeW16dWRp?=
 =?utf-8?B?aGVJUWJtU1E0MmNEQlltUU5FUEV6bXF1NU0ycWtHamI0YmhXK2FBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71C9D1384DF44B4585A2C47FC9AE3FB5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258fa729-035e-4b8c-5441-08d9ba7ca48b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 18:57:54.8472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMYTFgreI+MwBc5CteqixGRWT4kVjppAsbKKatbl2Cc+U/hT6TB4N2Zr9aj6KIGSYZ13dRXzfT7gMa9LpTOOWDNcwqB+Gy1aR7CDjiLHswv8nBmhc+ySXaB93+iqlwC8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4756
X-Proofpoint-ORIG-GUID: ra6JDGHTWjq1gUWF8-45QZzXyvvbN1nt
X-Proofpoint-GUID: ra6JDGHTWjq1gUWF8-45QZzXyvvbN1nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxlogscore=932 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080107

SGksIEp1bGllbiENCg0KT24gMDguMTIuMjEgMTg6NTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAyNC8xMS8yMDIxIDA3OjU5LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBBdCB0aGUgbW9tZW50LCB3ZSBhbHdh
eXMgYWxsb2NhdGUgYW4gZXh0cmEgMTYgc2xvdHMgZm9yIElPIGhhbmRsZXJzDQo+PiAoc2VlIE1B
WF9JT19IQU5ETEVSKS4gU28gd2hpbGUgYWRkaW5nIGFuIElPIHRyYXAgaGFuZGxlciBmb3IgdGhl
IGVtdWxhdGVkDQo+PiBQQ0kgaG9zdCBicmlkZ2Ugd2UgYXJlIG5vdCBicmVha2luZyBhbnl0aGlu
ZywgYnV0IHdlIGhhdmUgYSBsYXRlbnQgYnVnDQo+PiBhcyB0aGUgbWF4aW11bSBudW1iZXIgb2Yg
SU9zIG1heSBiZSBleGNlZWRlZC4NCj4+IEZpeCB0aGlzIGJ5IGV4cGxpY2l0bHkgdGVsbGluZyB0
aGF0IHdlIGhhdmUgYW4gYWRkaXRpb25hbCBJTyBoYW5kbGVyLCBzbyBpdCBpcw0KPj4gYWNjb3Vu
dGVkLg0KPj4NCj4+IEZpeGVzOiBkNTkxNjhkYzA1YTUgKCJ4ZW4vYXJtOiBFbmFibGUgdGhlIGV4
aXN0aW5nIHg4NiB2aXJ0dWFsIFBDSSBzdXBwb3J0IGZvciBBUk0iKQ0KPg0KPiBJbiBnZW5lcmFs
LCBpdCBpcyBiZXR0ZXIgdG8gaGF2ZSB0aGUgZml4ZXMgYXQgdGhlIGJlZ2lubmluZyBvZiBhIHNl
cmllcy4gU28gdGhleSBhcmUgcmVseWluZyBvbiBsZXNzIHJld29yayBhbmQgZWFzaWVyIHRvIGJh
Y2twb3J0IChpZiBuZWVkZWQpLg0KPg0KPiBJbiB0aGlzIGNhc2UsIFBDSSBwYXNzdGhyb3VnaCBp
cyBzdGlsbCBhIHRlY2huaWNhbCBwcmV2aWV3IHNvIGl0IGRvZXNuJ3QgbWF0dGVyIHRvbyBtdWNo
Lg0KSSBhbSBwbGFubmluZyB0byByZXNlbmQgdGhlIHdob2xlIHNlcmllcywgc28gSSBjYW4gbW92
ZSB0aGlzIHRvIHRoZSBib3R0b20sDQpidXQgaXQgaXMgaW5kZWVkIGRvZXNuJ3QgbWF0dGVyIGF0
IHRoZSBtb21lbnQNCj4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+ID4NCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdnBjaS5jIGIveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gaW5kZXgg
Y2NkOTk4ZDhkYmEyLi44ZTgwMWYyNzU4NzkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
dnBjaS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBAQCAtMTI2LDcgKzEyNiw4
IEBAIHVuc2lnbmVkIGludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxlcnMoc3RydWN0
IGRvbWFpbiAqZCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0IDwgMCA/IDAgOiBy
ZXQ7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIC3CoMKgwqAgcmV0dXJuIDA7DQo+PiArwqDCoMKg
IC8qIEZvciBhIHNpbmdsZSBlbXVsYXRlZCBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRpb24gc3Bh
Y2UuICovDQo+DQo+IFRoaXMgY29tbWVudCBpcyBsYWNraW5nIHNvbWUgY29udGV4dC4gSSB3b3Vs
ZCBzdWdnZXN0IHRvIHJld29yZCB0byBzb21ldGhpbmcgbGlrZToNCj4NCj4gIkZvciB0aGUgZ3Vl
c3RzLCBlYWNoIGhvc3QgYnJpZGdlIHJlcXVpcmVzIG9uZSByZWdpb24gdG8gY292ZXIgdGhlIGNv
bmZpZ3VyYXRpb24gc3BhY2UuIEF0IHRoZSBtb21lbnQsIHdlIG9ubHkgZXhwb3NlIGEgc2luZ2xl
IGhvc3QgYnJpZGdlLg0KPiAiDQo+DQpPaywgd2lsbCBjaGFuZ2UNCj4gV2l0aCB0aGF0IChvciBh
IHNpbWlsYXIgY29tbWVudCk6DQo+DQo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KVGhhbmsgeW91LA0KT2xla3NhbmRyDQo+DQo+IENoZWVycywNCj4NCg==

