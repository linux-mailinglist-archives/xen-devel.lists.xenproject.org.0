Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B996697D6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 13:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477288.739929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJd4-0004nN-Vo; Fri, 13 Jan 2023 12:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477288.739929; Fri, 13 Jan 2023 12:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJd4-0004lZ-Sn; Fri, 13 Jan 2023 12:57:54 +0000
Received: by outflank-mailman (input) for mailman id 477288;
 Fri, 13 Jan 2023 12:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wa25=5K=zf.com=youssef.elmesdadi@srs-se1.protection.inumbo.net>)
 id 1pGJd3-0004lT-LL
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 12:57:53 +0000
Received: from de-smtp-delivery-114.mimecast.com
 (de-smtp-delivery-114.mimecast.com [194.104.109.114])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e267a9f2-9341-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 13:57:50 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-E39RiVznMZKprJ2LD2wYHQ-1; Fri, 13 Jan 2023 13:56:55 +0100
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::22) by AS4PR08MB7902.eurprd08.prod.outlook.com
 (2603:10a6:20b:51d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 12:56:38 +0000
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7]) by AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::f7f1:3b45:d707:62b7%2]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 12:56:38 +0000
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
X-Inumbo-ID: e267a9f2-9341-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zf.com; s=mczfcom20220728;
	t=1673614669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMUsDPjysjWhzAncie4fu+q+QTc09bE4gxqQRsqN9X0=;
	b=dAwbw9rYY/wJ7bfJkNpEha8u4TMMswWtjF8VXo2PNVH0u9dFRc1I7ZxTXa5zLCeYXPT9WV
	eqjp09fNHiNM2YYZNDCxXrwZqpC8NqqVa5aoLSpTYiWQpsMGODCj7VJfrg0iZJGga7adOr
	0EfzqAX4YJl/u7qq2nsg1uA5MHpBI3U=
