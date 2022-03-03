Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF04CBB9C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283074.481959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPivY-0000Wf-Mv; Thu, 03 Mar 2022 10:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283074.481959; Thu, 03 Mar 2022 10:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPivY-0000UL-Jn; Thu, 03 Mar 2022 10:43:20 +0000
Received: by outflank-mailman (input) for mailman id 283074;
 Thu, 03 Mar 2022 10:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HbtR=TO=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nPivW-0000UD-OC
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:43:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb683356-9ade-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:43:16 +0100 (CET)
Received: from AM5PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:203:91::20) by AM6PR08MB3736.eurprd08.prod.outlook.com
 (2603:10a6:20b:87::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 3 Mar
 2022 10:43:11 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::c5) by AM5PR0502CA0010.outlook.office365.com
 (2603:10a6:203:91::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 10:43:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 10:43:08 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 03 Mar 2022 10:43:07 +0000
Received: from 50e3d5e8ecfd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 413D6BA5-77B6-4F5D-B47B-4E2FC46855DE.1; 
 Thu, 03 Mar 2022 10:43:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50e3d5e8ecfd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 10:43:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5426.eurprd08.prod.outlook.com (2603:10a6:208:184::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Thu, 3 Mar
 2022 10:43:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:43:00 +0000
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
X-Inumbo-ID: bb683356-9ade-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCD6Q6GpYs4ZMk7FNJRJdzfMT90uWPMZvbl4dWtBx3E=;
 b=rUHoETNTjVNdjVR8/ol3xUJC6VLUOvfl3RvTjOFydsRz1AhEQUeYG59AlbyRTx6UX+ZPAp7h0akoBH6+JTYpReHbJYKYbe6ZFQB6e+jyrjLgWs69mMfAadDg0H0WkFCxLdY/S5s196m6HzV1dLXuIrQ4DN7te3OD/O7Uo6bf42c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfJ1bw76v1uUO8HYzHC4C2bC3I0mcm2OKZlqq6aZdN7uPMQiewalVTrQPIdyyF02duam6EP7rBFF85sD7m2zzCQl3kNSYwC/jAhlJgdHmfgZaz3YZtjuvgyfX10m1eDZh5e01WGgsX057enaRFdlYW+5ulPBJPt50QAl8soNaXhzn8qlG4acVDPCGvdtoKaqq8v07u4Ya4GhxbyfNV7eZyZ97kHZntAxI/8QL7Cee+LKA3I5S50qxiUunKL07HmrIj8ooJuniLja1Ct92gDurQaEqBVXXSsEZjYJHH3O5aRlniDDboqwa3RfT5hO6HmRy1r1S10vDIN7Hz+QSP867g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCD6Q6GpYs4ZMk7FNJRJdzfMT90uWPMZvbl4dWtBx3E=;
 b=j7xKwaCKHmxJ5tmC9ByScfN3398rdcVDINBT+37CrO/kYIOnWbw7DrtLCm2liLSNTODsDYKf49dIRJ1bgSLkZmgepe4IGUOEwO5o/e+dSR1u+IEwuClfmo+PBw8y+LzLaSP5fxAU3eoM7ECj0BBWmoWwkl8lQtyLnBJzQQLh9eMxgRsQrDMQwK2aHarcY6hOKa+RDsmFVT64W3FGOD5bjnleAxVsD5bZ5t8jDdVG0oMiGDBt2+PvpunP+6ESdDYkd5fGow83WtTTEtAUvFgqQt+Q8aAG6Y9rrq+WgdAWxmJ6KRAQQNPHAU8v9YXsETHERExVq/BF0U+YFGGh4BD8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCD6Q6GpYs4ZMk7FNJRJdzfMT90uWPMZvbl4dWtBx3E=;
 b=rUHoETNTjVNdjVR8/ol3xUJC6VLUOvfl3RvTjOFydsRz1AhEQUeYG59AlbyRTx6UX+ZPAp7h0akoBH6+JTYpReHbJYKYbe6ZFQB6e+jyrjLgWs69mMfAadDg0H0WkFCxLdY/S5s196m6HzV1dLXuIrQ4DN7te3OD/O7Uo6bf42c=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UAAF1ylAACsO9YwAA5uZgAAI3g7sAAIzZgAAB9QTKAAEI0UgAAC/Q2w
Date: Thu, 3 Mar 2022 10:43:00 +0000
Message-ID:
 <PAXPR08MB742076A5816B26569DBAEA429E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
 <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
 <PAXPR08MB7420B367FFEB4FD3A7C88EB79E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <5eb5fe51-9ef7-affe-06e1-b15da512a76c@xen.org>
 <PAXPR08MB7420836458E512FE375B8F199E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <4058b2c7-4c46-bdb1-017d-69a934989071@xen.org>
In-Reply-To: <4058b2c7-4c46-bdb1-017d-69a934989071@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B1A6B33F65117443972F46E9BFAFEEFC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dc970619-1ab5-446d-76b0-08d9fd029b10
x-ms-traffictypediagnostic:
	AM0PR08MB5426:EE_|VE1EUR03FT045:EE_|AM6PR08MB3736:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB37363F0A712F6EF6B04A7BA99E049@AM6PR08MB3736.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G6YmujTk5J+/5+JvxV5F3EU5j0hZ7tSYBu70Ny/z+hGMQkDCMRVHUXChdwCHkS+kxAHU2jUsEEH2UB4sDTJf8LB1l9f784m3mt49Ol5L049uSaVy2ciVaDpF1ykUBhHMRlgrln9pj9UYHLnc18Hqt98KjVVPXnL5+HpDayb6sW/Ll6U77UJE0h1JjIDuo0RY60T7jg7KxCiOIV8C2B2Av2EKwcrkXZZKNrxe9sQT3N7K+o2kpgmqLKqJ7WsDtFpb0wxTbQnddysAqLkNnTgKhZYc6wOo9Rdub/YFViur08WIrIIbAqZihr07GZveNefeSjY5U7wONdQkvsJ/sBXxETWjijw16UZ9cmZdy8i1KgUEKyUz7KRbxEU7hoMxbA0cF8DznBRI1wPO+VOdsWUEQPV/dCbAgNmQz1PCPWJoAuVp5Vvibaz7mHOwnjLGAmWLqzV4pzIJqp+QxRAdpq4+R9RpRywcUato4UaEgijX7HAc3efqmoQ4BUaf/fmZPzRXmT6XvXUHpWATjl8CQ/Mwor4oYkd3arQiU54S2+ddVbPIOOe6xaR1+C5BQHY06lyrGwse66tvcNzrmb7/WKz6niQcGoO/VrUXIs9EXyMW7AQIJbtEjxbeXc/5UFVhaOWZYVFg5aVNQ4ha7Lv2dPcUvK6LFqjPjA4Yl7xCGZ7OR92UlK2UVc4S4J3LldL7+dO1QXT2THZKgphqRMyqaXa6kw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(110136005)(71200400001)(8936002)(316002)(64756008)(66556008)(66446008)(66476007)(52536014)(4326008)(8676002)(2906002)(186003)(26005)(54906003)(38070700005)(86362001)(508600001)(66946007)(76116006)(55016003)(9686003)(7696005)(53546011)(6506007)(38100700002)(122000001)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5426
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45e8fbec-7e58-4ef6-7031-08d9fd02962f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OoB3VnN74XEHTLDngNUv+sFz5nun1vIaHFRgwngGUgXVPBpz8ubTRxNK2G5tJuywtASD50JTfx4cmcQXw4PwaDVdI5vzCZEESqVRKqZb1b1okqfy7fE8/LDnMMsQep1+WGDHftBhN2C7y4Ae/LJfnBIyM+o7XdP2aVV21LBLoukJtic4Pchu9KkYlMwBBcfTt5RbTRlqmZRU4HMJFn2JnpdB+Ddlx5wFWsDuNoRYvqLCBdwufwOoZeoJJNx+NaQl4mNOWNp2e77yZtRbQqEK3e+voPLwZDtgXulghXcAYAV5P8lqYNSSK7eMx+jKYDpnfwuhJ3mw5OC4o2UaTs1Dwkw+ksoudchPC/CcwXzLf4s2fphu85HjGV05PWSRerUJP+L5pHRej56M2eybnAxDfog4A6uYYDQqX+31hu5dlvRJqVgAvkLg4jjIIL7Xua+/3td1ipHUPEUjx5ygs7//GoieCLlZ/i6h/4HTSimc7+dfoOc85TDe5h6b7/BmXqngr8E800m9dNtgZxTcAl72awepLiuOAYtbGtTX8G/cJTfS9aGvLBIBvkrW64oaEpzt1h5I97XyXfEVuwuAIOScamb5wx7RDV9Oy6v9kU2mppjdECH81HIm9ZlID/uS1/CeX7GYB510W+/NBzLpJDY61MUXvuJcvda4llUPV4rtTLJrXcUl+zJHLfUWu01Xrtyr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(5660300002)(4326008)(316002)(55016003)(8936002)(47076005)(7696005)(70586007)(52536014)(53546011)(40460700003)(8676002)(6506007)(70206006)(86362001)(186003)(36860700001)(336012)(26005)(33656002)(81166007)(9686003)(356005)(82310400004)(83380400001)(2906002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:43:08.1851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc970619-1ab5-446d-76b0-08d9fd029b10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3736

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQz5pyIM+aXpSAxNzoxNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBl
bm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgSGVucnkgV2FuZw0KPiA8SGVucnkuV2Fu
Z0Bhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBQcm9wb3NhbCBmb3Ig
UG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJhZnRBDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBP
biAwMy8wMy8yMDIyIDAxOjM1LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IDEuIEFzc2VtYmx5IGNv
ZGUgZm9yIEVMMSBNUFUgY29udGV4dF9zd2l0Y2gNCj4gPj4NCj4gPj4gVGhpcyBkaXNjdXNzaW9u
IHJlbWluZHMgbWUgd2hlbiBLVk0gZGVjaWRlZCB0byByZXdyaXRlIHRoZWlyIGNvbnRleHQNCj4g
Pj4gc3dpdGNoIGZyb20gYXNzZW1ibHkgdG8gQy4gVGhlIG91dGNvbWUgd2FzIHRoZSBjb21waWxl
ciBpcyBhYmxlIHRvIGRvIGENCj4gPj4gYmV0dGVyIGpvYiB0aGFuIHVzIHdoZW4gaXQgY29tZXMg
dG8gb3B0aW1pemluZy4NCj4gPj4NCj4gPj4gV2l0aCBhIEMgdmVyc2lvbiwgd2UgY291bGQgYWxz
byBzaGFyZSB0aGUgc2F2ZS9yZXN0b3JlIGNvZGUgd2l0aCAzMi1iaXQNCj4gPj4gYW5kIGl0IGlz
IGVhc2llciB0byByZWFkL21haW50YWluLg0KPiA+Pg0KPiA+PiBTbyBJIHdvdWxkIHN1Z2dlc3Qg
dG8gcnVuIHNvbWUgbnVtYmVycyB0byBjaGVjayBpZiBpdCByZWFsbHkgd29ydGgNCj4gPj4gaW1w
bGVtZW50aW5nIHRoZSBNUFUgc2F2ZS9yZXN0b3JlIGluIGFzc2VtYmx5Lg0KPiA+Pg0KPiA+DQo+
ID4gSXQncyBpbnRlcmVzdGluZyB0byBoZWFyIEtWTSBndXlzIGhhdmUgc2ltaWxhciBkaXNjdXNz
aW9uLiBZZXMsIGlmIHRoZQ0KPiA+IGdhaW5zIG9mIGFzc2VtYmx5IGNvZGUgaXMgbm90IHZlcnkg
b2J2aW91cywgdGhlbiByZXVzaW5nIHRoZSBjb2RlIGZvcg0KPiAzMi1iaXQNCj4gPiB3b3VsZCBi
ZSBtb3JlIGltcG9ydGFudC4gQXMgb3VyIGN1cnJlbnQgcGxhdGZvcm0gKEZWUCkgY291bGQgbm90
IGRvIHZlcnkNCj4gPiBwcmVjaXNlIHBlcmZvcm1hbmNlIG1lYXN1cmVtZW50LiBJIHdhbnQgdG8g
a2VlcCBjdXJyZW50IGFzc2VtYmx5IGNvZGUNCj4gdGhlcmUsDQo+ID4gd2hlbiB3ZSBoYXZlIGEg
cGxhdGZvcm0gdGhhdCBjYW4gZG8gc3VjaCBtZWFzdXJlbWVudCB3ZSBjYW4gaGF2ZSBhDQo+IHRo
cmVhZA0KPiA+IHRvIGRpc2N1c3MgaXQuDQo+IA0KPiBJIGJyaWVmbHkgbG9va2VkIGF0IHRoZSBj
b2RlLCB0aGUgYXNzZW1ibHkgdmVyc2lvbiBpcyBub3QgZ29pbmcgdG8gYmUNCj4gdHJpdmlhbCB0
byByZXZpZXcgYW5kIHdlIGRvbid0IGtub3cgeWV0IHdoZXRoZXIgaXQgaGFzIGFuIGFkdmFudGFn
ZS4gU28NCj4gSSB3b3VsZCBzYXkgdGhpcyBzaG91bGQgYmUgdGhlIGludmVyc2UgaGVyZS4NCj4g
DQo+IFdlIHdhbnQgdGhlIEMgdmVyc2lvbiBmaXJzdCB1bnRpbCB3ZSBjYW4gcHJvdmUgdGhlIGFz
c2VtYmx5IHZlcnNpb24gaXMNCj4gYmV0dGVyLg0KPiANCj4gTXkgZ3V0IGZlZWxpbmcgaXMgd2Ug
d2lsbCBub3QgbmVlZCB0aGUgYXNzZW1ibHkgdmVyc2lvbi4NCj4gDQoNCk9rLCB3ZSB3aWxsIHJv
bGxiYWNrIHRvIEMgdmVyc2lvbi4gQWZ0ZXIgd2Ugd2lsbCBmaW5pc2ggdGhlIG1lYXN1cmVtZW50
cywNCnRoZW4gd2Ugd2lsbCBkaXNjdXNzIGl0IGFnYWluIChpZiB0aGUgYXNzZW1ibHkgaGFzIGVu
b3VnaCBnYWluKS4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

