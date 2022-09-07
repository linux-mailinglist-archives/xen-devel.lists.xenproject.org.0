Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEDB5B05AC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401803.643747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvR0-0000XR-B3; Wed, 07 Sep 2022 13:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401803.643747; Wed, 07 Sep 2022 13:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvR0-0000Uu-6a; Wed, 07 Sep 2022 13:49:42 +0000
Received: by outflank-mailman (input) for mailman id 401803;
 Wed, 07 Sep 2022 13:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVvQy-0000Uk-Gt
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:49:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea7b6855-2eb3-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:49:39 +0200 (CEST)
Received: from AS8PR04CA0147.eurprd04.prod.outlook.com (2603:10a6:20b:127::32)
 by AS4PR08MB7854.eurprd08.prod.outlook.com (2603:10a6:20b:51d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 13:49:37 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::51) by AS8PR04CA0147.outlook.office365.com
 (2603:10a6:20b:127::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:49:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:49:36 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 07 Sep 2022 13:49:36 +0000
Received: from 2909ebecc0ec.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED4DAFD5-5255-4C1E-AB8A-4641AC5F9325.1; 
 Wed, 07 Sep 2022 13:49:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2909ebecc0ec.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:49:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7346.eurprd08.prod.outlook.com (2603:10a6:150:21::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Wed, 7 Sep
 2022 13:49:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 13:49:29 +0000
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
X-Inumbo-ID: ea7b6855-2eb3-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iqgIhA0/TNEao6IBGPWdKBiAEDBz1hspTwB/wD7Dy4xjTfqZcoWUE+GMBcbDZVeWc+7N1shIe61cuZf5VpEMpl4KWiqx88OeD1XpHFW24lyncSu9I/FErpCmCch8bims223zsMh6i3/lzuha66W59PE7ncI5DBblyjI8JheWtwk0e3rv20BX9UXjac6f7lIxvxlbsioGHVCbuu+rVwlFf3uNrQSpIdV0pPfEDPbrKe6k4exet6d0Ti2XFpw4AcSnUcXW7ta+5kN11xUx8mzJI680uICJanbfpjXCWM0L5tWv2VcVBegsY3sbGNjfGdFq3+eIycXDl/tjQogY3CzeZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCLOjIdtjuWE/LHmRffdfEN0QuE/zrOgtgmC/4qgZ0U=;
 b=ANyB5agPgqy/Vd3xMHxnuntymWVtpwsOz3oM1xEo6mbyFiI8qWyH4wPxokfsjvEK2rO0N1ligyBvIkbjnFkHWdfiOReUWORK+MrdjZASPCtdG1VRHPvIhYJlnS4QHgoQttD0vjanbYz0j05iF1F1KcXiBLuYLyR46SOw4yq5jL1mIlpSgi7G/0R+5OeQ9jWSlaT68H82Zn288k6MmUXk/nqB/Us7N+P6yYObppNubdhzhJMRqNOmaxcW8feEqkV5mFxffFHSVroMaFsITFHXFEfNs+f2ZIR2AMED6ANlE7yLSuCQj2NFu2r02FeN/Dh5azyULA1y7dX7wKANUQZ2HQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCLOjIdtjuWE/LHmRffdfEN0QuE/zrOgtgmC/4qgZ0U=;
 b=2c/6Mm/fLeD1XWt+W0sztHW3La0Iz+PwkyMQ+vczurJziSy1VG8yKCOE3egUB8fFundGv7KCiWd2AVxkxs6xT5qBuwRZr+Uv0Q+YvypicL7OJhkh2hbjUrUP4dX6K8cYYGchKNsPf0mlGak3noJXhtk6rmddjbieHFJCSpHJCy0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG8qGhoi4WQGF9cEIaqulXoW+9hgo1lxzCxHB+vPyw7LAAkAjmJi3FF94B8RFuUUg7dXOwgfTyVGYLoISKw0MRTiINohujBGp2c4VZ0EZQz7iOAh2UthehVGbOFJ0waplMgSfBGjj9Av4cgSehs88nMzoFZXo8cU/1HXCSDi9m3wXsHjqS0aVRRHGElLqZXxcwZM4oUD6OCJ4pCkMzp0C8mA8V3X1bCTQoOVE5kCe46I8TZT9YUozyGUozATTsyquqwKOfbXhBOMwHXZM51LwPb16/icDZBOdeoDyXo0nQEEaGIUSKH5a61Jcvaq2uJc6vm7oK+HbgeDzVnoKKeHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCLOjIdtjuWE/LHmRffdfEN0QuE/zrOgtgmC/4qgZ0U=;
 b=cFK7EmPUfizibVA6PjGKK56dtsBURUYjOQ5XFt82u7ALvRAYctRoi96+Y2vP8p8J65PrCykG9AG5hl7DcyuiWaleVUYG7KDHflPrGZ7a9mSqt/Fz4pr3N6CjJt3+FrJmtJdfuKisNXaNcbHMtFuRNNK9hFxABh6rGRg+R1KDiHMhvcrg090cwH35VSRHAe/nYjY5Vm8MAbbiLsvoA2YAIXrSna8q1JOnbkWfrgAmuRsjv8E2qF+C/+qW7nyEe8xM8EPXRd7Q7W6R6f4pVF15tSNOe2OrXyCwPu1301Hsk0ZB93jwn+t7IeRLOMqnM5jCxa3+TSsEaYjLpp+sJ6hExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCLOjIdtjuWE/LHmRffdfEN0QuE/zrOgtgmC/4qgZ0U=;
 b=2c/6Mm/fLeD1XWt+W0sztHW3La0Iz+PwkyMQ+vczurJziSy1VG8yKCOE3egUB8fFundGv7KCiWd2AVxkxs6xT5qBuwRZr+Uv0Q+YvypicL7OJhkh2hbjUrUP4dX6K8cYYGchKNsPf0mlGak3noJXhtk6rmddjbieHFJCSpHJCy0=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ7IYztv5II0KGaSuPgw9aFq3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAB+gIAAARoAgAACMwCAAABysA==
Date: Wed, 7 Sep 2022 13:49:29 +0000
Message-ID:
 <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
 <eed26206-9684-4010-278c-14ed3602582b@amd.com>
 <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
In-Reply-To: <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1E1A788B65783F47BC5B6C6D997E00E1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 14c09412-1c6c-4dc2-22f0-08da90d7cda9
x-ms-traffictypediagnostic:
	GV1PR08MB7346:EE_|AM7EUR03FT026:EE_|AS4PR08MB7854:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XrG1kTHAbXFxfLT0KYKmIGQonbiGlzVaEza2WxxQrYv7uZsmCduqJ9a+hZx2aN71n7BaradAljPv2H/jB2uAe99Q2oOHRryf6ndJRjkeEp1GKyjj4hLHhK6/qN8N+VRniKscxL+obg0B5coCaRp2pkZD920uF1IonpZHjiqjhy56TMbPGUDVfKy8EVkqTRHhDrPLRv+CIRdy3kY6ujKGEE6v0t8JyxOIwb74PF4YPUdx1yYUvACBWczk1rc/UEWFWU+TJjxdU5riYfSurKlc6nGn+ts4Wm0ICYl/Vd/pfRF9Fl6TgVQn4IwOMnHvFEQi5G8nlM46KXkIoUEqnPzBwjxByMxB6Eo81oTfmXStwjm6V4KHrppeTGalxGT1lbutAr5DYxoaZvGlCaMcSufeT3KdBTXes7kKNMzCJOwPk06A1GSwo1vlKAF9uMZZNj6BIgnsNwiICTUaty7vqbH8E5x9B6xnSRwhPoPu9y3Hlyq9gsy1tODAnm7Qj2ZEl6O87GS2ggWyOjH+qeDH/h3bvR83plQoAqLpiPkvCOR4rEEsIbt/vA0mPlmG9KKG+plQ+MiyP+Gi6+MQ/4rPnudknj6Ru5UDHZ+F+g8CQmxrfaMrtjfCzIJPirLtZasqo/RJEZotjfCeY+avR30dv9UPGqcdYDW6zZt3fQnxEr+ABtJCPSMnHKayo0m30UBxmRlBJLJpTYPA+Sg3r2jfRrA0pMC5s55F05btnBU1xjuzZdrQ259p8TPQ/6q0nqG0hf/YqYi552848A0IjPFTb53g5Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(316002)(71200400001)(33656002)(86362001)(9686003)(478600001)(83380400001)(55016003)(7696005)(26005)(186003)(41300700001)(6506007)(2906002)(38070700005)(66476007)(4326008)(52536014)(122000001)(110136005)(5660300002)(66446008)(8936002)(38100700002)(64756008)(76116006)(66556008)(66946007)(54906003)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68e4ba0f-2f85-4afe-d554-08da90d7c908
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AtV62Y0qLGw9XbWFIaEsXfOQxGPNzR3hTqIH5CnYLA7cWpbHgbnd1BfR11CLFbZJTWSZy9LxdVaXX4d6RdSdXtH/thEXYnEBC4pSUJh2DzVEsUIKeSCt4djlnCJCh0gLIY7P+DHW/QWT7WAL/Wh4v9CDFzKkAOqmKl6eE9IYBB0g9FHSOOQz0aIcXvhUHLMPpG+zuT9CaEOQ2kOfk8OCjBONG/KqeVXIi7svpC/6NJv/jsAafQwHmZ+QdzrtgzH7SJUbewYoPVcEz6IA7RfyeHCko0UFtQcJjMR4L+UnWriQyRtbmYt9K7ru7lfmvu1GO4gYvZoLdx4Hn1xw3RPrjoupppzobIAUSlQwHnrx7jWHR4TW1fK02MgEe5UfgXJGobbvZOp/hI0IkgFrmOoCnv83NNsvYglnmyu3zVohy+zmo6nJX0cb7PxvQ4hqL28kB7K5KbgQsgo/7rDzt21CW1doI73YhvkV17KF7DbAulv3kJVT1w6VcBS6tScYOg6g1xhgVT646WIM+1QxgZe71T6lrh3XYauBZKMj5PqC/0dG/JzvMlEDKRSg0DMzxRYXrrDUwtFS22ApfThX7TDILkubbwu2rp2wqmXU7zOQB0hpmAnPRKKKRKRNSNkSZ2fEBRUZd7J419zNDYzSqcci1aym0Irr/Ypb5EDJ2jjjV1pOWZZscj3apIMAEd8cXgXsUd2kPq4UHUEVsqpFceEoHLW7nAA9QeOuW0FvZx4UysBIFTCqsk0eyJasvFvNzx5O1z1gRqfSIzwyuR2SEB3p1A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(46966006)(40470700004)(9686003)(7696005)(54906003)(8676002)(82740400003)(5660300002)(6506007)(356005)(26005)(110136005)(55016003)(70586007)(4326008)(82310400005)(70206006)(2906002)(316002)(33656002)(478600001)(86362001)(41300700001)(36860700001)(336012)(81166007)(8936002)(40480700001)(186003)(83380400001)(52536014)(40460700003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:49:36.8503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c09412-1c6c-4dc2-22f0-08da90d7cda9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7854

SGkgQmVydHJhbmQgYW5kIE1pY2hhbCwNCg0KSSBkb24ndCB3YW50IHRvIHNwYW0gdGhlIGVtYWls
IHNvIEkganVzdCByZXBseSBoZXJlLi4uDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiA+
Pj4+IEJ1dCBpbiBhbnkgY2FzZSB3ZSBzaG91bGQgb25seSBhZGQgb25lIHBhaXIgaGVyZSBmb3Ig
c3VyZSwgYXMgeW91IHNheQ0KPiB0aGUNCj4gPj4+PiBvbmx5IGltcGxpY2F0aW9uIGlzIHRvIGFk
ZCBhIGNvdXBsZSBvZiAwIGluIHRoZSB3b3JzdCBjYXNlLg0KPiA+Pj4gSSBhZ3JlZS4gVGhlIG9u
bHkgZHJhd2JhY2sgaXMgdGhlIG5lZWQgdG8gbW9kaWZ5IHRoZSBhbHJlYWR5IGludHJvZHVjZWQN
Cj4gcHJvcGVydGllcw0KPiA+Pj4gdG8gYmUgY29oZXJlbnQuDQo+ID4+DQo+ID4+IEFncmVlLCBz
b21lb25lIHdpbGwgbmVlZCB0byBkbyBhIHBhc3Mgb24gdGhlIHdob2xlIGRvYyB3aGljaCBtaWdo
dCBiZQ0KPiBlYXNpZXIgd2l0aCBhbGwgdGhpbmdzIGluLg0KPiA+Pg0KPiA+IFdlbGwsIG5vdCBv
bmx5IGRvY3MuIElmIHdlIGRlY2lkZSB0byB1c2UgYSBzaW5nbGUgcGFpciBvZiAjYWRkcmVzcy1j
ZWxscyBhbmQNCj4gI3NpemUtY2VsbHMsIHRoZW4NCj4gPiB3ZSBuZWVkIHRvIG1vZGlmeSB0aGUg
Y29kZSB0aGF0IGV4cGVjdHMgZGlmZmVyZW50IHByb3BlcnRpZXMgZS5nLg0KPiB4ZW4sc3RhdGlj
LW1lbS17YWRkcmVzcy9zaXplfS1jZWxscy4NCj4gDQo+IFJpZ2h0IEkgZm9yZ290IHRoYXQgc29t
ZSBwYXJ0cyBhcmUgYWxyZWFkeSBpbi4NCj4gU28gd2Ugd2lsbCBuZWVkIGFuIGV4dHJhIHBhdGNo
IHRvIGhhbmRsZSB0aG9zZS4NCg0KSSB0aGluayBJJ3ZlIGFkZHJlc3NlZCBhbGwgY29tbWVudHMg
ZnJvbSBKdWxpZW4gcmVnYXJkaW5nIG15IHNlcmllcywNCnNvIEkgdGhpbmsgSSd2ZSBnb3Qgc29t
ZSBiYW5kd2lkdGggdG8gZG8gdGhlIGNsZWFuLXVwIHBhdGNoIHRvbW9ycm93DQphZnRlciB0aGUg
YWdyZWVtZW50LCB1bmxlc3Mgc29tZW9uZSB3b3VsZCBsaWtlIHRvIGRvIGl0IGhpbXNlbGY/DQoN
CktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEJlcnRyYW5kDQo+IA0KPiA+DQo+ID4+IENo
ZWVycw0KPiA+PiBCZXJ0cmFuZA0KPiA+Pg0KPiA+Pj4NCj4gPj4+Pg0KPiA+Pj4+IENoZWVycw0K
PiA+Pj4+IEJlcnRyYW5kDQo+ID4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBDaGVl
cnMsDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gLS0NCj4gPj4+Pj4+IEp1bGllbiBHcmFsbA0KPiANCg0K

