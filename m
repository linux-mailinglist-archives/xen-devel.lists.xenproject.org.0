Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15853753D9B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563673.881049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJuW-00070N-AX; Fri, 14 Jul 2023 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563673.881049; Fri, 14 Jul 2023 14:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJuW-0006y0-7F; Fri, 14 Jul 2023 14:36:44 +0000
Received: by outflank-mailman (input) for mailman id 563673;
 Fri, 14 Jul 2023 14:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3usO=DA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qKJuV-0006xu-LH
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:36:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d95a22a1-2253-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:36:42 +0200 (CEST)
Received: from AS4P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::20)
 by AS2PR08MB9128.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:36:24 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5db:cafe::8a) by AS4P189CA0029.outlook.office365.com
 (2603:10a6:20b:5db::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.26 via Frontend
 Transport; Fri, 14 Jul 2023 14:36:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.28 via Frontend Transport; Fri, 14 Jul 2023 14:36:24 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Fri, 14 Jul 2023 14:36:24 +0000
Received: from 890d80c215f0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABE9EA54-481F-4F5E-8792-94DF6A685FA1.1; 
 Fri, 14 Jul 2023 14:36:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 890d80c215f0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Jul 2023 14:36:17 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS2PR08MB10323.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:36:14 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d85f:f23f:ef0a:d163]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d85f:f23f:ef0a:d163%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:36:14 +0000
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
X-Inumbo-ID: d95a22a1-2253-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqcCLFyKUZ1tFDdy2DZjnC0Xjc5EIowBNRtAD63MeIc=;
 b=mL/NT6nR9A8rzAwKNurtXnYXBpIMXgQSnL03zmd0rInOAaAB859K4jhhNPJCud8rf+whetvVT4ANmHGCfvKZ2yg/oTANiE0FHK8CYVcOFNwcUC6Z0rX0TDWKzOp0hBDVjWHPSEB4zuop7HEmR6Ayc46jr2pFdLrYvR2U2jSYoC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28dc41d501b92f27
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ktj0snTz4dQLpFai192CPUfK6U1wlI5fXEFcgXsTkmk9nAGHe25LimN+FBMMQz2nLWGkWbL+cb9vdLGr66nQQrPsEpVI3U3DQ9LZNXMpotZGam1bCK+lbytm/XbCzUOEW1oNel9KCPW7jCX6iVE1xjY28Cb9W4FINd8M9ea+U6WfutfgqtViXEAyHxEeZlKBKi0NwheIWr3cpC/n4VlsrKKflJADt3AT3ZKXgb2zSOQY/Z/cu8BBei9QmzIt4sdfW8s1T8axa26ac3KjFJNByepAUZRMTB3/kJ5MFvqfKvnsW1Ce8DSOuwM+ElAYW8UfwRXdELpTmzA0ed8maJa2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqcCLFyKUZ1tFDdy2DZjnC0Xjc5EIowBNRtAD63MeIc=;
 b=Z1ZN6ipyWlTANX8C5Xw0p0Zzfw0fKXGz25MRxbm0wXdUvccDtrozSLfLif2HNINBSCKbdQN9Ou2xST9HJoTqKhVqIDOikDEKzqGrveR1NbOSGBa40a9n1Cx0HaL5Q36+lSlSnKkJiz2Gn0cPcc/eYAisFoOwZyn9+RaUBfMrCt/B6ewIGpZM8LFLTPaT8xa8q4j1LLZf/MDyjaWZsmyxqhFBTVJ2jk3ulA9MnrmaNA2voSBywB18LUI410W3H4+xitibQjf3gFnk28jwNPhQumZ4a/DHxOy9dM96SkNeJ5Dq6syypmFbk/edXFZzi52vybTn5bCUEkN8dA29jmwcBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqcCLFyKUZ1tFDdy2DZjnC0Xjc5EIowBNRtAD63MeIc=;
 b=mL/NT6nR9A8rzAwKNurtXnYXBpIMXgQSnL03zmd0rInOAaAB859K4jhhNPJCud8rf+whetvVT4ANmHGCfvKZ2yg/oTANiE0FHK8CYVcOFNwcUC6Z0rX0TDWKzOp0hBDVjWHPSEB4zuop7HEmR6Ayc46jr2pFdLrYvR2U2jSYoC8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Thread-Topic: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized
 variable inside a macro
Thread-Index: AQHZtkllBkKUd/6mO0+M9pyVgMwza6+5T/sAgAADTgCAAAEtAA==
Date: Fri, 14 Jul 2023 14:36:14 +0000
Message-ID: <86E1EAC8-ED9A-4AF0-BD0A-70C6685E7628@arm.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
 <3305C79F-38AA-4BA3-A9AA-4A626C7CC478@arm.com>
