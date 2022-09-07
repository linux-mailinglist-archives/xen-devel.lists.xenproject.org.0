Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB15B051D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401716.643623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv77-0000C9-Ko; Wed, 07 Sep 2022 13:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401716.643623; Wed, 07 Sep 2022 13:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv77-00009b-Gm; Wed, 07 Sep 2022 13:29:09 +0000
Received: by outflank-mailman (input) for mailman id 401716;
 Wed, 07 Sep 2022 13:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVv75-000065-PG
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:29:07 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50075.outbound.protection.outlook.com [40.107.5.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c24528a-2eb1-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:29:07 +0200 (CEST)
Received: from AM6PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:20b:92::36)
 by PAWPR08MB9757.eurprd08.prod.outlook.com (2603:10a6:102:2e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 13:29:04 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::ad) by AM6PR04CA0023.outlook.office365.com
 (2603:10a6:20b:92::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:29:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:29:02 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 07 Sep 2022 13:29:02 +0000
Received: from 91ba1e1ff523.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C47F0EF7-C091-49C4-B55E-C0FB735384FD.1; 
 Wed, 07 Sep 2022 13:28:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91ba1e1ff523.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:28:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB4PR08MB9334.eurprd08.prod.outlook.com (2603:10a6:10:3f5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 13:28:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:28:49 +0000
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
X-Inumbo-ID: 0c24528a-2eb1-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lPBGWYqG2FR61szwVwvJ+0LLu/Z7KDF5fQIfae2Ft8+tFkloSBCNW6TuPYJEnc3orq2fau4pxer2hZzE/tN0aotm6yInr5fge7vCMXqEPBUtGUoTQ0KGg0GY43Dz1SBvMjMj2CkUBIX23/ocSgVa2eaCSwswp3VYRMolwXMbn1doktEsj3GLKHK74RNukdiutVUWGiknNNg7Hf0ntzfE3Pi/VXDbC/velfip5tFa+yjDPRMhpuBlDhlEbd9y0k5CtIsIjZqQ+JIap5ZzEIVxZ9FvY94D3Y0Ty5k7J11baTkPJoqmqMbATE7zi4Pt3dkYCzNvrVsivH7BVc/BpTF6EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8PyPpVQ92K9xxeK9j9wICl355Hq9zTDxVioWlA9hEg=;
 b=Zt7n1lo7WaBFRjRrrriJLUEvpsme29IZq5ezMzHV/jlni3U2I0zizhOOduUZlT4zMjYuOPEb8SlrUOUnL8YKh2vTsWBNQdfWYGpdJEmumGbipZQzcpCwg9TQWX6OUV6kd5vmfgh41Itr6n7fVjL05dWNrv4vPnkHeibiYYICbtvqNWowszEBLfw1EZv9/DdGl6i21Dy/TYEa+qnwLvWc457ihYU6bvyB3pdOYqvBYjEJm+FKIbh5TNhQ2hGRMd5JjUugko6Ifv5jA2NwuB7j+/OdBlsp/lBvFVGdL2VAxRSX9/wGRJfh+TnDYbQjdRhWJUnUIPKGqMaLUv3Xf/WXkg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8PyPpVQ92K9xxeK9j9wICl355Hq9zTDxVioWlA9hEg=;
 b=gQT0DSO/phkWXLLwf8B6RIcR/98MXD63N9+PKQx0IqULispXDy2REG/ffzuQtekenQOWQLrmeUgcyb27BkjU+EgiR7HNMUeiC/K+IyQThVCgjt+Qrny2ZWVCV13ZmG7TDOxDP0lup7ne/SCV+eUIFEDQQ82xRkO+DHni4V7qGz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f8ee5f023d5adc1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsRXdRysxhU15Npg1uJTfAMsz7H2/hQcgD/6RPN1szdgi59fk2WEc1hTK9LklGy82pBCE4iTqSGpUUW+H569DcnbC0MAhHJSSW2GYEsq/L+Bn0uhN5xsg9qJoG5uvFZ16GFVd2oGhfRO9UxwWTWfBqg7TUtu21e3IXpkpyE7w4KzxaNbl+JkhilLYuWOmktin4nbJAMjYFgNaNMgkiZ2x8mL8oDXpxrp8rbkY4cTCkyKKdNlCrE9DmkbXS3g8v1eOZeOA5Hlot5Ua/Wgm5ruSk+r+zk94oAWdMq7RyLJg8JlY+BCb/lnY4+/BRt7tqibaKpCn+hlwHIM53J6ICrh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8PyPpVQ92K9xxeK9j9wICl355Hq9zTDxVioWlA9hEg=;
 b=maR4b10Z+1BB8VoB4HRFt43t9+sbz5JZAQMQg6dIFSwTHJp8yCJERlsOV6H6bngDH0r4+VlgLgrNJ2aB5CwhAg7h6A9QMsyTourBjbHB0LI6eZlXrMe2lIAY9AHKc1bpiMnPt4V5JSw5EGZV++5wE5CiRx2AVZlGKmsygo6AtlEou0fW9TgbmyMYGdf9Vc7S2pyZlMoS+rzbyGK7oLHPMB1mTaDDKARV9Ug9wtgaZC3OZWvYM+bs16suPJO0Qsab1K8s9iU/HmqKAmkUeSaF72EhW4i5zjkAI+lIbLZz2UUdp9lfCwRKNM3sdJe86HGtZG6FOi4sR+Fzs9s1uvxGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8PyPpVQ92K9xxeK9j9wICl355Hq9zTDxVioWlA9hEg=;
 b=gQT0DSO/phkWXLLwf8B6RIcR/98MXD63N9+PKQx0IqULispXDy2REG/ffzuQtekenQOWQLrmeUgcyb27BkjU+EgiR7HNMUeiC/K+IyQThVCgjt+Qrny2ZWVCV13ZmG7TDOxDP0lup7ne/SCV+eUIFEDQQ82xRkO+DHni4V7qGz4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCA
Date: Wed, 7 Sep 2022 13:28:49 +0000
Message-ID: <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
In-Reply-To: <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a95e9cc6-bd53-4888-af06-08da90d4edfd
x-ms-traffictypediagnostic:
	DB4PR08MB9334:EE_|AM7EUR03FT035:EE_|PAWPR08MB9757:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 glsKhl1sDnMlG6h7Ns4YHz117FKXWWxRPnnA8oEyP0qsKtBotIUHvv6C6F2zW1vjZKIkvUJ6/LKzGeaCNjjsRyZy1gvYV7n4ZZHFPLmOMI4XWNRYrqFGjbcsUTmqX+JmsmbS0S4vTcg2FFHVmmXJX71u8qbDJ+203MQMhNi1wXjRP+OLAz04nKjstfBwmjknSc4t+z1oSSwtogQ5eygHo3ubSbyOToQ/jnZviogpY6z9FGzj/XFrOE3JFxzwW1i41EXUco7VcH4QzfvvLgICLds3r0O64ezCx8sdZ1BOnJZqPtrdZ7e98sJF5xMXC5lC2VOuVabnpL0spgkOdcYE+xLOsj8NclkhNC7lLDaoVZcfntomIQUgEbPfRw7nyDxYd5fIo+V0YO8TGYoEfaFQTKk1tyDos1pxgJk+irKlMutwTao1wQju7Nt28/bVET9FXEXyqOgeNutB+orLnzkxdynotSFaq9l2742gGy2RmMnbv6SeKyCOKcozTU1CG/ayo7pIl73R4wRhjjGixax23tRXf9Y/9sU329sKnb/k6ViZbhpp3CUkyM6934o+ydxrpBil2MVT7l53tuwG7P1H53U5Z2TZaZv0AZu84T7BdbNJvl2i2OB8+RtzJi5t+lBXy43UjGEuAyTyz4cxu4zsHWgM+uCANUjxKTK7M9HkpKtpeh4tKH3dUP+kkCOAivp82TzDVzQhKLTNbU9OQILEvlAQqt/KSEaHJGZ9beO84sclZkidVIABlAV0f6BYfIgIkwF9gt643v1Oq4grxwn3jYQFjHaIdw1YWUKw9rUExZohSE9MIHUYEmZLN8wF2NfI+RuuwX26uhz7H4vF6lmAYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(38070700005)(64756008)(66556008)(66946007)(38100700002)(122000001)(91956017)(8676002)(66476007)(4326008)(66446008)(6916009)(76116006)(45080400002)(316002)(8936002)(54906003)(5660300002)(186003)(41300700001)(83380400001)(6512007)(2906002)(2616005)(966005)(6486002)(478600001)(71200400001)(53546011)(33656002)(26005)(6506007)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D40B3221283544E9E8A79252CE67DD7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9334
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9207c394-1f8c-4dc0-b75f-08da90d4e642
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8L7B1gtdgh1J5RHZ6KYNDRiv6xjaRI72C7o8EktMdCeEPhyHqYuVklrV/1UQL5dcVwBbFL4wTI9eYiabTpq4n1eqAssa3J79TX9h+/rm0RBp8AQQQ3ebQOOtooAUbTzKABsl4NT0By7ONzWdtI9V8Nn3ITtOvEluQy5MHbswfI54Yi2a97mF8SmnAPZmDrScOgoOyypM+zojT+1rrlQ/7m91vdRiBoRFMPX2lrBG1hOlKSlfLoif6mxDY2A84WTDPqr19c9nfvb1S2xYGUtlWceytbC8gXXalm/2tI7YdnLiRT7WRAKluCMyLx2ENZTVHXTXdhAKH0AJpBVdl2pOD6TmyoRflLYrduMA75gxEJIoPRbzrUmmiD70Msoot8/HEkWJZYj3rdeUI3vUpAm2xsL5BRSdGW01jJIq/IpQav31CVKSfKGTnJZDnaWfyGSrSy68gMSBDoMXkkpubL6BmY4WoablNiMPBM757wWaLqQMYNvglLPBK7ZoqtpeESlztdcr63x5V/R+uTejbZWOsBheFZcQXv/teAIbbIZMEACkn+ZHZu8J+ycwIP3EMMH+PI80meyfRtARVOtd7uUAdJufyMHc/SsBrDVCup4HEYLI3/6jizSqH3B4j6k6GyL0+4BhcYJD5BURVu4gizfKB1Tkd+TwuiaBy/Sm2o1YEbNP8Y+MLJXNtk31TVnI+tXsfziWgYW3uaXfGY6jFEfne0IY68VuLIh17K4zMsWv0qEYcMm22GKD6tj7izIdkEatfZQqyw+oRHLPsYAtj4F7ZudPOo7LIJbgu6Jq6pZtkEY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(40470700004)(36840700001)(82740400003)(26005)(356005)(83380400001)(36860700001)(40460700003)(54906003)(70586007)(81166007)(8676002)(4326008)(82310400005)(316002)(2906002)(45080400002)(70206006)(8936002)(86362001)(40480700001)(5660300002)(6862004)(478600001)(336012)(2616005)(53546011)(6486002)(966005)(6506007)(6512007)(47076005)(41300700001)(186003)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:29:02.5857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a95e9cc6-bd53-4888-af06-08da90d4edfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9757

SGkgTWljaGFsLA0KDQo+IE9uIDcgU2VwIDIwMjIsIGF0IDE0OjA5LCBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDE0OjQ1
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiANCj4+IE9uIDA3LzA5LzIwMjIgMTM6NDEsIE1pY2hh
bCBPcnplbCB3cm90ZToNCj4+PiANCj4+PiANCj4+PiBPbiAwNy8wOS8yMDIyIDE0OjMyLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4+Pj4gDQo+
Pj4+IE9uIDA3LzA5LzIwMjIgMTM6MTIsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+Pj4+IEhpIEp1
bGllbiwNCj4+Pj4gDQo+Pj4+IEhpIE1pY2hhbCwNCj4+Pj4gDQo+Pj4+PiBPbiAwNy8wOS8yMDIy
IDEzOjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gSGkgSGVucnksDQo+
Pj4+Pj4gDQo+Pj4+Pj4gV2hpbGUgcmV2aWV3aW5nIHRoZSBiaW5kaW5nIHNlbnQgYnkgUGVubnkg
SSBub3RpY2VkIHNvbWUgaW5jb25zaXN0ZW5jeQ0KPj4+Pj4+IHdpdGggdGhlIG9uZSB5b3UgaW50
cm9kdWNlZC4gU2VlIGJlbG93Lg0KPj4+Pj4+IA0KPj4+Pj4+IE9uIDA3LzA5LzIwMjIgMDk6MzYs
IEhlbnJ5IFdhbmcgd3JvdGU6DQo+Pj4+Pj4+ICstIHhlbixzdGF0aWMtaGVhcA0KPj4+Pj4+PiAr
DQo+Pj4+Pj4+ICsgICAgUHJvcGVydHkgdW5kZXIgdGhlIHRvcC1sZXZlbCAiY2hvc2VuIiBub2Rl
LiBJdCBzcGVjaWZpZXMgdGhlIGFkZHJlc3MNCj4+Pj4+Pj4gKyAgICBhbmQgc2l6ZSBvZiBYZW4g
c3RhdGljIGhlYXAgbWVtb3J5LiBOb3RlIHRoYXQgYXQgbGVhc3QgYSA2NEtCDQo+Pj4+Pj4+ICsg
ICAgYWxpZ25tZW50IGlzIHJlcXVpcmVkLg0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICstICN4ZW4sc3Rh
dGljLWhlYXAtYWRkcmVzcy1jZWxscyBhbmQgI3hlbixzdGF0aWMtaGVhcC1zaXplLWNlbGxzDQo+
Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICBTcGVjaWZ5IHRoZSBudW1iZXIgb2YgY2VsbHMgdXNlZCBm
b3IgdGhlIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlDQo+Pj4+Pj4+ICsgICAgInhlbixzdGF0aWMt
aGVhcCIgcHJvcGVydHkgdW5kZXIgImNob3NlbiIuDQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK0JlbG93
IGlzIGFuIGV4YW1wbGUgb24gaG93IHRvIHNwZWNpZnkgdGhlIHN0YXRpYyBoZWFwIGluIGRldmlj
ZSB0cmVlOg0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgLyB7DQo+Pj4+Pj4+ICsgICAgICAgIGNo
b3NlbiB7DQo+Pj4+Pj4+ICsgICAgICAgICAgICAjeGVuLHN0YXRpYy1oZWFwLWFkZHJlc3MtY2Vs
bHMgPSA8MHgyPjsNCj4+Pj4+Pj4gKyAgICAgICAgICAgICN4ZW4sc3RhdGljLWhlYXAtc2l6ZS1j
ZWxscyA9IDwweDI+Ow0KPj4+Pj4+IA0KPj4+Pj4+IFlvdXIgYmluZGluZywgaXMgaW50cm9kdWNl
ICN4ZW4sc3RhdGljLWhlYXAte2FkZHJlc3MsIHNpemV9LWNlbGxzDQo+Pj4+Pj4gd2hlcmVhcyBQ
ZW5ueSdzIG9uZSBpcyB1c2luZyAje2FkZHJlc3MsIHNpemV9LWNlbGxzIGV2ZW4gaWYgdGhlIHBy
b3BlcnR5DQo+Pj4+Pj4gaXMgbm90ICJyZWciLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgd291bGQgbGlr
ZSBzb21lIGNvbnNpc3RlbmN5IGluIHRoZSB3YXkgd2UgZGVmaW5lIGJpbmRpbmdzLiBMb29raW5n
IGF0DQo+Pj4+Pj4gdGhlIHRyZWUsIHdlIGFscmVhZHkgc2VlbSB0byBoYXZlIGludHJvZHVjZWQN
Cj4+Pj4+PiAjeGVuLXN0YXRpYy1tZW0tYWRkcmVzcy1jZWxscy4gU28gbWF5YmUgd2Ugc2hvdWxk
IGZvbGxvdyB5b3VyIGFwcHJvYWNoPw0KPj4+Pj4+IA0KPj4+Pj4+IFRoYXQgc2FpZCwgSSBhbSB3
b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQganVzdCB1c2Ugb25lIHNldCBvZiBwcm9wZXJ0eQ0K
Pj4+Pj4+IG5hbWUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gSSBhbSBvcGVuIHRvIHN1Z2dlc3Rpb24gaGVy
ZS4gTXkgb25seSByZXF1ZXN0IGlzIHdlIGFyZSBjb25zaXN0ZW50IChpLmUuDQo+Pj4+Pj4gdGhp
cyBkb2Vzbid0IGRlcGVuZCBvbiB3aG8gd3JvdGUgdGhlIGJpbmRpbmdzKS4NCj4+Pj4+PiANCj4+
Pj4+IEluIG15IG9waW5pb24gd2Ugc2hvdWxkIGZvbGxvdyB0aGUgZGV2aWNlIHRyZWUgc3BlY2lm
aWNhdGlvbiB3aGljaCBzdGF0ZXMNCj4+Pj4+IHRoYXQgdGhlICNhZGRyZXNzLWNlbGxzIGFuZCAj
c2l6ZS1jZWxscyBjb3JyZXNwb25kIHRvIHRoZSByZWcgcHJvcGVydHkuDQo+Pj4+IA0KPj4+PiBI
bW1tLi4uLiBMb29raW5nIGF0IFsxXSwgdGhlIHR3byBwcm9wZXJ0aWVzIGFyZSBub3QgZXhjbHVz
aXZlIHRvICdyZWcnDQo+Pj4+IEZ1cnRoZXJtb3JlLCBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgcmVz
dHJpY3Rpb24gZm9yIHVzIHRvIHJlLXVzZSB0aGVtLiBEbw0KPj4+PiB5b3UgaGF2ZSBhIHBvaW50
ZXI/DQo+Pj4gDQo+Pj4gQXMgd2UgYXJlIGRpc2N1c3NpbmcgcmUtdXNhZ2Ugb2YgI2FkZHJlc3Mt
Y2VsbHMgYW5kICNzaXplLWNlbGxzIGZvciBjdXN0b20gcHJvcGVydGllcyB0aGF0IGFyZSBub3Qg
InJlZyIsDQo+Pj4gSSB0b29rIHRoaXMgaW5mbyBmcm9tIHRoZSBsYXRlc3QgZGV2aWNlIHRyZWUg
c3BlY3MgZm91bmQgdW5kZXIgaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3LmRldmljZXRyZWUub3JnJTJGc3BlY2lmaWNh
dGlvbnMlMkYmYW1wO2RhdGE9MDUlN0MwMSU3Q21pY2hhbC5vcnplbCU0MGFtZC5jb20lN0M0ZjM1
ZTlmOTNiNzQ0M2FjNzNjODA4ZGE5MGNlY2MyMiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2Mzc5ODE1MTUxMjI5OTMxMTElN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9VGlFU1lTNlJYZGlQTFg4V0ZV
VjBDc3p0QXZLN21IU3VkJTJCMHhvSnF3QXcwJTNEJmFtcDtyZXNlcnZlZD0wOg0KPj4+ICJUaGUg
I2FkZHJlc3MtY2VsbHMgcHJvcGVydHkgZGVmaW5lcyB0aGUgbnVtYmVyIG9mIDx1MzI+IGNlbGxz
IHVzZWQgdG8gZW5jb2RlIHRoZSBhZGRyZXNzIGZpZWxkIGluIGEgY2hpbGQgbm9kZSdzIHJlZyBw
cm9wZXJ0eSINCj4+PiBhbmQNCj4+PiAiVGhlICNzaXplLWNlbGxzIHByb3BlcnR5IGRlZmluZXMg
dGhlIG51bWJlciBvZiA8dTMyPiBjZWxscyB1c2VkIHRvIGVuY29kZSB0aGUgc2l6ZSBmaWVsZCBp
biBhIGNoaWxkIG5vZGXigJlzIHJlZyBwcm9wZXJ0eSINCj4+IA0KPj4gUmlnaHQuIEJ1dCB0aGVy
ZSBpcyBub3RoaW5nIGluIHRoZSB3b3JkaW5nIHN1Z2dlc3RpbmcgdGhhdA0KPj4gI2FkZHJlc3Mt
Y2VsbHMgYW5kICNzaXplLWNlbGxzIGNhbid0IGJlIHJlLXVzZWQuIEZyb20gWzFdLCBpdCBpcyBj
bGVhcg0KPj4gdGhhdCB0aGUgbWVhbmluZyBoYXMgY2hhbmdlZC4NCj4+IA0KPj4gU28gd2h5IGNh
bid0IHdlIGRvIHRoZSBzYW1lPw0KPiBJIHRoaW5rIHRoaXMgaXMgYSBtYXR0ZXIgb2YgaG93IHNv
bWVvbmUgcmVhZHMgdGhlc2Ugc2VudGVuY2VzLg0KPiBJIGRvIG5vdCB0aGluayB0aGF0IHN1Y2gg
ZG9jdW1lbnRzIG5lZWQgdG8gc3RhdGU6DQo+ICJUaGlzIHByb3BlcnR5IGlzIGZvciB0aGUgcmVn
LiBEbyBub3QgdXNlIGl0IGZvciBvdGhlciBwdXJwb3Nlcy4iDQo+IFRoZSBmaXJzdCBwYXJ0IG9m
IHRoZSBzZW50ZW5jZSBpcyBlbm91Z2ggdG8gaW5mb3JtIHdoYXQgaXMgc3VwcG9ydGVkLg0KPiAN
Cj4gT24gdGhlIG90aGVyIGhhbmQsIGxvb2tpbmcgYXQgWzFdIHRoZXNlIHByb3BlcnRpZXMgZ290
IG5ldyBwdXJwb3Nlcw0KPiBzbyBJIHRoaW5rIHdlIGNvdWxkIGRvIHRoZSBzYW1lLiBOb3cgdGhl
IHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2Ugd2FudCB0aGF0Lg0KPiBJIHRoaW5rIGl0IGlzIGRvYWJs
ZSB0byBqdXN0IGhhdmUgYSBzaW5nbGUgcGFpciBvZiAjYWRkcmVzcy8jc2l6ZSBwcm9wZXJ0aWVz
Lg0KPiBGb3IgaW5zdGFuY2UgeGVuLHNoYXJlZC1tZW0gcmVxdWlyaW5nIGp1c3QgMHgxIGZvciBh
ZGRyZXNzL3NpemUNCj4gYW5kIHJlZyByZXF1aXJpbmcgMHgyLiBUaGlzIHdvdWxkIGp1c3QgaW1w
bHkgcHV0dGluZyBhZGRpdGlvbmFsIDB4MDAuDQoNCkkgdGhpbmsgd2Ugd2FudCBpbiBnZW5lcmFs
IHRvIHJlZHVjZSBjb21wbGV4aXR5IHdoZW4gcG9zc2libGUuDQpIZXJlIHdlIGFyZSBhZGRpbmcg
YSBsb3Qgb2YgZW50cmllcyBpbiB0aGUgZGV2aWNlIHRyZWUgd2hlcmUgd2Uga25vdyB0aGF0DQpp
biBhbGwgY2FzZXMgaGF2aW5nIG9ubHkgMiB3aWxsIHdvcmsgYWxsIHRoZSB0aW1lLg0KDQpJIGFt
IG5vdCBjb252aW5jZWQgYnkgdGhlIGFyZ3VtZW50cyBvbiBub3QgdXNpbmcgI2FkZHJlc3MtY2Vs
bHMgYW5kIHdpbGwNCmxlYXZlIHRoYXQgb25lIHRvIFN0ZWZhbm8NCg0KQnV0IGluIGFueSBjYXNl
IHdlIHNob3VsZCBvbmx5IGFkZCBvbmUgcGFpciBoZXJlIGZvciBzdXJlLCBhcyB5b3Ugc2F5IHRo
ZQ0Kb25seSBpbXBsaWNhdGlvbiBpcyB0byBhZGQgYSBjb3VwbGUgb2YgMCBpbiB0aGUgd29yc3Qg
Y2FzZS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPj4gDQo+PiBDaGVlcnMsDQo+PiANCj4+
IC0tDQo+PiBKdWxpZW4gR3JhbGwNCg0K

