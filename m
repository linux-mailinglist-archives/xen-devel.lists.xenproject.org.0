Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE9956864F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 13:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362139.592059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92nH-0004oU-5l; Wed, 06 Jul 2022 11:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362139.592059; Wed, 06 Jul 2022 11:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92nH-0004m2-1y; Wed, 06 Jul 2022 11:02:07 +0000
Received: by outflank-mailman (input) for mailman id 362139;
 Wed, 06 Jul 2022 11:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOwg=XL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o92nE-0004ls-Qb
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:02:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10040.outbound.protection.outlook.com [40.107.1.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102ae7ee-fd1b-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 13:02:02 +0200 (CEST)
Received: from AM6PR10CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::18)
 by PR3PR08MB5851.eurprd08.prod.outlook.com (2603:10a6:102:85::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 11:02:00 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::ff) by AM6PR10CA0005.outlook.office365.com
 (2603:10a6:209:89::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Wed, 6 Jul 2022 11:01:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:01:58 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Wed, 06 Jul 2022 11:01:58 +0000
Received: from 0fd366654a94.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E189583-7E83-45C0-9AD3-22136D48E21C.1; 
 Wed, 06 Jul 2022 11:01:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fd366654a94.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 11:01:52 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DU0PR08MB7993.eurprd08.prod.outlook.com (2603:10a6:10:3e0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 11:01:50 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.015; Wed, 6 Jul 2022
 11:01:50 +0000
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
X-Inumbo-ID: 102ae7ee-fd1b-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hEgmOs+me5WpT3CZBTYkf6oVrHKkYspJ/k6ZVfmNKOEkIvosRmnjPER3XoUAQPO15dxTcnA6CFeGKhTmIFJrv+BCjvYC5v76UYiWSpJvUJWiQF1XGJeSRGvzeC299B20jEDc1gy5IBgZSVkXC7EUTzCOEZvk8dHEcNVQJpreMm2WWDuQT/Rg2dtbDszh9+qG42dLBK8tMQBa6LEZaqvsMg0rG6mAnjk+2nm5O/R10wIGo76rt4dsPM3IOvItEqemdxWLxvIlyoMdKIyTwmyIL58hAZd4QrzoiebamdijsxPzlaR+qLoZOeYP+cpHm9JDvbkeEFsoLxiqbUj4CXSWzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AHvB7ins89WpfSqIps/7lJFHP4PZk57CUcJRupgc2I=;
 b=m4bho4/cW7Hy85Ipu38ZFh/mHek/4qsaRSpmx+YoLmiy00Wuy6f8jNRdPpUM/gy9pohhQ23YpBMNlCo1q7dQJDj/JtdDYDy6uOUR4E6vggXOJ5DmVbyHVxSk5sHPuD3L3kugJV1EWjpl7NlJ8pfFMSYtykZRN/Oiu85Qbi6VcvtIZdwo7wkVNBToF3R8wWDlZlGPSbx4Uavic0ehVd9Alsq39gg54Sptx4JEjrs+l1qfyBTGqj201gJTKSvFHkFgD7j+dxwdCVrYnHSXudaS+yO3HXQRdehLCcw4i5u9/ia1huG2pUnPoN2RLa1eTirhrhg/EtwIOiUYIG4+mYzYDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AHvB7ins89WpfSqIps/7lJFHP4PZk57CUcJRupgc2I=;
 b=g8uBvh8eGuB4TGgmg+MyFIqJsjSSqsHGbw9z4kQn0wCm43SqTh0RWanGDkkuh+0lePYpAIASVnFq+Uj9z2zqcrK8SHfcL3hUFIgZBXwCZ1yTtYOH589sUCkeb1Rj426bT/5XDFRfQ+c6Qger6mZvzDl5SSPxUnU/g+Rba/9ZMoQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c3dd1468fb7c9c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hywtD6nEgcylpZqD6oGREErU+sz7UcAVtZW0Eu2DpAsF1N+GsS180WT8RjGrYlAwLziaYbiypmHpuNU9e41/5TNhdHUmv7CmX/V6bqWu8PE9axKE0IhzV340yIcVyZp7vMgE+ScBYRCPhSB11tfUO2ogQm/PGmj6gUYryXd8kb3gmy4qlRMdyFw90WnM6GT1ig24w7C9DAMuvtxJTJjvzOYBcRFH+rlPngsHObkOE6ILvDo87lLY+OEvhwZWWg3E6F0Cz3UxwoOC+1VA8CuPvGTsjG6hLdTI5OCOxMTNlkgS6Kdhk6+uyzqj0gW/BMRbNSMrfbxuK2Z0RGdWCFYskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AHvB7ins89WpfSqIps/7lJFHP4PZk57CUcJRupgc2I=;
 b=N7fmR1evGdbNstwaHW4j9ryUK0pi7FTiwBIzV9HiI32sJwpJ+F8lBfJLOorzXqraFBXu4/f2pi78pbvc8wRbSwwNVIIDLtPLCwDNpWeh649C7/Er+hvb/qs4twgQLGwYCMxkTT65bCiL32reezhF1yESvnTh2sPEwogHCErBXsxST9zNx0Xugs5IeNkpmO8icBJzTQXKCtfMPJoDu4S5mBq8djzt5rK0r2enwSgDmfGsii3zCsiSVNGBNSAahh6b6z9vkx1fWn5mPds9Y3NgsSkfM2oM0OuaFbYXKBLKry5dxd/31g/l8B4XnkMEB5c5GgVt8k97fC0GYy0u4vxToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AHvB7ins89WpfSqIps/7lJFHP4PZk57CUcJRupgc2I=;
 b=g8uBvh8eGuB4TGgmg+MyFIqJsjSSqsHGbw9z4kQn0wCm43SqTh0RWanGDkkuh+0lePYpAIASVnFq+Uj9z2zqcrK8SHfcL3hUFIgZBXwCZ1yTtYOH589sUCkeb1Rj426bT/5XDFRfQ+c6Qger6mZvzDl5SSPxUnU/g+Rba/9ZMoQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Thread-Topic: [PATCH v8] Preserve the EFI System Resource Table for dom0
Thread-Index:
 AQHYh/bQ1tgd5TeBbEyn28hq3tAw6K1xN30AgAADZgCAAAMXAIAAAKaAgAAATICAAAC6gA==
Date: Wed, 6 Jul 2022 11:01:50 +0000
Message-ID: <AC012C32-F33D-42C6-9F68-BB7436595D65@arm.com>
References:
 <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
 <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
 <ef9cde4f-be13-134b-3c26-194484d165de@suse.com> <YsVqwbZ9dOz8WG5E@itl-email>
 <c9d0af4c-b89a-fd50-64eb-9b8161295e1b@suse.com>
In-Reply-To: <c9d0af4c-b89a-fd50-64eb-9b8161295e1b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 31f9f0dd-a32c-4a55-3f53-08da5f3ef281
x-ms-traffictypediagnostic:
	DU0PR08MB7993:EE_|VE1EUR03FT003:EE_|PR3PR08MB5851:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X3wP3fmgpP2qBWv12jdvhqe2DRCj1Xj+yapR4fWTmxnfZ3HjoZThq4AePSGmMn/E/a8/TK3uSdpPvCB0RXsemhmPO3lqxtyz1WU+0Y/vjfEYjt2y2M1872Vgop+5V+i4gH4SyR1+Lfnj7OS2EZ8PJ4Hjld5ozhjaEzo02EKLMvDBZ1EeqHrFAmJwrviy3kLahh8BxId0yw2Mtt88V4c/CGCTxjqIDcdTOcwTOdJL438GmGHVi0PUyJ/tSG6TYIUPOlXG7bhYNLFkQeEq9dgYffvud5wa5yGXGpEF1q8RduAGauZu4RzTEtod92SY6PXg/cgAn+SeEyCYbx7I4llMo7gY63u8LEP1J5Alzn96R4IE3Sn+z1lzDEIPXTx1IaHKESsdDnLkurYhBSUEBOdD0RihvSdRI9PijjXZiXS4IVpDU3NY8nz/psRlrN/57NUD+I1ktTZ+bLGYLfDh9Cg8Ty9BwvUwFVhqJ54Z6/1/Z0AxPQqBEWr7kcqV9WkmcNCHOlbqquMqqMIznGJJ/dA0uTGUiOhuqnuSxJJtYf9fA9iutnr3AEx1p6XAG5jSsPGb3D4o3CiNQzCs6Kpyma0lXoPTGnasftxN7KiLS8cKixkWVvJQgqNVfIeo2ozl4j6t/j3NEpHP2YrB+3ETrMQ7F45F0xPorMc42eJjrYJxIhippYcKuKwPwVz+96XByrvUKh2Dc5VQ487kaKvlIqt0RYQlGR3M0VKHLdiVtbBhOm77D0iLKzFJuDxwaRGWLXm4wIbwhrU5it26IT/Hxexgt585R2mV9HAM4U5kzFr5OZ0SJIkLGagmj0roHJ0kacqa6k8Bp+xOJ1vQZRUOG2fbxlVrUGWkeqgtEKtC3coTGwM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(66556008)(91956017)(66946007)(64756008)(66446008)(66476007)(76116006)(8676002)(2906002)(33656002)(4326008)(6916009)(86362001)(5660300002)(8936002)(316002)(36756003)(53546011)(26005)(83380400001)(38100700002)(41300700001)(71200400001)(478600001)(6486002)(6512007)(6506007)(54906003)(186003)(38070700005)(2616005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BD8179C14824149B0D6908C47E870F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7993
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02cf9a29-840e-41f6-173d-08da5f3eed67
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qMRwZShj/+nYoEBZ/VrKcMW3usJ/oLCCa/PHk074f9BjtJgSv/ZmpzuuFgqOaxpGDANPG405iiagQKwAIDyrgDnGE1lULFXBJaoHW7I3UWAgYl8lQyCZtDn4GoP3BnN5DwYDWE1wFzWXqb0EyiRBIFHyPouylXes0ihMMb3K0m/c163gk34itGkpjaIjtQzjLwMDVSJKMg8vFwHZ81xmGnElwvoFUsa3HOhUtvMUTrbza7aF07MKB4CFvawY/wcQJFGIBHKO68HqBccRZQI3KQtHzcdN/n2YlIhwYz4MaywJi2GyW6rjDLr40KeTDlHVcyAlsowtraJsNf+mEF0BrVVd6rXZnjO+UF/Vp2Ay5/Y6sI7bH87uEQtDD8zkhwDwMdQqRKYWw+RiUsFIXx1MEoTE+EzKGMNABPLU209KDoZF1QT3TJtK73bD7VSYtGBNHDYmYN4OkRIhYNwQZmyg8KXVNeg2bnZq7L02csqlHS4rvEBBXOxeGyvimsq2OhJtSn544XCPXVHdPOR6GUtIha4q+7zmAz+odLn7U/6q9fFamshTt0ecKf+eLoxXA1WzQKbX5MJQoXiGqM+prtQplLkXpgkVOEe2NOBScLxQ3meZBxgLKAppPA8btpnqZyVke+S/46SL6dC7iEOQJfavMXNDF2JWWElK72roSvbm9qdeL0hkaQHY2+O64kJ0EB6Iv/A1MFSXm4MPuydnSq7wcLHP4e3BqnnZerTNGJZZ1DNTFH5rs50gBMjpQbw0Bq88ORMih1YUkfCgKsQl+48CDhAU08vCkKc4Dxpb8QrYAMJB+LgCstd2t5upCeutaST7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(40470700004)(36840700001)(46966006)(107886003)(82310400005)(336012)(47076005)(83380400001)(186003)(70586007)(81166007)(40480700001)(82740400003)(40460700003)(41300700001)(36860700001)(53546011)(316002)(54906003)(6862004)(6486002)(6512007)(2906002)(478600001)(2616005)(8676002)(86362001)(4326008)(8936002)(356005)(5660300002)(70206006)(6506007)(26005)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:01:58.5951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f9f0dd-a32c-4a55-3f53-08da5f3ef281
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5851

DQoNCj4gT24gNiBKdWwgMjAyMiwgYXQgMTE6NTksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNi4wNy4yMDIyIDEyOjU4LCBEZW1pIE1hcmllIE9iZW5v
dXIgd3JvdGU6DQo+PiBPbiBXZWQsIEp1bCAwNiwgMjAyMiBhdCAxMjo1NTo1MFBNICswMjAwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwNi4wNy4yMDIyIDEyOjQ0LCBBbmRyZXcgQ29vcGVy
IHdyb3RlOg0KPj4+PiBPbiAwNi8wNy8yMDIyIDExOjMyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0K
Pj4+Pj4+IE9uIDI0IEp1biAyMDIyLCBhdCAxOToxNywgRGVtaSBNYXJpZSBPYmVub3VyIDxkZW1p
QGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL2VmaS9ib290LmMgYi94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4+Pj4+
PiBpbmRleCBhMjVlMWQyOWYxLi5mNmYzNGFhODE2IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9j
b21tb24vZWZpL2Jvb3QuYw0KPj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYw0KPj4+
Pj4+IEBAIC01NjcsNiArNTg3LDQxIEBAIHN0YXRpYyBpbnQgX19pbml0IGVmaV9jaGVja19kdF9i
b290KGNvbnN0IEVGSV9MT0FERURfSU1BR0UgKmxvYWRlZF9pbWFnZSkNCj4+Pj4+PiB9DQo+Pj4+
Pj4gI2VuZGlmDQo+Pj4+Pj4gDQo+Pj4+Pj4gK3N0YXRpYyBVSU5UTiBfX2luaXRkYXRhIGVzcnQg
PSBFRklfSU5WQUxJRF9UQUJMRV9BRERSOw0KPj4+Pj4+ICsNCj4+Pj4+PiArc3RhdGljIHNpemVf
dCBfX2luaXQgZ2V0X2VzcnRfc2l6ZShjb25zdCBFRklfTUVNT1JZX0RFU0NSSVBUT1IgKmRlc2Mp
DQo+Pj4+Pj4gK3sNCj4+Pj4+PiArIHNpemVfdCBhdmFpbGFibGVfbGVuLCBsZW47DQo+Pj4+Pj4g
KyBjb25zdCBVSU5UTiBwaHlzaWNhbF9zdGFydCA9IGRlc2MtPlBoeXNpY2FsU3RhcnQ7DQo+Pj4+
PiBIaSwNCj4+Pj4+IA0KPj4+Pj4gRnJvbSBteSB0ZXN0cyBvbiBhbiBhcm02NCBtYWNoaW5lIHNv
IGZhciBJIGNhbiB0ZWxsIHRoYXQgZGVzYyBpcyBOVUxMIGhlcmUsDQo+Pj4+PiBmb3IgdGhpcyBy
ZWFzb24gd2UgaGF2ZSB0aGUgcHJvYmxlbS4NCj4+Pj4+IA0KPj4+Pj4gSeKAmWxsIGhhdmUgYSBm
dXJ0aGVyIGxvb2sgb24gdGhlIGNhdXNlIG9mIHRoaXMsIGJ1dCBpZiB5b3UgYXJlIGZhc3RlciB0
aGFuIG1lIHlvdSBhcmUNCj4+Pj4+IHdlbGNvbWUgdG8gZ2l2ZSB5b3VyIG9waW5pb24gb24gdGhh
dC4NCj4+Pj4gDQo+Pj4+IEdpdmVuIHRoaXMgb2JzZXJ2YXRpb24sIHRoZXJlJ3MgY2xlYXJseSAu
Li4NCj4+Pj4gDQo+Pj4+PiBAQCAtMTA1MSw2ICsxMTEwLDcwIEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBlZmlfc2V0X2dvcF9tb2RlKEVGSV9HUkFQSElDU19PVVRQVVRfUFJPVE9DT0wgKmdvcCwgVUlO
VE4gZ29wDQo+Pj4+PiAjZGVmaW5lIElOVkFMSURfVklSVFVBTF9BRERSRVNTICgweEJBQUFEVUwg
PDwgXA0KPj4+Pj4gKEVGSV9QQUdFX1NISUZUICsgQklUU19QRVJfTE9ORyAtIDMyKSkNCj4+Pj4+
IA0KPj4+Pj4gK3N0YXRpYyB2b2lkIF9faW5pdCBlZmlfcmVsb2NhdGVfZXNydChFRklfU1lTVEVN
X1RBQkxFICpTeXN0ZW1UYWJsZSkNCj4+Pj4+ICt7DQo+Pj4+PiArIEVGSV9TVEFUVVMgc3RhdHVz
Ow0KPj4+Pj4gKyBVSU5UTiBpbmZvX3NpemUgPSAwLCBtYXBfa2V5LCBtZGVzY19zaXplOw0KPj4+
Pj4gKyB2b2lkICptZW1vcnlfbWFwID0gTlVMTDsNCj4+Pj4+ICsgVUlOVDMyIHZlcjsNCj4+Pj4+
ICsgdW5zaWduZWQgaW50IGk7DQo+Pj4+PiArDQo+Pj4+PiArIGZvciAoIDsgOyApIHsNCj4+Pj4+
ICsgc3RhdHVzID0gZWZpX2JzLT5HZXRNZW1vcnlNYXAoJmluZm9fc2l6ZSwgbWVtb3J5X21hcCwg
Jm1hcF9rZXksDQo+Pj4+PiArICZtZGVzY19zaXplLCAmdmVyKTsNCj4+Pj4+ICsgaWYgKCBzdGF0
dXMgPT0gRUZJX1NVQ0NFU1MgJiYgbWVtb3J5X21hcCAhPSBOVUxMICkNCj4+Pj4+ICsgYnJlYWs7
DQo+Pj4+PiArIGlmICggc3RhdHVzID09IEVGSV9CVUZGRVJfVE9PX1NNQUxMIHx8IG1lbW9yeV9t
YXAgPT0gTlVMTCApDQo+Pj4+PiArIHsNCj4+Pj4+ICsgaW5mb19zaXplICs9IDggKiBlZmlfbWRl
c2Nfc2l6ZTsNCj4+Pj4+ICsgaWYgKCBtZW1vcnlfbWFwICE9IE5VTEwgKQ0KPj4+Pj4gKyBlZmlf
YnMtPkZyZWVQb29sKG1lbW9yeV9tYXApOw0KPj4+Pj4gKyBtZW1vcnlfbWFwID0gTlVMTDsNCj4+
Pj4+ICsgc3RhdHVzID0gZWZpX2JzLT5BbGxvY2F0ZVBvb2woRWZpTG9hZGVyRGF0YSwgaW5mb19z
aXplLCAmbWVtb3J5X21hcCk7DQo+Pj4+PiArIGlmICggc3RhdHVzID09IEVGSV9TVUNDRVNTICkN
Cj4+Pj4+ICsgY29udGludWU7DQo+Pj4+PiArIFByaW50RXJyKEwiQ2Fubm90IGFsbG9jYXRlIG1l
bW9yeSB0byByZWxvY2F0ZSBFU1JUXHJcbiIpOw0KPj4+Pj4gKyB9DQo+Pj4+PiArIGVsc2UNCj4+
Pj4+ICsgUHJpbnRFcnIoTCJDYW5ub3Qgb2J0YWluIG1lbW9yeSBtYXAgdG8gcmVsb2NhdGUgRVNS
VFxyXG4iKTsNCj4+Pj4+ICsgcmV0dXJuOw0KPj4+Pj4gKyB9DQo+Pj4+PiArDQo+Pj4+PiArIC8q
IFRyeSB0byBvYnRhaW4gdGhlIEVTUlQuIEVycm9ycyBhcmUgbm90IGZhdGFsLiAqLw0KPj4+Pj4g
KyBmb3IgKCBpID0gMDsgaSA8IGluZm9fc2l6ZTsgaSArPSBlZmlfbWRlc2Nfc2l6ZSApDQo+Pj4+
PiArIHsNCj4+Pj4+ICsgLyoNCj4+Pj4+ICsgKiBFU1JUIG5lZWRzIHRvIGJlIG1vdmVkIHRvIG1l
bW9yeSBvZiB0eXBlIEVmaVJ1bnRpbWVTZXJ2aWNlc0RhdGENCj4+Pj4+ICsgKiBzbyB0aGF0IHRo
ZSBtZW1vcnkgaXQgaXMgaW4gd2lsbCBub3QgYmUgdXNlZCBmb3Igb3RoZXIgcHVycG9zZXMuDQo+
Pj4+PiArICovDQo+Pj4+PiArIHZvaWQgKm5ld19lc3J0ID0gTlVMTDsNCj4+Pj4+ICsgc2l6ZV90
IGVzcnRfc2l6ZSA9IGdldF9lc3J0X3NpemUoZWZpX21lbW1hcCArIGkpOw0KPj4+PiANCj4+Pj4g
Li4uIGEgTlVMTCBwb2ludGVyIGhlcmUuICBBbmQgdGhlIG9ubHkgd2F5IHRoYXQgY291bGQgaGFw
cGVuIGlzIGlmDQo+Pj4+IGVmaV9tZW1tYXAgaXMgTlVMTC4NCj4+PiANCj4+PiBJbmNvbXBsZXRl
IHJlZmFjdG9yaW5nIC0gdGhpcyBuZWVkcyB0byBiZSBtZW1vcnlfbWFwLCBub3QgZWZpX21lbW1h
cC4NCj4+PiBPZiBjb3Vyc2UgZWZpX21kZXNjX3NpemUgYWxzbyBuZWVkcyB0byBiZSBtZGVzY19z
aXplLiBEaWRuJ3QgY2hlY2sNCj4+PiBmb3IgZnVydGhlciBsZWZ0b3ZlciBmcm9tIHRoZSBlYXJs
aWVyIHBhdGNoIHZlcnNpb24uIEknbSBnb2luZyB0bw0KPj4+IHJldmVydCB0aGUgY29tbWl0Lg0K
Pj4gDQo+PiBTb3JyeSBhYm91dCB0aGF0LiBXYW50IG1lIHRvIHN1Ym1pdCBhIHY5Pw0KPiANCj4g
WWVzIHBsZWFzZS4gQW5kIHBsZWFzZSBtYWtlIHN1cmUgeW91IGhhdmUgdGVzdGVkIHRoaXMgYXQg
bGVhc3Qgb24geDg2Lg0KDQpJIHdpbGwgdGVzdCBpdCBvbiBhcm02NCwgc28gcGxlYXNlIHBpbmcg
bWUgaWYgSSBtaXNzIGl0LCBJIGdvdCBzdWJtZXJnZWQgYnkgTUwgbWFpbHMNCmFmdGVyIG15IGhv
bGlkYXlzIGFuZCBJIGRpZG7igJl0IHRlc3QgKG9uIGFybSkgdGhpcyBvbmUgbGlrZSB0aGUgcHJl
dmlvdXMgdmVyc2lvbiB0aGF0DQp5b3Ugc2VudCBiZWZvcmUNCg0KQ2hlZXJzLA0KTHVjYQ0KDQo+
IA0KPiBKYW4NCg0K

