Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1468F07C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491826.761139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlBn-0002ew-GC; Wed, 08 Feb 2023 14:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491826.761139; Wed, 08 Feb 2023 14:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlBn-0002d1-D0; Wed, 08 Feb 2023 14:12:47 +0000
Received: by outflank-mailman (input) for mailman id 491826;
 Wed, 08 Feb 2023 14:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIHb=6E=zf.com=youssef.elmesdadi@srs-se1.protection.inumbo.net>)
 id 1pPlBm-0002cv-11
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:12:46 +0000
Received: from de-smtp-delivery-114.mimecast.com
 (de-smtp-delivery-114.mimecast.com [194.104.111.114])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a70ae629-a7ba-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 15:12:44 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-gXXzry2_PdWF3BQo1NdXIg-1; Wed, 08 Feb 2023 15:12:17 +0100
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::22) by AS8PR08MB6328.eurprd08.prod.outlook.com
 (2603:10a6:20b:33e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 14:12:01 +0000
Received: from AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::2fae:319e:cfcf:3caf]) by AM5PR0802MB2578.eurprd08.prod.outlook.com
 ([fe80::2fae:319e:cfcf:3caf%11]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:12:01 +0000
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
X-Inumbo-ID: a70ae629-a7ba-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zf.com; s=mczfcom20220728;
	t=1675865562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oQKq6ajN8oDT2FKzdhA8RMNRAkIGl3uF/n3oq3V9AzE=;
	b=jEhSqxwrWqIZKoNFL3iK21x13JeMgSzWY0LtWzalPEDOiO5vO+p0lfJ6hjqltNLw21T8jv
	Z3kRrxosBgV0dhJv4LnL49qtTu4i9tUpqV85l32Y1KrzX1ANYOxHU9GZiEktA/Fxejang7
	cVend1olFLMnbp+ywt3/OAfaT29ILvA=
X-MC-Unique: gXXzry2_PdWF3BQo1NdXIg-1
From: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Missing Libraries (.h) of xenstore, libxl and xenapi
Thread-Topic: Missing Libraries (.h) of xenstore, libxl and xenapi
Thread-Index: AQHZO8dPTqcqfMxKgEW/bjgkY4U5Fg==
Date: Wed, 8 Feb 2023 14:12:00 +0000
Message-ID: <AM5PR0802MB25786811CDAFDF80C0820B1E9DD89@AM5PR0802MB2578.eurprd08.prod.outlook.com>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
 <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <619a00f0-0f9f-5f5f-13a7-ea86f9c24eec@xen.org>
 <AM5PR0802MB25788E8A571AD920C8CEFF829DDB9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
In-Reply-To: <AM5PR0802MB25788E8A571AD920C8CEFF829DDB9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Enabled=true;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SetDate=2023-02-07T09:35:26Z;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Method=Privileged;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_Name=Internal sub2 (no
 marking);
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_SiteId=eb70b763-b6d7-4486-8555-8831709a784e;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ActionId=1dd26ef2-7370-48f7-8942-e53a52ceae44;
 MSIP_Label_7294a1c8-9899-41e7-8f6e-8b1b3c79592a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR0802MB2578:EE_|AS8PR08MB6328:EE_
x-ms-office365-filtering-correlation-id: 91acbc10-1505-467f-f1d2-08db09de7262
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: zaAtHRbp3PQgiqoeN7/tRJyaZVaGfAOZG5YKTAdmJ6MRQkhA08WoTw94ihJEqfgalV22+5nYW6Dy7xfQm0NF0JEd2uAjsOl7cvCsF6WgE2YQaGndibK7i3WwaHuYec0ct0VSS4p6RQQTZqWfryDJ3ZHrlzWud8U8CXwRS2DC5blN54KUkhi1BdxQ8zjESSxKGr6KIf8Lf/8fH6r5CC2GQMUK0bvewMTWGWjNFEYfejADTJqKh181d51DjpIz6wlv1h7n9oTWjE/QjVitDbU51tQCJx/y9vhGlGV5C2XxOZSxjJKLI2PJ9wfzTqhrGsui4DYeLGW5vqTMf7nTXZ3bmDmQx4qxy0cvCXOqqye7QcGO+Z8dQz5SsBACUbe8hL2wKJ5sgFHyq4R6NZAlUTNKn1ohiFHifyl5gTAw0imz7gZkIQstHeki6ewJgfs5f4XdrjCCgqKYiHTmh6QDsSFHtu8Ue0vatnL16xCCzUJamMK5JE6LSdPpEt7gmMHUQuiv+fPd3HBWiikdWdL1e4FRgePsu1XC+dvQYK3jwA1pPtBGImTXTTKE6Sl0euP9yqvTxExDR37g3UxTMn3y0wYP+O9hGBF4ish1SUd0CBoUmT03lZV3Z3FiYcTtvCu82ge/UvOIfYocci0LMFnqTfVifEoBlDeFhnkWWv3jYs3tK6Ze7HkVZ6r45YaB/6UTgf526Sp/TQ4Y8GmEXFqKZkzRjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0802MB2578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199018)(66476007)(66556008)(76116006)(6916009)(82960400001)(66946007)(41300700001)(316002)(478600001)(33656002)(54906003)(38070700005)(38100700002)(7696005)(4743002)(4744005)(8676002)(186003)(9686003)(55016003)(2906002)(86362001)(71200400001)(26005)(122000001)(8936002)(66446008)(5660300002)(64756008)(52536014)(6506007)(4326008);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVY2VVhrczQrVEZjZ0xrVmN4VGkxZ01SQmc5ZUNsQ3BJRlZjZ3VSd0wvVHJo?=
 =?utf-8?B?bWYySDFaZDl2LzMraDZXZkJzWklyYW9qR2tPUWI1YThoMHlqQk5sK2RhUGds?=
 =?utf-8?B?N0VDellabVNRL3l1cnhHTC9Ua1hpQ3ZIZmp0eTNyanA1M21BZVBEbmFKQVFS?=
 =?utf-8?B?TllwRStsZDFyQkJHS1hjVDRBN3VPSHF3dDFyUURTa0pqdzZoVExMVWw4YWN2?=
 =?utf-8?B?eWVsMnI4MDhkVEUzLzE2ME9uNUN3K2dnbjRZcDZqWUZrVW80SVdJMVhNRVRU?=
 =?utf-8?B?RjloalFJOURxU1lyajNZYjFoWGRUYlNyQ2R5VTZIVTVtUSttWXk0WGlOWVIr?=
 =?utf-8?B?RkRSZzdZMGFCODVlOWx1SjdZNVhEcmFaVzlWZjVBOEJsZTJtcjJCWjRDNmlW?=
 =?utf-8?B?Z1BnVTBGMGRtQnd2NHZ0N2RrbGNra0poU1RJdEVUQ0p3NjAxWHdNZUd0R1Fx?=
 =?utf-8?B?dHo4b09UU3lHUEFpZFRzL1M0Y3pYTEd5Zk5TeEhTQlVudmR2eVNBTk40UW5w?=
 =?utf-8?B?RE0wL3hSK1NLb1AxemxPTHRRTkY5Q0pqeXRzRXVkT1MwdnkvSlVvWFNtWE1W?=
 =?utf-8?B?TXFXbE5zdVV4Ukx6TElQSWFzZW5GOUpBTGtGYklUZTB2dlZNOUJjUDdzRDFq?=
 =?utf-8?B?ZHNPWkhhaFlxQTdvajQ3MHNuc01XRE1wZmJWVm5RL1FmSVplaUF4SHh5azZx?=
 =?utf-8?B?bk42anBKRHFhSVh4OFBkY0YyVlMyd2lJSDl6RkJlNml0ZE1iU0ZCZGZZWjNq?=
 =?utf-8?B?VmJ3THBBSXVjci94YUxCWGdmTjRpTHpsL3JDeldVTUtZeGpKY05pZUpMbEN3?=
 =?utf-8?B?VmZZdEhzMmtHaDhkTlA4OWtsTVhXamJ6b3R6V3hzT0VBVFRsRVpvQ3Rwck1X?=
 =?utf-8?B?ZzVyOGZTbXlBclhjRHRuUCtPY0lzRkMvSWpiWVkvRDJEUlBCK3V5UDRGbjdn?=
 =?utf-8?B?SWtsRDZUQXZXM292SHVDZDMyRXBoREh6SURIdEczaGp1WFA0SVNBVkc5b1NC?=
 =?utf-8?B?N0VUTGxHOE5ER0E2eHo0L1greG94SGpHaDBSMVh5Rkl2TzN0azFVTlpOazNj?=
 =?utf-8?B?cE1wMkYvUnNlMmwyQzhEb0FnbkhIbEFZczhMUXQ4U2xRdm5wZ1V4TUFlL2Zp?=
 =?utf-8?B?bzFyc1RnT1FqZ0dzSDhiSU84WTV0NnltUytFSHFLR0FBUGk4ZHpLblJGU2NP?=
 =?utf-8?B?Y0E0a0FQOVZGeFJaZnVuY0lTUk1zZVNiM3Urb0xMWmdueW5aYU1LQURkdWxz?=
 =?utf-8?B?WjJtczhJV0RrcTdUek1TT2lROGtuai9KNlZkMmVhVkp0bkpIVWZBcEcwSVdR?=
 =?utf-8?B?NnJ5aDFGbEY5SlE1aHU4a2w4VUZhNC9KTysrVllwTllpWlZ2OXV2akt2TUVU?=
 =?utf-8?B?SnFkVVFMbDhBOXFwcGZaNmtDSmNmc2haMVBQL091eG8vU2RkdEJYWmdyM01t?=
 =?utf-8?B?bW9NeUpzcXVOclZ5UUdtSUYxYXVTNUFuL1gvYk51bThLRTMyQ3BoSW16K0t3?=
 =?utf-8?B?SEFoekxUK08vdTByWFREY0s0VUZUSXhqSnBRdVlZeXkvWDlHOWpCd1F5Z2Y2?=
 =?utf-8?B?eE5ZZWxhM0ZDeG9JaGRWbjBxYW1rb25ZSEdSbFdydjJnOFBiVGFvazZuL1Yz?=
 =?utf-8?B?eVl1K1kvS1I3WkptTGJVcDVscUdsNDJXS2VETlIvU3AvU2xFZTZXZHB2QTRM?=
 =?utf-8?B?MFRaaExCVnpOSkduZm5NWWk4bVd6MFViRDltQnRnaW5HaGlkNktPVTlQaVRr?=
 =?utf-8?B?eXpsS3c2cXhZaDVRZzdvM2haY0YrQ1ZNbG14dHJodFpuWUhGNGw1ZDJIY0FO?=
 =?utf-8?B?RSt4VmxObm5WZ2ZqWXV0SkJEckRvbW1GQm9TMjdtWVRnNlhLUTQ0SkxYK2tG?=
 =?utf-8?B?YitoTVRNaFE3VzhvYit2bTNNcVFrUHdJYllKUVFYNTR1OEdZc21Rb1dOZ21v?=
 =?utf-8?B?V3dqZnVNVnJRUmRmdGRxNmFZZEJhY2krR00xYVdOUktpeFk4eEQyZXBtVUt3?=
 =?utf-8?B?ZDQ5L0lRd0FZNXlpNkVpSWYrNWJ0ZFp0aDNuUmowL0dldS82V2xIMjhxbFhi?=
 =?utf-8?B?amxaaytoSmEvUTMrdXE1ZEtubXZnNHpEY2VwM0lSVUJ0VmtuckQzbXlOV2lI?=
 =?utf-8?Q?3vNf9WmVngClN7NIdGtfv6Xfa?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: elMPvIiH/dMYOfdFWNeBvvHCBSUch9pdrrTdjRT+qs9gNyPlFaxWYBq+lBxnTTOi5EyQXXmwCYbQ+oaJCo3ZMO2lUBxI0YONTV/ssT20Dyl5Ztac9w0bhwat0G3GYvcvOgMvXcttmivrKc8eO5N4Zz3cS99INTd9dVdpOSSb+3XADd+KZdy3uDRgBoFaRyLCqhoCjPRo4kkCfofja0UQFKmBpxOaafCWDrJpgDLhdmEXMAvEtLCKWqieYy2XrGH7V/j6oXHvWjNGo9lk/GVnLim2OysH43gEt83S7bT8NJPsj18k6x8wNWMDJgFE50ljzD5j2+OiSp3/vGnIjfSJy4Q91bOFuRWy+Mmyz3U4GP+ARqbww7woYq34mzpnjqM0mHKN4xEwgaQKUBURlNyuotCtXp5CTWb0K5jX0AE7hupUX9/mnil7RM7JWM6pTcdaOu2UA7vmao3+FT+tWEuBEetkDOemclvws0QT8XBD+y7J2ikiQoOUETLx4vT7arpHFdfY6qk7b3UhG1q5RnMmr100RUNCXlk5UiQjyO9Jm7NQILLGaa2TgFxXZhrqxE/VybYDs0qFt8Elejhl33qEGIMKceQqm/qDZLUXBa/mQj+6tp1qbAIxXhoqnpmlSjxY+0f/nI/LsxWPyybSJy2VFwZevGIAcPFgrjHYVXa5qy0DIpTmR+ZX+qgDHEghqPx/7ZlSePPJVmGLl7Pu3nN6NdiXtqziAqPx7o2EORD73H7phRnY56wrKPA+lxQf8XM+e51bIQYlKYsZsQDxZxI/ep/sMij7HbgrPQgL3XpVQknlbDvffobLcqv3d7DO4Ehdct8yMNXxzV1T+aFWE9S0Mw==