X-MC-Unique: E39RiVznMZKprJ2LD2wYHQ-1
From: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
Subject: AW: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Thread-Topic: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Thread-Index: Adkk/qg7kRGuW6KDReaFxxX6SSJ/1gA5Tq8AAFmZfbA=
Date: Fri, 13 Jan 2023 12:56:37 +0000
Message-ID: <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
In-Reply-To: <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Enabled=true;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SetDate=2023-01-13T12:56:36Z;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Method=Privileged;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Name=Internal sub2 (no
 marking);
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SiteId=eb70b763-b6d7-4486-8555-8831709a784e;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ActionId=62bd4c74-7e48-455d-9bb2-d2a1b76962ae;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR0802MB2578:EE_|AS4PR08MB7902:EE_
x-ms-office365-filtering-correlation-id: 07d9372f-a365-415d-36d6-08daf5659bbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 7uBGEolo32bHL7pxc4Ohyim7FqDH48DZmsQr6NPFm0oXN/neYWGTIL1i7x0uDYvi60oB78iit0cmRfZT9YzhWA2Vh3h6vqX+6tzLtFKsI6i678yJttQsKJaIHxIiIej6VkhxtmKvw41CVWTbNZ4VwW1M71ENicUUuSC1XJOMQ607jyhjzDNY6VXyvQrd6YDi3Nq9oDbIQCarLsSlIBVlbLoyl2XMMx6vGdhpW8r8biqJH6XoxPEihRDQ8oXrf7ULxXqziK6DkpVB1OJPfdYrhXoqpECNPLePTnTWJrwJ+KXe7CWk1xO/AVnpF5TTS2YAXI5mUDprNwSIeepvarbAHOtzIjFdrJoeWZaxbU4Q313qw2TOaNGgZxWgJ2MtzPN22FtZo2Ogq4pM2/ZWf6ovvXFvvfh41D0J8FJYC0Vq0CCopoUcLbM1vWmZXAsoFeFroxD9bsPlxoxvWd81MmyhGXv92KM/8QaYfSU6+D82ZtFnI0+MPhq4Yo5zIhkmrwLcKImc+H2ZzzUOXwTDVLHJPZk2in8I6WAGLKKhbtkT8uEPJT36AZlFeET6zp8P3auPHV1OqkzP8ULFde7ecmVmTjTMe7/mhy+UT7oKKI2wiuE88XaAOABpxXpsynHdGl4NmsmM2WpC0RuwLomoM+Jw26BFYgsH4QxEosAC02aDhJoNuaO4agCOFxZfUUJc35+YBMcIeRZoiAohGbA35t9vhg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0802MB2578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(186003)(26005)(71200400001)(66556008)(9686003)(76116006)(478600001)(110136005)(53546011)(316002)(4326008)(8676002)(7696005)(64756008)(66476007)(66446008)(6506007)(66946007)(52536014)(66574015)(38100700002)(33656002)(8936002)(86362001)(5660300002)(83380400001)(55016003)(122000001)(41300700001)(82960400001)(38070700005)(2906002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3o3d0pLaEZDeGt5eEJ3S081T3QyNUxJeWhCMG4wRG5XTWRPVkJEY25RVVBQ?=
 =?utf-8?B?SkpFUStVeG5nL1NHc1VPZHFQTmJaVnhPSVRhb2VsejNLUWxQVUs3WC9UT3F1?=
 =?utf-8?B?ckFtaytQcGlZUVRobWdrZHRxRVUranU0akUzMktwNkg2blVLMDc0Q21rdU1r?=
 =?utf-8?B?dHo3ZWVtNEFjYi9YZEpCc3BNVktuRlVvUVNDSnBaU1JFM2huZ3dONisyRzdN?=
 =?utf-8?B?TWQwQm11QWI3NUM5Y0RQYmtET0RBOFh6TnZtWWRPbTBucjg1L29oRDNCWWI3?=
 =?utf-8?B?WHlKNWJHYXdLVVBSVG9TeTJnUXY1NEdFT2NPU091Y1hKZ284QS90am1Gek03?=
 =?utf-8?B?NThpUktvVk1YMTV1cElOeE9YaEUrNHRWV1FVaVNJcy9abG05bm5lRlYwb0tp?=
 =?utf-8?B?c0E0OUNJTWkvZFRKNXhxc09ZVEQ4QUdoamdkQ09ic29Fa3haMk4vQ2JtQkNX?=
 =?utf-8?B?V3hrSzJTKzJQbmhTUnVDTC9HMUVVeUpsYnhmNEY5V1hNbFhteHlwWk04QTVq?=
 =?utf-8?B?TkR1YkV4ZW5rNjYyYjdndDFES2o0M1ptRkJwTnNOaE5uTkNXdDdKaTlHVXB1?=
 =?utf-8?B?Z0VmS01CYjhPUkhuQ2E1d1AwMG4xSXJ4M0lzRVNaaTZMYlJvbndQbHRPR0Ji?=
 =?utf-8?B?L1plSWtOeHppYmY1WlRHaEQvd29sZEc2bHpQTmsrZE1JTDlRK0FiVU1xYy80?=
 =?utf-8?B?WlI3VFVuVXg5NnZORTZIcGQ5Vm5uUUF2NS9QUVB3YzBQNTVMbnBCTE1IRXg2?=
 =?utf-8?B?N1FxK0JaWVhyMHJHU3VrdThYNC9pb3F5ODd0V2Rqd1RZdDdMMHNpbE5ndUdC?=
 =?utf-8?B?b2ZSSnJzV0VTalFXeE9pYklHTWJabjhXdC8wY0x3UzJZTzc2VzJpcmQ2cmxR?=
 =?utf-8?B?cU5BQlJJbjhYSWRMQm0zemM4cG1QWW5zdU9CaFFjZSthOStVc2RqRzErMmZ2?=
 =?utf-8?B?UHlNclNPV0pEWllWU3JrWUVMbDRmbWhUZzhRVU4rSW1oOWN2RW9XNEtiT0Qv?=
 =?utf-8?B?QUs0Qld5WVR0SUJ0OVhwYzNoSUowemlibnZoSHhQTXNqUVduUDV1Ky94Sy9B?=
 =?utf-8?B?VS9xaGlhbmpmeFp0OUhweVVIZk5HUlhFMEJGV1pHNVNZMTZ2UmZubTlaRjB3?=
 =?utf-8?B?RmF5M3pudXE3aHNNdE9DN1VzMnlvcURIYjhkV2NSbVdqM1YxbEQwYktHQlZK?=
 =?utf-8?B?SWVHdjgvMHdOdEcwVUxlN29FUmw4ekcxWWJRUm5ZZEFvRXp5YVdzc2FrZGQy?=
 =?utf-8?B?Y0lWN2V4NkpvcVJXMHFlTGNmTS8rU2tsR2lWUEQ0WTVyMExnRG1KblcwZVE0?=
 =?utf-8?B?eVVmQ2pUSk5BZTBOQ1JBZ3JFekNZZll6U2NsWDFsT2VFbmo0N2FWa2tlTlNw?=
 =?utf-8?B?SGxJUlMzU1RndEhpbVpmVXV4c29LZEFqOEplaDVUY2dMZlcvSVNVVmlOaXk3?=
 =?utf-8?B?OXRBNFAyNHVqamVNelRRcEcvenNyYnRISmkyN2VqUGZQZHk4dDllSXo2bTQz?=
 =?utf-8?B?MTEzNU9CdXpGcU9WMzhCVzhlRzE5MVUySXYwMTVNMG52ajlBbVRLUmcxbGlr?=
 =?utf-8?B?UjFJNWs2a1JzR3poeFVXdWVSbkhhWWNNK0JVZUZUdFJBL2VkV0laSFp5ditJ?=
 =?utf-8?B?VnZwc1MyZEludWg2L28zcWpXUU9GclFvMEliaTRnMmY4Y3ZVdEtES3pmNWZn?=
 =?utf-8?B?elpvaTQvY3IzOXlHYTZiWVk4SDBNb1hRenVGR0lxejNlVWNVNS9obm5JK2o1?=
 =?utf-8?B?U2hoUDlPaCtZd2k4S3hjQWlyOWRFWlprQitmK3QxaWtQditqL05hVEZUMDlv?=
 =?utf-8?B?U09VRFNkdDArSXBNQUxiTGdzQW93Z25yMVFvTldLZ2lyaXhUcFo5cGZBZEd2?=
 =?utf-8?B?NEZRTGZqbVVJeTNzS2xZS0JrKzlFQzd0WXo1d3BiZ0VnVE5RWDFlVUltbGtP?=
 =?utf-8?B?czRVOGo3VDNjWUN1dXZHRDQ0b0VsV010OW95Z3c5aHB3MHp2eDlpYVJ2aUNE?=
 =?utf-8?B?ZW8zdDdPZGtUY0pHNU5uRUNtbEI3ZnorZ1ZTN2dHeVNjQlcvMXpsTzRBbXhs?=
 =?utf-8?B?Zk5aUXFBaThvTHNiS1BoMFFhOUxRdmpYcmRFaS8wNDlhejZrd0pKR2dUNTk5?=
 =?utf-8?Q?TTaDZmeLVcEdJFYD7akDg8vyQ?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: D9N/iigl+XCQcsE8GI8Hq89fAzx8nbNo/+dl30tYT3L2KGRBLVXB1o5GzY84K7IdpGovoKJkRtthAWi85RlT49iDSDZrPcYxfAyevErtF4f9Sf+PyloK6foqaZwiOA2yarPic/iThaUxqGKbzd7FFKWC+RVcm2N/u21F5jRaEGFY3ehnTKy1tztgzvxDcu3sL7/j6Msx+xFlEVec7+t1rAeQszcloFqoHP+tFGQhIWwoSxeZlC4OPCBTw39A2oCwCElKNfIfsCDuNcQi6oMYAKs19c3MZg/oFahw/cK0k2UklOTy8wu9Key1oUf4zq58teIc04HqOBJ9hIh5s+O0FYShG9tqa00piUmfhi+84ElmmiEy/lehkU/lwBLddhZHspSqY/Ikz8lJXPgxgxh8vq56XU2BLuGGWQV2mut3FixS/w8WW5oCn8GtYuT50HxlxwHl5Rx/GXVHv2RQ1m6+4RMID9giix5XneXavfUxQCcYXrGaPoV7fJdnUdsrCHm2vIsMCqxnixEyceC6H2HdUal6jgSuX8DHBm3FOsz+g2J0KFpu0kaPlCrrqZKovnThiz0LgAmWJEHX4b62jRBJLbGeQqVkY8kD8h8Lzlc8EPTL85Znl9o/teVtfF2AQLvOY686Qur/nB8W1C6uSRLyUreTDpqre3GiWPaMvUa2DMdVQPAzaWim6v2hdY9BbALjuHNnxcFNRkP6Rerr9ImG43L9xTjUonDWABXrYDmYVmboDMuwYRHfHmSqfUmulsZp7Dv9rb5/5MxvxkG/w0LdYI5JUjAxnilBW9KuDfSCY/93s2DjZEzeEARCELCGP26lZH8C4G+QMMXsHIB1KbRqlQ==
X-OriginatorOrg: zf.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0802MB2578.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d9372f-a365-415d-36d6-08daf5659bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 12:56:37.9626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb70b763-b6d7-4486-8555-8831709a784e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 827A1b/PMh/l5vQA4f44tosUIhvKkZe0PUacIPwmkKukDwq9pQKuX4srmOq8XRTItknbSaRbys4X6t3DRDvtbscbvKCIASTiR1uQ78vgAbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7902
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zf.com
Content-Language: de-DE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8gSnVsaWVuLA0KDQo+Pj54ZW50cmFjZSBzaG91bGQgd29yayBvbiB1cHN0cmVhbSBYZW4u
IFdoYXQgZGlkIHlvdSB2ZXJzaW9uIGRpZCB5b3UgdHJ5PyANCg0KV2hpbGUgYnVpbGRpbmcgbXkg
aW1hZ2UgdXNpbmcgdGhlIEJTUC1saW51eCBvZiBOWFAsIHRoZSB2ZXJzaW9uIHRoYXQgd2FzIGRv
d25sb2FkZWQgaXMgWGVuIDQuMTQuIA0KDQoNCj4+PkNhbiB5b3UgYWxzbyBjbGFyaWZ5IHRoZSBl
cnJvciB5b3UgYXJlIHNlZW4/DQoNClRoZSBlcnJvciBJIHJlY2VpdmUgd2hpbGUgdGlwcGluZyB4
ZW50cmFjZSBpczogQ29tbWFuZCBub3QgZm91bmQuIEkgYXNzdW1lIGluIHRoaXMgWGVuIHZlcnNp
b24sIFhlbnRyYWNlIGlzIG5vdCBjb21wYXRpYmxlIHdpdGggQVJNIGFyY2hpdGVjdHVyZS4NCg0K
TXkgcXVlc3Rpb24gaXMsIGlzIHRoZXJlIGFueSBuZXcgdmVyc2lvbiBvZiBYZW4gdGhhdCBzdXBw
b3J0cyBYZW50cmFjZSBvbiBBUk0/IElmIHllcyBob3cgY291bGQgSSBpbnN0YWxsIGl0PyBCZWNh
dXNlIFhlbi40LjE0IHdhcyBpbnN0YWxsZWQgYXV0b21hdGljYWxseSBieSB0eXBpbmcgdGhpcyAo
IERJU1RST19GRUFUVVJFU19hcHBlbmQgKz0gInhlbiIpIGluIHRoZSBsb2NhbC5jb25mIGZpbGUg
d2hpbGUgY3JlYXRpbmcgbXkgaW1hZ2UuDQoNCk9yIGlzIHRoZXJlIGFueSBzb3VyY2Ugb24gWGVu
dHJhY2UgdGhhdCBpcyBjb21wYXRpYmxlIHdpdGggQVJNIG9uIEdpdEh1YiwgdGhhdCBJIGNvdWxk
IGRvd25sb2FkIGFuZCBjb21waWxlIG15c2VsZj8NCg0KDQo+Pj5ZZXMgaWYgeW91IGFzc2lnbiAo
b3IgcHJvdmlkZSBwYXJhLXZpcnR1YWxpemVkIGRyaXZlcikgdGhlIEdQSU8vTEVEL0Nhbi1JbnRl
cmZhY2UgdG8gdGhlIGd1ZXN0Lg0KDQpJcyB0aGVyZSBhbnkgdHV0b3JpYWwgdGhhdCBjb3VsZCBo
ZWxwIG1lIGNyZWF0ZSB0aG9zZSBkcml2ZXJzPyBBbmQgaG93IGNvbXBsaWNhdGVkIGlzIHRoYXQs
IHRvIGNyZWF0ZSB0aGVtPw0KDQpPciBjYW4gdGhleSBiZSBhc3NpZ25lZCBqdXN0IHdpdGggUENJ
LVBhc3N0aHJvdWdoPw0KDQoNCg0KVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSBoZWxwLg0KDQpD
aGVlcnMsDQpZb3Vzc2VmIEVsIE1lc2RhZGkNCg0KDQotLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hy
aWNodC0tLS0tDQpWb246IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IA0KR2VzZW5kZXQ6
IE1pdHR3b2NoLCAxMS4gSmFudWFyIDIwMjMgMTg6NDENCkFuOiBFbCBNZXNkYWRpIFlvdXNzZWYg
RVNLIFVJTEQ3IDx5b3Vzc2VmLmVsbWVzZGFkaUB6Zi5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQpCZXRyZWZmOiBSZTogWGVuYWx5emUgb24gQVJNICggTlhQIFMzMkczIHdpdGggQ29ydGV4
LUE1MykNCg0KKCtTdGVmYW5vKQ0KDQpPbiAxMC8wMS8yMDIzIDE0OjIwLCBFbCBNZXNkYWRpIFlv
dXNzZWYgRVNLIFVJTEQ3IHdyb3RlOg0KPj4+IEhlbGxvLA0KPiANCj4+Pg0KPiBJJ20gdHJ5aW5n
IHRvIG1lYXN1cmUgdGhlIHBlcmZvcm1hbmNlIG9mIFhlbiBvbiB0aGUgUzMyRzMgbWljcm9wcm9j
ZXNzb3IsIHVuZm9ydHVuYXRlbHksIGFmdGVyIGZvbGxvd2luZyB0aGUgQlNQLUxpbnV4IHRvIGlu
c3RhbGwgWGVuLCBJIGZvdW5kIHRoYXQgWGVudHJhY2UgaXMgbm90IGF2YWlsYWJsZSBvciBub3Qg
Y29tcGF0aWJsZSB3aXRoIEFSTSBhcmNoaXRlY3R1cmUuIEkgaGF2ZSBzZWVuIHNvbWUgc3R1ZGll
cyBvbiAgWGlsaW54LCBhbmQgaG93IHRoZXkgbWFkZSBYZW50cmFjZSBjb21wYXRpYmxlIHdpdGgg
QVJNLCBidXQgSSBoYXZlIG5vIHJlc291cmNlcyBvciBhY2Nlc3MgdG8gZ2V0IHRoYXQgYW5kIG1h
a2UgaXQgd29yayBvbiBteSBCb2FyZC4gSWYgdGhlcmUgaXMgYW55IGhlbHAgSSB3b3VsZCBhcHBy
ZWNpYXRlIGl0IGFuZCB0aGFua3MgaW4gYWR2YW5jZS4NCg0KeGVudHJhY2Ugc2hvdWxkIHdvcmsg
b24gdXBzdHJlYW0gWGVuLiBXaGF0IGRpZCB5b3UgdmVyc2lvbiBkaWQgeW91IHRyeT8gDQpDYW4g
eW91IGFsc28gY2xhcmlmeSB0aGUgZXJyb3IgeW91IGFyZSBzZWVuPw0KDQo+IA0KPj4+IEkgaGF2
ZSBzb21lIGV4dHJhIHF1ZXN0aW9ucywgYW5kIGl0IHdpbGwgYmUgaGVscGZ1bCB0byBzaGFyZSB5
b3VyIA0KPj4+IGlkZWFzIHdpdGggbWUsDQo+IA0KPiANCj4gICAgKiAgIElzIGl0IHBvc3NpYmxl
IHRvIHJ1biBhIG5hdGl2ZSBhcHBsaWNhdGlvbiAoIEMtY29kZSkgb24gdGhlIHZpcnR1YWwgbWFj
aGluZSwgdHVybiBvbiBhIExFRCwgIGhhdmUgYWNjZXNzIHRvIHRoZSBHUElPLCBvciBzZW5kIHNv
bWUgbWVzc2FnZXMgdXNpbmcgQ2FuLUludGVyZmFjZT8NCg0KWWVzIGlmIHlvdSBhc3NpZ24gKG9y
IHByb3ZpZGUgcGFyYS12aXJ0dWFsaXplZCBkcml2ZXIpIHRoZSBHUElPL0xFRC9DYW4tSW50ZXJm
YWNlIHRvIHRoZSBndWVzdC4NCg0KPiAgICAqICAgTXkgQm9hcmQgaGFzIG5vIEV0aGVybmV0LCBh
bmQgbm8gRXh0ZXJuIFNEIENhcmQsIGlzIHRoZXJlIGFueSBtZXRob2QgSSBjYW4gdXNlIHRvIGJ1
aWxkIGEga2VybmVsIGZvciBhbiBvcGVyYXRpbmcgc3lzdGVtIHdpdGggbXkgbGFwdG9wLCBhbmQg
dHJhbnNmZXIgaXQgdG8gdGhlIGJvYXJkPw0KDQpJIGFtIGNvbmZ1c2VkLCBpZiB5b3UgZG9uJ3Qg
aGF2ZSBuZXR3b3JrIGFuZCBhbiBleHRlcm5hbCBzZGNhcmQsIHRoZW4geW91IGRpZCB5b3UgZmly
c3QgcHV0IFhlbiBvbiB5b3VyIHN5c3RlbT8NCg0KSW4gdGhlb3J5IHlvdSBjb3VsZCB0cmFuc2Zl
ciB0aGUgYmluYXJ5ICh1c2luZyBiYXNlNjQpIHZpYSB0aGUgc2VyaWFsIGNvbnNvbGUuIEJ1dCB0
aGF0J3MgaGFja2lzaC4gSW5zdGVhZCwgSSB3b3VsZCByZWNvbW1lbmQgdG8gc3BlYWsgd2l0aCB0
aGUgYm9hcmQgdmVuZG9yIGFuZCBhc2sgdGhlbSBob3cgeW91IGNhbiB1cGxvYWQgeW91ciBvd24g
c29mdHdhcmUuDQoNCj4gICAgKiAgIEFueSBzdWdnZXN0aW9ucyBpbiBkZXRhaWwgdG8gbWVhc3Vy
ZSB0aGUgaW50ZXJydXB0IGxhdGVuY3ksIFhlbiBPdmVyaGVhZCwgYW5kIHN3aXRjaCBjb250ZXh0
ICh0aW1lIHRvIHN3aXRjaCBmcm9tIG9uZSBWTSB0byBhbm90aGVyLCB0aGF0J3Mgd2hhdCBJIHdh
bnRlZCB0byBtZWFzdXJlIHdpdGggWGVuYWx5emUpDQoNCnhlbnRyYWNlIHdpbGwgYmUgeW91ciBi
ZXN0IGJldC4gT3RoZXJ3aXNlLCB5b3Ugd2lsbCBuZWVkIHRvIGltcGxlbWVudCBjdXN0b20gdHJh
Y2luZy4NCg0KQ2hlZXJzLA0KDQotLQ0KSnVsaWVuIEdyYWxsDQoNCg==