In-Reply-To: <3305C79F-38AA-4BA3-A9AA-4A626C7CC478@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS2PR08MB10323:EE_|AM7EUR03FT034:EE_|AS2PR08MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0adbcc-0dc8-4a8f-838c-08db8477b310
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ArEPNiG8kJd5u4JP/l8Oz0OOFC9gzLU/8NzZcHjncdKbyNm5VERFjcTRztRhDrp3lcSegEn9Z6OZ7hTJXTDcmMXc/ybJPabIPklDTD1rvAwtAXj0cTKsnE0BjvBkW262JHAduhn8ZQTligEZ2Z5oL1Tzr+NmqffLl+j2BQlUxlIE8zzCkbXZvRQatxUu1fJ4ISZrqZQkAExbAvysTZ991GqmFQjrb1nl7YwlPEAieMyIUrjF7CNQjkRp7sTe+jCOUJWmnSLThW6qEXCMsh/4GrKzY0kCVd/bdl4UAHAJ4GPRX2CRiyMq1f1l6jThojATEpTulZMGhuFtJekNc7N7XJ/p4WvA4lhZMCXlDKoFFmfTX64z8sgtvZMW2aCs3Qg7UqqCB++V7K+gzQMxdOuZinC3aKvIg+yk99ptyBlvl5RvTeCH7l5LB+WyQaWyGqj5y2aNAWH49stvvkwCwZ6GDJdP9bH/PSpx54KDfY0v7DZlxSRhuUp+8sTGpVbJn8Lm7HMVd6HWQ8a0jjcEg4xLeCncEiX3RjLBZWOCXG3yLeXdBezjwJG0nsiyxakDwlxuava1N/gEUeI6jsSq6S3QwQKHGYJBY2UzWd72wxIGGp9r/el4/JT3vIFkQUskcNvyfRl6XKo70X78u1E5rbogMw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(478600001)(6486002)(71200400001)(54906003)(91956017)(2616005)(86362001)(36756003)(38070700005)(33656002)(2906002)(26005)(6506007)(186003)(76116006)(6512007)(38100700002)(122000001)(66946007)(66476007)(4326008)(5660300002)(316002)(41300700001)(64756008)(66556008)(6916009)(8936002)(8676002)(7416002)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <22A635571A8B5342B521A9AE0B4D90FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10323
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f2d8c1ab-07ad-416f-ea2a-08db8477ad1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mmp2By6vo/Vw+NIW0jw9d+WAqPw9TuNyYmhdUzV66BgJS+LVva4L4o0LfygERR0k40aJg2cDtW8nN+QOMfSKtT65GUVZTEbtxwlvBoSKgjfv8ht78D7y9GAC0uM8r5rn3DwyF4xFjd9b/6/ySbSkDRWl85n88MNi9dY/jF8eoVOFVmV9BYPnDisMOybGCwv6stw8jaS1ske5llkzsBk78ZYsY+DphRzM8xYNAwlBMGifpLNGqn7/x5hQYikvoxI79+RqQK1AeZ94AGYRqdbyE2JGvmlalYK8ik2imOBdenhLCurx0Ot/72xOcjSGDEF6u0knex3fwTb+tRB6/eQw7mkLtawopR4paHvaUOL8PWGaUHcOyb7XbvQxeFrssdO2KJEvkbdrZy30YPE6Lfuj0CpLomhoiffvbF/HKDXUslafc3WA8lS/lhnBeZHYv9c1OtyYnzg6x7w2Y8jqKuv68mHCJEZ1ssLhF6NJjA5XGvy1siCv1VjqKD4agh8ViGOQWADBRkK6LMqPUKFpFqRLPz2eIa8RErGFXR0Qpa83+8uT/zz0+tYj8Ev2I63Vho/t6+WhU339YU29xsr+J1V/QSb6Go3vF1M89HmhJTW49KXe/PzcxCM7WHpt3FHAYNeRr/0uKp4upa+b0unqr+WbYRUuv4D1YOyLSAq0o4DCfS5rU59Pakzdin/58esCycEsBUG3WFviw8jckYkBLLMIKip6wb6tYOBFQEAr9lXbM/meWW1fv/5SdadFtpTCRFn5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(86362001)(2906002)(33656002)(336012)(6862004)(8676002)(8936002)(2616005)(316002)(41300700001)(82310400005)(47076005)(5660300002)(81166007)(54906003)(36756003)(70206006)(4326008)(70586007)(186003)(6506007)(26005)(6512007)(356005)(107886003)(82740400003)(478600001)(40460700003)(40480700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:36:24.2767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0adbcc-0dc8-4a8f-838c-08db8477b310
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9128

DQo+Pj4gICAgICAgICAgICJpZCI6ICJTQUYtMi1zYWZlIiwNCj4+PiArICAgICAgICAgICAgImFu
YWx5c2VyIjogew0KPj4+ICsgICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNSMS5SOS4xIg0K
Pj4+ICsgICAgICAgICAgICB9LA0KPj4+ICsgICAgICAgICAgICAibmFtZSI6ICJSdWxlIDkuMTog
aW5pdGlhbGl6ZXIgbm90IG5lZWRlZCIsDQo+Pj4gKyAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBm
b2xsb3dpbmcgbG9jYWwgdmFyaWFibGVzIGFyZSBwb3NzaWJseSBzdWJqZWN0IHRvIGJlaW5nIHJl
YWQgYmVmb3JlIGJlaW5nIHdyaXR0ZW4sIGJ1dCBjb2RlIGluc3BlY3Rpb24gZW5zdXJlZCB0aGF0
IHRoZSBjb250cm9sIGZsb3cgaW4gdGhlIGNvbnN0cnVjdCB3aGVyZSB0aGV5IGFwcGVhciBlbnN1
cmVzIHRoYXQgbm8gc3VjaCBldmVudCBtYXkgaGFwcGVuLiINCj4+PiArICAgICAgICB9LA0KPj4+
ICsgICAgICAgIHsNCj4+PiArICAgICAgICAgICAgImlkIjogIlNBRi0zLXNhZmUiLA0KPj4+ICsg
ICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQo+Pj4gKyAgICAgICAgICAgICAgICAiZWNsYWlyIjog
Ik1DM1IxLlI5LjEiDQo+Pj4gKyAgICAgICAgICAgIH0sDQo+Pj4gKyAgICAgICAgICAgICJuYW1l
IjogIlJ1bGUgOS4xOiBpbml0aWFsaXplciBub3QgbmVlZGVkIiwNCj4+PiArICAgICAgICAgICAg
InRleHQiOiAiVGhlIGZvbGxvd2luZyBsb2NhbCB2YXJpYWJsZXMgYXJlIHBvc3NpYmx5IHN1Ympl
Y3QgdG8gYmVpbmcgcmVhZCBiZWZvcmUgYmVpbmcgd3JpdHRlbiwgYnV0IGNvZGUgaW5zcGVjdGlv
biBlbnN1cmVkIHRoYXQgdGhlIGNvbnRyb2wgZmxvdyBpbiB0aGUgY29uc3RydWN0IHdoZXJlIHRo
ZXkgYXBwZWFyIGVuc3VyZXMgdGhhdCBubyBzdWNoIGV2ZW50IG1heSBoYXBwZW4uIg0KPj4+ICsg
ICAgICAgIH0sDQo+PiANCj4+IFNpbmNlIHRoZSBydWxlIGFuZCB0aGUganVzdGlmaWNhdGlvbiBh
cmUgdGhlIHNhbWUsIHlvdSBjYW4gZGVjbGFyZSBvbmx5IG9uY2UgYW5kIHVzZSB0aGUgc2FtZSB0
YWcgb24gdG9wIG9mIHRoZSBvZmZlbmRpbmcgbGluZXMsIHNvIC8qIFNBRi0yLXNhZmUgTUMzUjEu
UjkuMSAqLywNCj4+IGFsc28sIEkgcmVtZW1iZXIgc29tZSBtYWludGFpbmVycyBub3QgaGFwcHkg
YWJvdXQgdGhlIG1pc3JhIHJ1bGUgYmVpbmcgcHV0IGFmdGVyIHRoZSB0YWcsIG5vdyBJIGRvbuKA
mXQgcmVjYWxsIHdobw0KPiANCj4gU29ycnksIEkgc2VlIHRoZXJlIHdhcyBpbiBhIHBhdGNoIGJl
Zm9yZSBhIFNBRi0xLXNhZmUgd2l0aCB0aGUgc2FtZSBqdXN0aWZpY2F0aW9uLCBzbyBJIHN1Z2dl
c3QgeW91IHVzZSBTQUYtMy1zYWZlIGFzIHRhZyBhbmQgZHJvcCB0aGUgbmV3IGp1c3RpZmljYXRp
b25zIGludHJvZHVjZWQgaGVyZQ0KDQpJIG1lYW50IOKAnHVzZSBTQUYtMS1zYWZl4oCdLCBzb3Jy
eSwgSSBzaG91bGQgZG8gbGVzcyBtdWx0aXRhc2tpbmcNCg0K

