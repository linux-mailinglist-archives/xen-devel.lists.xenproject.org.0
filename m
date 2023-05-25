Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22807106DD
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539334.840100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2619-0006dx-Fz; Thu, 25 May 2023 08:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539334.840100; Thu, 25 May 2023 08:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2619-0006bj-D8; Thu, 25 May 2023 08:08:15 +0000
Received: by outflank-mailman (input) for mailman id 539334;
 Thu, 25 May 2023 08:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q2617-0006bZ-AF
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:08:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a78622e-fad3-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 10:08:11 +0200 (CEST)
Received: from DB7PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:36::33)
 by GV1PR08MB8714.eurprd08.prod.outlook.com (2603:10a6:150:83::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 08:08:02 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::bb) by DB7PR05CA0020.outlook.office365.com
 (2603:10a6:10:36::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 08:08:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 08:08:02 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 25 May 2023 08:08:02 +0000
Received: from f18fa8b90ba2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27CBF12C-16D6-4BB6-A4FD-AC0854470D8E.1; 
 Thu, 25 May 2023 08:07:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f18fa8b90ba2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 08:07:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6164.eurprd08.prod.outlook.com (2603:10a6:20b:287::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Thu, 25 May
 2023 08:07:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 08:07:47 +0000
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
X-Inumbo-ID: 4a78622e-fad3-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt09OIczyo/j7ElpWKbXC2KkxF2yoD+ctz0QI77c/lI=;
 b=wLVbzNdFwa/Sndst2i0wVDOYOGXh4mfwCZXsbDUIcIYYt4g/jTw+Udfug1/QQ+cvgVpCnjxxAeGKd8j3NEp2761fHk1ocsQFRYJKhOB5Ulo556qJ/7gsfpKPYGCvFTdGZOLxNqOeXSE894JC3zXMb94T1p5J2W4fk0VdOyNH2YM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b494e79564c249c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJV9evszSb1uutdEMGY0r0Z6fmfG/UbreMabzQbrSrZ9vYMhAawQJLAi6e9JzWbcq5XvPestrlQrcEmquHSEsf8rcC/awiGwgVtQ9fXcJJcvXjSZ5IpyL4Ac/BBaSA7z2ZqicRLf1tBel0jt/D7fqBpU0Yzl0J6E8927w9XABeo5fH0p4yCzSmcK9TU9gYv229xw1e8hSMHSbOEZdRibWz5Fd4kycHJdQRyyYeRnwZNnxoosnKF34cPDmGrZh2wWbv0f+v8rodIGL8AO7XGYbTSVjGgEu7um13srb+l2WU+vU8LNq7HdroelbZI/7wi2AarqR8vssixsuA8KIjYTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt09OIczyo/j7ElpWKbXC2KkxF2yoD+ctz0QI77c/lI=;
 b=ZtIryTet5waZAlSYHcMEyfKRHJZ5GO6fAcxi5FYFcn7SK5x3Z/v3is2bzcgdQfDvg/hfzJg6sRbmgKzj8kB4tNaYtcgov63mFnutxHg1aOtZsWfZfi/ISGIYELDCxx1dRs2X80TP8jxOhaT7VQ2j1zLdu+SvD3oa1NathfPMFFxe195eu9WLuY4t76B41NKYJ/KzLtBkB67cL9i5sNldWfZR9v402lpL7S8jzvW96QCpdypeCyLtfGbFhf/UZmIqAXawKBgwZybGgzrkWJOctT+emO2L9tPZjjyN6Alq6T/SmYbukYosckwCvKBv68Ob/wGHY6F4s5DA7BpKb0aBVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt09OIczyo/j7ElpWKbXC2KkxF2yoD+ctz0QI77c/lI=;
 b=wLVbzNdFwa/Sndst2i0wVDOYOGXh4mfwCZXsbDUIcIYYt4g/jTw+Udfug1/QQ+cvgVpCnjxxAeGKd8j3NEp2761fHk1ocsQFRYJKhOB5Ulo556qJ/7gsfpKPYGCvFTdGZOLxNqOeXSE894JC3zXMb94T1p5J2W4fk0VdOyNH2YM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 3/3] xen/misra: xen-analysis.py: Fix cppcheck report
 relative paths
Thread-Topic: [PATCH 3/3] xen/misra: xen-analysis.py: Fix cppcheck report
 relative paths
Thread-Index: AQHZijShF3eaMfwagUuZTgN2kgKHd69qMFGAgAB7NYA=
Date: Thu, 25 May 2023 08:07:47 +0000
Message-ID: <B9D3CF47-6CF9-45C3-9CC1-35B95ACFCC95@arm.com>
References: <20230519093019.2131896-1-luca.fancellu@arm.com>
 <20230519093019.2131896-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2305241744170.44000@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2305241744170.44000@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6164:EE_|DBAEUR03FT034:EE_|GV1PR08MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: e642a45e-4dcc-447c-c6b5-08db5cf7296c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZqhzibhTd8t9JvJnUsEVB8d15NTxTIsLrvBoRdEUFVK+j/raLvcHiMAec1GxKbcX2HWvIiMhtu8M/ORN0MBxqiZBshw7iatdZykZJ45fY+lP/XAHXzGkOPjjx899yrsW9Q6ioGpTabNkZIVPoWbfj6KNSYtBrvf9ga2PCqmmU0bdY4UjUOSOug/kh4qHQVanc7jub3gJb0CpqnWmZrV7lFjcFdYczfx08yxyVCLsbu/XRSPFFc+HL8mj6QtbOsAFWEvDKXV4wB+reH9QUbW3AeVT96K6/j0bFcg8trC0cCJ5LOYmZL7jZo0PUwVOfmXdI1zMGIW8PdWjFPcdqG5ddSDBqvnDQ1Cme0vc70R3QA1or0UXu3KckU+4twdTDsIq10Vnbkq8OgF7iiYsKrhKJCgzhZWvdVjw1rUyV/lELDvsOTb0BpoAp6GhbH9cymGyh10texESMe+JR5SYpdp6KjjTrysImA5hmQVUZdpa/P+KrcOTo9OeXYVyDfpu/F5h8tRsS6lW5xBmrPXkQhAcKNgK/gyG2UNiOZwi+mo5zLoJc7teS6/cqT9lWB6oxOl1+LldCpNwDN2u5/boxZFPoNMVRBcxHq5qvW4O+PsQfp3cYQPGcFcHjw1uMi/URkWjl3ik5ybNabqtsTd9Fszp23bY6/g25RwR1kwyvN713h14XnGCLFPeldmpscognuAL6onsH/kNYBKJBkkwGLwkVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(6512007)(41300700001)(8676002)(8936002)(6506007)(2616005)(186003)(26005)(53546011)(86362001)(4326008)(36756003)(33656002)(2906002)(91956017)(478600001)(66476007)(66446008)(64756008)(6916009)(66556008)(66946007)(5660300002)(83380400001)(76116006)(316002)(54906003)(38070700005)(38100700002)(6486002)(71200400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B291FC8C418E1449B346725431B0405@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6164
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	12459d8f-9f7d-4dfd-4576-08db5cf7207b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pvzpAo0aHwR7fuYqpoomP92RUYrsPzQJvdbtd2EicWllbdPHR49TumCtXBzH1VUegLW8VL+bJ5i0tDhj9ssz1gQMilhtwkg0ZG/xFUhEEapCQObwn4Pnj0C1DX0Bp+3TIIdxzyGRPqaINmeNukTHC+MgqOuVDukxtaryspyMjnpeUyUenQMCs9iW8QukXhPLmaDTQmRD7xY/k+LQYLJju97bEY7+dRH8K9bhD7HCTXbpXjyoQkLpRfvhovXGuAItJHGV/lufa4iELseOLwJtNZx4voJfQ4ImUMc/aZbCrEa1Y5eKFy2mgDc+HFgRSVY8he/sJTgsKosZZzhNh+AlrOKDYQizhhHcVfvmxKYrxCHYgXatKIPmCCWUD89BxTtRN+FrN4iuWZXBy/OgSL3kePtF4X8w9iyw9JqtGnNWkfTEzz06geldVkga3kG8umDpN5K6Q8kJN63USWCnCdINHXoQxSloBYKyuSb45pHu/2KELWp1iVzYf8mwVZr3DCJTy6awC9dzDvHzmrEkrfAixIPo+MjwzSff4cL5PTA11NJ1NrGY30MQA7QEmI9oErNrkGhLChqMjvBlokyLOwaL1LMlMCTIdPwof9gLA2BYYgE2QtUYsdXUpPJBKYyfJtrzsDk2gD+Wp4WW8wIisES3eRHCxUo41eaJ4AmlODc7NPXr8jauU3mof+BLd1LwnnO0dYqRGp900CbmsRFzcJXQ11ZvYSJ6kJwPorIH5Jvv1/DPRiyjH0e3Cp/DlXgnkR1L
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(6486002)(41300700001)(26005)(53546011)(6512007)(6506007)(8676002)(8936002)(6862004)(5660300002)(36756003)(36860700001)(2616005)(82310400005)(83380400001)(47076005)(336012)(2906002)(33656002)(186003)(86362001)(356005)(81166007)(40480700001)(82740400003)(4326008)(70586007)(70206006)(54906003)(478600001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:08:02.4573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e642a45e-4dcc-447c-c6b5-08db5cf7296c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8714

DQoNCj4gT24gMjUgTWF5IDIwMjMsIGF0IDAxOjQ2LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAxOSBNYXkgMjAyMywgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IEZpeCB0aGUgZ2VuZXJhdGlvbiBvZiB0aGUgcmVsYXRpdmUg
cGF0aCBmcm9tIHRoZSByZXBvLCBmb3IgY3BwY2hlY2sNCj4+IHJlcG9ydHMsIHdoZW4gdGhlIHNj
cmlwdCBpcyBsYXVuY2hpbmcgbWFrZSB3aXRoIGluLXRyZWUgYnVpbGQuDQo+PiANCj4+IEZpeGVz
OiBiMDQ2ZjdlMzc0ODkgKCJ4ZW4vbWlzcmE6IHhlbi1hbmFseXNpcy5weTogdXNlIHRoZSByZWxh
dGl2ZSBwYXRoIGZyb20gdGhlIC4uLiIpDQo+PiBSZXBvcnRlZC1ieTogTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1
Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gLi4uL3hlbl9hbmFseXNpcy9jcHBjaGVj
a19yZXBvcnRfdXRpbHMucHkgICAgIHwgMjUgKysrKysrKysrKysrKysrKy0tLQ0KPj4gMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYg
LS1naXQgYS94ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvY3BwY2hlY2tfcmVwb3J0X3V0aWxzLnB5
IGIveGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2NwcGNoZWNrX3JlcG9ydF91dGlscy5weQ0KPj4g
aW5kZXggZmRjMjk5YzdlMDI5Li4xMDEwMGY2YzZhNTcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vc2Ny
aXB0cy94ZW5fYW5hbHlzaXMvY3BwY2hlY2tfcmVwb3J0X3V0aWxzLnB5DQo+PiArKysgYi94ZW4v
c2NyaXB0cy94ZW5fYW5hbHlzaXMvY3BwY2hlY2tfcmVwb3J0X3V0aWxzLnB5DQo+PiBAQCAtMSw2
ICsxLDcgQEANCj4+ICMhL3Vzci9iaW4vZW52IHB5dGhvbjMNCj4+IA0KPj4gLWltcG9ydCBvcw0K
Pj4gK2ltcG9ydCBvcywgcmUNCj4+ICtmcm9tIC4gaW1wb3J0IHNldHRpbmdzDQo+PiBmcm9tIHht
bC5ldHJlZSBpbXBvcnQgRWxlbWVudFRyZWUNCj4+IA0KPj4gY2xhc3MgQ3BwY2hlY2tIVE1MUmVw
b3J0RXJyb3IoRXhjZXB0aW9uKToNCj4+IEBAIC0xMDEsMTIgKzEwMiwyOCBAQCBkZWYgY3BwY2hl
Y2tfbWVyZ2VfdHh0X2ZyYWdtZW50cyhmcmFnbWVudHNfbGlzdCwgb3V0X3R4dF9maWxlLCBzdHJp
cF9wYXRocyk6DQo+PiAgICAgICAgICAgICB0ZXh0X3JlcG9ydF9jb250ZW50ID0gbGlzdCh0ZXh0
X3JlcG9ydF9jb250ZW50KQ0KPj4gICAgICAgICAgICAgIyBTdHJpcCBwYXRoIGZyb20gcmVwb3J0
IGxpbmVzDQo+PiAgICAgICAgICAgICBmb3IgaSBpbiBsaXN0KHJhbmdlKDAsIGxlbih0ZXh0X3Jl
cG9ydF9jb250ZW50KSkpOg0KPj4gLSAgICAgICAgICAgICAgICBmb3IgcGF0aCBpbiBzdHJpcF9w
YXRoczoNCj4+IC0gICAgICAgICAgICAgICAgICAgIHRleHRfcmVwb3J0X2NvbnRlbnRbaV0gPSB0
ZXh0X3JlcG9ydF9jb250ZW50W2ldLnJlcGxhY2UoDQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhdGggKyAiLyIsICIi
KQ0KPj4gICAgICAgICAgICAgICAgICMgU3BsaXQgYnkgOiBzZXBhcmF0b3INCj4+ICAgICAgICAg
ICAgICAgICB0ZXh0X3JlcG9ydF9jb250ZW50W2ldID0gdGV4dF9yZXBvcnRfY29udGVudFtpXS5z
cGxpdCgiOiIpDQo+PiANCj4+ICsgICAgICAgICAgICAgICAgZm9yIHBhdGggaW4gc3RyaXBfcGF0
aHM6DQo+PiArICAgICAgICAgICAgICAgICAgICB0ZXh0X3JlcG9ydF9jb250ZW50W2ldWzBdID0g
XA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHRleHRfcmVwb3J0X2NvbnRlbnRbaV1bMF0u
cmVwbGFjZShwYXRoICsgIi8iLCAiIikNCj4gDQo+IFdoeSBtb3ZpbmcgdGhpcyBmb3IgbG9vcCBh
ZnRlciAiU3BsaXQgYnkgOiBzZXBhcmF0b3IiPyBJZiBpdCBpcw0KPiBuZWNlc3NhcnksIHdvdWxk
IGl0IG1ha2Ugc2Vuc2UgdG8gZG8gaXQgaW4gdGhlIHByZXZpb3VzIHBhdGNoPw0KDQpIaSBTdGVm
YW5vLA0KDQpJbiB0aGUgcGF0Y2ggYmVmb3JlIEkgd2FzIGZpeGluZyB0aGUgYnVnLCBzbyBJIHRo
b3VnaHQgaXQgd2FzIGJldHRlciB0byBkb27igJl0IGludHJvZHVjZSBvdGhlciBjaGFuZ2VzLA0K
aGVyZSBJIG1vdmVkIHRoZSBsb29wIGFmdGVyIHRoZSBzcGxpdCBiZWNhdXNlIGluIHRoaXMgd2F5
IHdlIHRha2UgaW50byBhY2NvdW50IG9ubHkgdGhlIGZpcnN0IGVsZW1lbnQNCm9mIHRoZSDigJg6
4oCZIHNlcGFyYXRlZCBzdHJpbmcsIHRoYXQgaXMgdGhlIHBhdGggKyDigJwobGluZSxjb2wp4oCd
Lg0KDQpCZWZvcmUgdGhpcyBwYXRoIGl0IHdhcyBvayB0byBkbyB0aGUgcmVwbGFjZSBvbiB0aGUg
ZnVsbCBzdHJpbmcgYmVjYXVzZSB3ZSB3ZXJlIGdvaW5nIGp1c3QgdG8gcmVtb3ZlIHRoZQ0KcGF0
aCwgbm93IGluc3RlYWQgd2UgdXNlIHRoYXQgcGF0aCB0byBjaGVjayBpZiBpdCBhY3R1YWxseSBl
eGlzdHMuDQoNCj4gDQo+IA0KPj4gKyAgICAgICAgICAgICAgICAjIFdoZW4gdGhlIGNvbXBpbGF0
aW9uIGlzIGluLXRyZWUsIHRoZSBtYWtlZmlsZSBwbGFjZXMNCj4+ICsgICAgICAgICAgICAgICAg
IyB0aGUgZGlyZWN0b3J5IGluIC94ZW4veGVuLCBtYWtpbmcgY3BwY2hlY2sgcHJvZHVjZQ0KPj4g
KyAgICAgICAgICAgICAgICAjIHJlbGF0aXZlIHBhdGggZnJvbSB0aGVyZSwgc28gY2hlY2sgaWYg
Inhlbi8iIGlzIGEgcHJlZml4DQo+PiArICAgICAgICAgICAgICAgICMgb2YgdGhlIHBhdGggYW5k
IGlmIGl0J3Mgbm90LCBjaGVjayBpZiBpdCBjYW4gYmUgYWRkZWQgdG8NCj4+ICsgICAgICAgICAg
ICAgICAgIyBoYXZlIGEgcmVsYXRpdmUgcGF0aCBmcm9tIHRoZSByZXBvc2l0b3J5IGluc3RlYWQg
b2YgZnJvbQ0KPj4gKyAgICAgICAgICAgICAgICAjIC94ZW4veGVuDQo+PiArICAgICAgICAgICAg
ICAgIGlmIG5vdCB0ZXh0X3JlcG9ydF9jb250ZW50W2ldWzBdLnN0YXJ0c3dpdGgoInhlbi8iKToN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICMgY3BwY2hlY2sgZmlyc3QgZW50cnkgaXMgaW4gdGhp
cyBmb3JtYXQ6DQo+PiArICAgICAgICAgICAgICAgICAgICAjIHBhdGgvdG8vZmlsZShsaW5lLGNv
bHMpLCByZW1vdmUgKGxpbmUsY29scykNCj4+ICsgICAgICAgICAgICAgICAgICAgIGNwcGNoZWNr
X2ZpbGUgPSByZS5zdWIocidcKC4qXCknLCAnJywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdGV4dF9yZXBvcnRfY29udGVudFtpXVswXSkNCj4+ICsgICAg
ICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguaXNmaWxlKHNldHRpbmdzLnhlbl9kaXIgKyAiLyIg
KyBjcHBjaGVja19maWxlKToNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB0ZXh0X3JlcG9y
dF9jb250ZW50W2ldWzBdID0gXA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAieGVu
LyIgKyB0ZXh0X3JlcG9ydF9jb250ZW50W2ldWzBdDQo+PiArDQo+PiAgICAgICAgICAgICAjIHNv
cnQgYWxwaGFiZXRpY2FsbHkgZm9yIHNlY29uZCBmaWVsZCAobWlzcmEgcnVsZSkgYW5kIGFzIHNl
Y29uZA0KPj4gICAgICAgICAgICAgIyBjcml0ZXJpYSBmb3IgdGhlIGZpcnN0IGZpZWxkIChmaWxl
IG5hbWUpDQo+PiAgICAgICAgICAgICB0ZXh0X3JlcG9ydF9jb250ZW50LnNvcnQoa2V5ID0gbGFt
YmRhIHg6ICh4WzFdLCB4WzBdKSkNCj4+IC0tIA0KPj4gMi4zNC4xDQoNCg0K