X-OriginatorOrg: zf.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0802MB2578.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91acbc10-1505-467f-f1d2-08db09de7262
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 14:12:00.9377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb70b763-b6d7-4486-8555-8831709a784e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i+i4vo4WHahdShnX+axzcn9T0lPt39bBQA0/oGjrdquUDdXUI4wW4wC7YCnpUj+9kRTuAJwMAsGjhK0oL1Q8O/0Z5qdZM78EVmQdRL9i48Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6328
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zf.com
Content-Language: de-DE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PkhlbGxvIHRvZ2V0aGVyLA0KDQo+aW0gdHJ5aW5nIHRvIHdyaXRlIEMgY29kZSB0byBtb25pdG9y
IHRoZSBDUFUgdXNhZ2UgaW4gYW5kIG1lbW9yeSBhbGxvY2F0aW9uIGluIGEgdmVyeSBzaG9ydCB0
aW1lIChpbiBtaWNyb3NlY29uZCAvIGlmIHBvc3NpYmxlIGFsc28gbmFubyBzZWNvbmQpLiBGb3Ig
dGhpcyBJIG5lZWQgdG8gdXNlIHRoZSBmdW5jdGlvbnMgcHJvdmlkZWQgYnkgdGhlIGZvbGxvd2lu
ZyBsaWJyYXJpZXMsIGxpYnhsLmggLyB4ZW5zdG9yZS5oICBvciB0aGUgbGlicmFyaWVzIHByb3Zp
ZGVkIGJ5IHhlbmFwaS4gVW5mb3J0dW5hdGVseSB0aG9zZSBsaWJyYXJpZXMgKHRoZSBoZWFkZXIg
ZGF0ZWkpIGFyZSBub3QgaW5zdGFsbGVkLiBTaG91bGQgSSBidWlsZCB0aGVtIHdpdGggbXkgaW1h
Z2U/IE9yIGlzIHRoZXJlIGFueSBvdGhlciBzb2x1dGlvbj8NCg0KPkkgYW0gdXNpbmcgeGVuIDEu
MTQgb24gdGhlIHMzMmczIGZyb20gbnhwIG1pY3JvcHJvY2Vzc29yLCBuZXdlc3QgdmVyc2lvbiAo
eGVuIDEuMTcpIGlzIG5vdCBzdXBwb3J0ZWQgeWV0IG9uIHRoZSBzMzJnMy4NCg0KPklmIHlvdSBh
bHNvIGhhdmUgc29tZSBkb2N1bWVudGF0aW9ucyB0aGF0IGNvdWxkIGhlbHAgbWUgdG8gdXNlIGFu
ZCB1bmRlcnN0YW5kIHRoZSBmdW5jdGlvbnMgaW5zaWRlIHRob3NlICguaCkgZmlsZXMsIGl0IHdv
dWxkIGJlIHNvIGhlbHBmdWwgaWYgeW91IHNoYXJlIHRob3NlIGRvY3VtZW50cyB3aXRoIG1lLiBU
aGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIHN1cHBvcnQuDQoNCkJlc3QgcmVnYXJkcw0KWW91c3Nl
ZiBFbCBNZXNkYWRpDQoNCg0K


