Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C565A5A0C95
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393195.631990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR99r-0005IH-Og; Thu, 25 Aug 2022 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393195.631990; Thu, 25 Aug 2022 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR99r-0005GC-Ln; Thu, 25 Aug 2022 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 393195;
 Thu, 25 Aug 2022 09:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9hs=Y5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oR99q-0005G2-5P
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:28:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dd23d0f-2458-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 11:28:13 +0200 (CEST)
Received: from AS9PR06CA0567.eurprd06.prod.outlook.com (2603:10a6:20b:485::35)
 by VI1PR08MB4176.eurprd08.prod.outlook.com (2603:10a6:803:ec::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 09:28:07 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::8b) by AS9PR06CA0567.outlook.office365.com
 (2603:10a6:20b:485::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Thu, 25 Aug 2022 09:28:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 09:28:07 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 25 Aug 2022 09:28:06 +0000
Received: from 9ad9db476ed8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83EA18E2-E3CB-4FBE-88FC-7335259BF02B.1; 
 Thu, 25 Aug 2022 09:27:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ad9db476ed8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Aug 2022 09:27:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Thu, 25 Aug
 2022 09:27:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 09:27:56 +0000
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
X-Inumbo-ID: 3dd23d0f-2458-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OdfM/OZoPGl/JDW9YYdWSvMW3uOHJ0Pl2XDZ3dVxgeXeXuPouy3rQCdI65XStWF/8duoQdJ7wBtngKqzrCWyjFxMd9Jnu7xSg9UrxC5gduVCRUAVx+hI4h5SwhCTHvS4h0tGXxR8Kp18AdtGEd5+Bz/+eZZ/cUzK2yunO0/KyVkjqs34GeN0MuUdU5jvDEFlqeHE7mN3OzjUT1CsO6VopQQ4sa+vwHuQX/lABdyIDwKfrrGY0BKwpktLPK0anQZC+ecY5gTpooTsw5pGp/Q8HsiRPp75hW6K0ZqYtFFNR1K2zL7/Sfo+S8LjpicLf2s+hK33VSDhO9ETtZiyYvmZ8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps/y4odxhD3VMf6tdbhYqnEv3+K9+UvqJJejb3aM18M=;
 b=IkajBnt/mIj6oTOQvZnD4aMIpq8p+o/FtequSl41tPN6yej+0dkPKlBkJXGfyFc/lNre3jv2hUlU3hOnAxIwb4nmKjl09JO1GxJBKwlwAh6wr5+1ypYkQ/30uamo0Mnb7wPeQ4ySh+TnafPA+oCSUQNqojJHNqLdibo3kzIUctd3DWWrI8iOAxFO/2/uZGYMuvIiMh8uFH1orSdxGiO1C6rq7ZY5zT441jptkXx99PT9XIupEyLu44JfSVC44I/et+w88+y3nxrujVXMJRrwAJvPzgcgHi/P7vSZrr6D1C8CBH50DmtDgIs0rB1VxOOILQWecgoMNU/dbH9OpfpSCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps/y4odxhD3VMf6tdbhYqnEv3+K9+UvqJJejb3aM18M=;
 b=kh8QCwjXyCxjt3E3ta917eg2La90J6lyNHkfhMr937NRPdCFd4HpVY5Amty5jnVBzw6lQu0TTnicblG7DAtyoI56BFgEdea/3mFOuLXSfcW9U5VkDiYI9Y6x+dFv0GCtbiEfAbH6uQVjn8zcmb3Ge5u7e7AiFroy1K/t0hjchLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb1c888219e141f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTEGGkhCis4cwRjD7aS5vtUqsFWHFekdH35Mjbgw1f/qdUEZgK5UvSLJVcyDzDRGpDHr3rkI/X/ZyThJbw3VijnhXVvFOC8UdWXWFXO+XKVJONDCrdn0UbJNxKHC0glucI8H6vcPCSuIFSXpSJKOrnqP9Ki1ORZOWC+tGeJOz7gQeBC1UslPYG/aWl3Drd2LNxVk41mlxV/rVmFTOT+/9mmVmBYd0A4uvbr6KvvGGyG67fLfjFxLjw3b76MistbSHkP/8OaH5fa96X9Tx7vZr3hlM1tjM75XT5PEJgyXFSAnpbUiHDVb9qD0SvzjUM4iTDeDpzxCvgMVLJAudcHIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps/y4odxhD3VMf6tdbhYqnEv3+K9+UvqJJejb3aM18M=;
 b=HWk19TXqueb0RHmYXQsN3DcdakgN+omBmp0tD7/BPsA8I2NT60Ncap1x/PFVeJf/oGuJWZfOZwHFB8yHJ/LYOPVYks7YUzWy5TL8j8bRu5Oyd9Zsyr27nG8k1T0FaG2w6HFt7VvesJTmoxDpic7LPw5n13Dsf/Dz6oAl7P1kBsnfdTyMBeBEkoSh1xZ+SEGcnqkZHE91VWEeY0NjZOZyj32egfAuBlbNB5r88ExY6+/ymobUFwHeCKWcqyFMV0dMdIuoldihl8OuaeMPYycIEHRD7c0lqm64rDbNC6xulcFEVITaZYQRTzBLXRjwxGoATlJS6YUMdNiX42rT814Lfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps/y4odxhD3VMf6tdbhYqnEv3+K9+UvqJJejb3aM18M=;
 b=kh8QCwjXyCxjt3E3ta917eg2La90J6lyNHkfhMr937NRPdCFd4HpVY5Amty5jnVBzw6lQu0TTnicblG7DAtyoI56BFgEdea/3mFOuLXSfcW9U5VkDiYI9Y6x+dFv0GCtbiEfAbH6uQVjn8zcmb3Ge5u7e7AiFroy1K/t0hjchLA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Vipul Suneja <vsuneja63@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: Porting xen on rpi4
Thread-Topic: Porting xen on rpi4
Thread-Index:
 AQHYt8SgkyOonJ7Wl0ezDHN7orB+v62+Hg2AgAAnmwCAAEWWAIAAroCAgAAG0YCAABDyAIAACN+A
Date: Thu, 25 Aug 2022 09:27:56 +0000
Message-ID: <E9EE3632-4591-4A2F-BF28-E69A961F1E5E@arm.com>
References:
 <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
 <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com>
 <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
 <CALAP8f-3jcGen82DaVrxRTF3TMDVMkLJA5Nsxu=HDYFDqTOOdQ@mail.gmail.com>
 <62627CF0-8594-4DEB-9F6C-37AECDE6B77B@arm.com>
 <CALAP8f_JqwRcPM9_xLT6U6xeHLDVNO5itA0ELC_pZ-xyUyKqtQ@mail.gmail.com>
In-Reply-To:
 <CALAP8f_JqwRcPM9_xLT6U6xeHLDVNO5itA0ELC_pZ-xyUyKqtQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a232e8b5-7ed6-4068-6c0c-08da867c1e83
x-ms-traffictypediagnostic:
	AM6PR08MB4024:EE_|VE1EUR03FT021:EE_|VI1PR08MB4176:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IRiaxIzOtrOjBWvNp8rSk+mtEZdN0Hs7gu5UBxHFOMOw0I/FNca9cm5TyJ/3ND+2+DXH5OMdvRtbFg2p9lQircRNT626cZ1JbjGbB49MbJIvWPvpw+p1NtTVgpUnzQLuB0Zf6U1eCRvW2OJ8jJ8dyU6YDIV5y9aYbN3ARPAJ0J2X0dObAqsik3C3cft5LfSUVixD/6HqSeWPgjkmJqFyA+tn9Zni5XPyRgwTLuoUvCHnV5DSLQUaan27yQfEzj+b7xHXXAMRPuoIGkOMJN7NQ9IZ68T3yCIWBY+7igoXKGoalYk/KNQ+IaQ3p5OUaZjVrRGZ2VUQ6NVDEOKwpZM5rNs+R+dlvMW/BhgZDKOjRrt5WINvjrpqLkAmFM3iHQJynnEN2mkQXoIpckAor5sa/55OtJG/vQLT81G95fS86xsAemxriMqidQ4FLIBiY2NjFh9+M4HntppuZKBjRNwlt2XT8jpQK1g3AWsrN7r8CMBqSOLhyoa0S7hkTlA+vJP1tHx8LuymbuPKBKU9K4ncNaa4Qa0529y/b9u08+H9VYARIdYQkjUWBcsOfr5YNPxTAA6wnQC3gZehpQq4p34uYNQS5XRDuX3jB4M5YtQgl47wGT4HDMFIgyR915VPTJ41HZ6Kpi5cniznsrWnd+WQOQQe4g0JNMzVAIec2fyOL7pZrT0t1IvLUYoIOZB/6Ng+Lagv6L9bAiN+Snjub5/9kV+wH5r8SN+gmN66NZk3jEF4TEpfKLb0AAo3OQQwOYc3xyLG470jaYjikAfUsr35Lwpf1gDZfmq9dcp+sHxSSB4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(478600001)(6486002)(316002)(6916009)(6506007)(71200400001)(5660300002)(8936002)(2616005)(6512007)(54906003)(2906002)(186003)(53546011)(26005)(86362001)(41300700001)(83380400001)(8676002)(76116006)(66446008)(38070700005)(33656002)(4326008)(122000001)(64756008)(66556008)(66476007)(38100700002)(66946007)(36756003)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48C9023EB255B740A7F1D6355EBF59F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8df3493-01f8-4c1c-6a39-08da867c1809
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9vp1NCWOjY7bRLRU+VNiTVEqBYuSjfTFDYYRjcrrGDIm5rqEE6rOOlTd9zWe6OdWP5JxqyIIOrKhwHmBGyqvMNeGQSl8lnXASiP0uXyCMdZqd2GKMzzxXblrJNO5ZzOpMkvxpiCKnUAQ5lY3od4qLNaMhrBuYfS4/89qrhnBe9nSJhlrMyn91eob77mO3rnqfxCh3eEXSeacYBjF6shQ3bCmjVqvnJZljwNBuLYQrvCvzJbFLCxPTcoG/UiPjjGXhVZhnJUrLzaAwnEn8ZNcQS65WdCN2IQm3JfYUhSecgXjhTLULbEZilIm9T7fXtCgUR7VM5A3xFTWinnErgrPAPHs17j1FSz/dyrYLeWnKZmedKyJIFvA/4Eivox4Vgc09LCKHPR0MuBciaZ03tlnIdSbKGPUnuj6T9sVJV2WaRmkHeRhAxgV5xapdi6AB3wUfG5vwgRpfPbXGEVRp6bsQZoXhR9DSBWkhl8QYpaBrrp/NIWBflvE1J+oAWOL0P77GJRavSwoBqPaIPKqQp1V/XKsV9+O3qkJ516gWZCkzFl1ok3vX3ZLsExpIaQm8r3+rFIg73W97wrpv6YF3s7T5e0W5yU6ZgQvEv6yQaN1W5Vh/icT4lgwl1/sXe0KyTNUTtdXLTEVECDSUYzZrVrNbN9dVDYx9LiW6VRR4L73qdjIeCs5cFMxya5D1LyLw+C6HY//VC6fNt10cjDcVzM4W0rxMGkhsUsCLRVBC5NgS7RlsbnbvsitSJ4MU3nUmlkrxUSTErWskHsqPS+RgWOJsw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(40470700004)(46966006)(36840700001)(81166007)(5660300002)(6512007)(83380400001)(47076005)(82310400005)(6506007)(86362001)(33656002)(53546011)(36756003)(6486002)(356005)(478600001)(26005)(6862004)(82740400003)(8936002)(40480700001)(2616005)(316002)(54906003)(336012)(2906002)(186003)(8676002)(4326008)(70586007)(41300700001)(40460700003)(36860700001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 09:28:07.0780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a232e8b5-7ed6-4068-6c0c-08da867c1e83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4176

SGkgVmlwdWwsDQoNCj4gT24gMjUgQXVnIDIwMjIsIGF0IDA5OjU2LCBWaXB1bCBTdW5lamEgPHZz
dW5lamE2M0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0KPiBUaGFu
a3MhDQo+IA0KPiBObywgSSBjb3VsZG4ndCBzZWUgL2Rldi9sb29wMC4gQ2FuIHlvdSBwbGVhc2Ug
Z3VpZGUgbWUgdG8gY3JlYXRlIGl0Pw0KDQpGaXJzdCB0aGluZyB0byB0cnkgaXMg4oCcbW9kcHJv
YmUgbG9vcCINCg0KSXQgdGhhdCBkb2VzIG5vdCB3b3JrIChpZSBtb2R1bGUgbm90IGZvdW5kKSB5
b3Ugc2hvdWxkIGNoZWNrIGluIHlvdXIgbGludXggY29uZmlnIGlmIEJMS19ERVZfTE9PUCBpcyBl
bmFibGVkLg0KDQo+IA0KPiBJIGRpZG4ndCBjaGFuZ2UgZG9tMCBjb25maWd1cmF0aW9ucywgaXQn
cyBkZWZhdWx0IGdlbmVyYXRlZCBieSB5b2N0by4NCj4gIA0KPiBJIHdpbGwgYXBwZW5kIHRoaXMg
IklNQUdFX0ZTVFlQRVM6YXBwZW5kID0gIiB3aWMuZ3rigJ0iIGluIGxvY2FsLmNvbmYgJiB3aWxs
IHVwZGF0ZSB5b3UuDQo+IA0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gUmVnYXJkcywNCj4gVmlw
dWwgS3VtYXINCj4gDQo+IE9uIFRodSwgQXVnIDI1LCAyMDIyIGF0IDE6MjUgUE0gQmVydHJhbmQg
TWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4gSGkgVmlwdWwsDQo+
IA0KPiA+IE9uIDI1IEF1ZyAyMDIyLCBhdCAwODozMSwgVmlwdWwgU3VuZWphIDx2c3VuZWphNjNA
Z21haWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiBIaSBTdGVmYW5vLA0KPiA+IA0KPiA+IFRoYW5r
cyENCj4gPiANCj4gPiBBcyBzdWdnZXN0ZWQsIEkgY2hhbmdlZCB0aGUgZ3Vlc3QxLmNmZyBmaWxl
LiBCZWxvdyBhcmUgdGhlIGNvbnRlbnRzIG9mIGNvbmZpZyBmaWxlDQo+ID4gDQo+ID4ga2VybmVs
ID0gIi9ob21lL3Jvb3QvSW1hZ2UiDQo+ID4gY21kbGluZSA9ICJjb25zb2xlPWh2YzAgZWFybHlw
cmludGs9eGVuIHN5bmNfY29uc29sZSByb290PS9kZXYveHZkYSINCj4gPiBtZW1vcnkgPSAiMTAy
NCINCj4gPiBuYW1lID0gImd1ZXN0MSINCj4gPiB2Y3B1cyA9IDENCj4gPiBzZXJpYWw9InB0eSIN
Cj4gPiBkaXNrID0gWyAnZmlsZTovaG9tZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJh
c3BiZXJyeXBpNC02NC5leHQzLHh2ZGEsdycgXQ0KPiA+IHZpZj1bICdtYWM9MDA6MTE6MjI6NjY6
ODg6MjIsYnJpZGdlPXhlbmJyMCx0eXBlPW5ldGZyb250JywgXQ0KPiA+IA0KPiA+IEl0cyBmYWls
aW5nIHdpdGggYmVsb3cgbG9nczoNCj4gPiANCj4gPiByb290QHJhc3BiZXJyeXBpNC02NDp+IyB4
bCBjcmVhdGUgLWMgZ3Vlc3QxLmNmZyANCj4gPiBQYXJzaW5nIGNvbmZpZyBmcm9tIGd1ZXN0MS5j
ZmcNCj4gPiBJbnZhbGlkIHBhcmFtZXRlciBgdHlwZScuDQo+ID4gbGlieGw6IGVycm9yOiBsaWJ4
bF9leGVjLmM6MTE3OmxpYnhsX3JlcG9ydF9jaGlsZF9leGl0c3RhdHVzOiAvZXRjL3hlbi9zY3Jp
cHRzL2Jsb2NrIGFkZCBbNzQyXSBleGl0ZWQgd2l0aCBlcnJvciBzdGF0dXMgMQ0KPiA+IGxpYnhs
OiBlcnJvcjogbGlieGxfZGV2aWNlLmM6MTI2NTpkZXZpY2VfaG90cGx1Z19jaGlsZF9kZWF0aF9j
Yjogc2NyaXB0OiBsb3NldHVwIC9kZXYvbG9vcDAgL2hvbWUvcm9vdC94ZW4tZ3Vlc3QtaW1hZ2Ut
bWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyBmYWlsZWQNCj4gPiBsaWJ4bDogZXJyb3I6IGxp
YnhsX2NyZWF0ZS5jOjE2NDM6ZG9tY3JlYXRlX2xhdW5jaF9kbTogRG9tYWluIDE6dW5hYmxlIHRv
IGFkZCBkaXNrIGRldmljZXMNCj4gPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2V4ZWMuYzoxMTc6bGli
eGxfcmVwb3J0X2NoaWxkX2V4aXRzdGF0dXM6IC9ldGMveGVuL3NjcmlwdHMvYmxvY2sgcmVtb3Zl
IFs3OTNdIGV4aXRlZCB3aXRoIGVycm9yIHN0YXR1cyAxDQo+ID4gbGlieGw6IGVycm9yOiBsaWJ4
bF9kZXZpY2UuYzoxMjY1OmRldmljZV9ob3RwbHVnX2NoaWxkX2RlYXRoX2NiOiBzY3JpcHQ6IC9l
dGMveGVuL3NjcmlwdHMvYmxvY2sgZmFpbGVkOyBlcnJvciBkZXRlY3RlZC4NCj4gPiBsaWJ4bDog
ZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjExODM6bGlieGxfX2Rlc3Ryb3lfZG9taWQ6IERvbWFpbiAx
Ok5vbi1leGlzdGFudCBkb21haW4NCj4gPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEx
Mzc6ZG9tYWluX2Rlc3Ryb3lfY2FsbGJhY2s6IERvbWFpbiAxOlVuYWJsZSB0byBkZXN0cm95IGd1
ZXN0DQo+ID4gbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMDY0OmRvbWFpbl9kZXN0cm95
X2NiOiBEb21haW4gMTpEZXN0cnVjdGlvbiBvZiBkb21haW4gZmFpbGVkDQo+IA0KPiBJIHRoaW5r
IHlvdSBoYXZlIGEgbG9vcCBpc3N1ZS4NCj4gDQo+IENvdWxkIHlvdSBjaGVjayBpZiAvZGV2L2xv
b3AwIGV4aXN0cyA/DQo+IA0KPiBEaWQgeW91IGNoYW5nZSBzb21ldGhpbmcgb24gdGhlIGRvbTAg
bGludXggY29uZmlndXJhdGlvbiBnZW5lcmF0ZWQgYnkgWW9jdG8gPw0KPiANCj4gV2UgYXJlIHVz
aW5nIFlvY3RvIG9uIFJQSTQgaGVyZSB3aXRob3V0IGFueSBpc3N1ZSBsaWtlIHRoYXQsIG9ubHkg
ZGlmZmVyZW5jZSB3aXRoDQo+IHlvdXIgc2V0dXAgaXMgdGhhdCB3ZSBnZW5lcmF0ZSBhIHdpYyBp
bWFnZSB0byBoYXZlIGEgcmVhbCBkaXNrIGltYWdlIGluc3RlYWQgb2YNCj4gdXNpbmcgdGhlIGV4
dDMvZXh0NCBvbmUuDQo+IA0KPiBTaG91bGQgYmUgcG9zc2libGUgdG8gZG8gdGhlIHNhbWUgb24g
eW91ciBzaWRlIGJ5IGFkZGluZyB0aGUgZm9sbG93aW5nIGluIGxvY2FsLmNvbmY6DQo+IElNQUdF
X0ZTVFlQRVM6YXBwZW5kID0gIiB3aWMuZ3rigJ0NCj4gDQo+ID4gDQo+ID4gRXZlbiBhZnRlciBy
ZW1vdmluZyAndHlwZT1uZXRmcm9udCcgZnJvbSB2aWYgaXQncyBmYWlsaW5nLiANCj4gDQo+IFRo
aXMgb3B0aW9uIGlzIG9ubHkgZm9yIGh2bSBvbiB4ODYsIHNvIHlvdSBjYW4gcmVtb3ZlIGl0IGZy
b20geW91ciBjb25maWd1cmF0aW9uLg0KPiANCj4gPiBPbmUgbW9yZSBkb3VidCBoZXJlLCBjb3Vs
ZCB0aGlzIG1hYyBhZGRyZXNzIGJlIGEgZHVtbXkgb3IgYWN0dWFsIGhlcmU/DQo+IA0KPiBUaGlz
IGlzIGEgZHVtbXkgb25lIHlvdSBzZXQgZm9yIHRoZSBndWVzdCBuZXR3b3JrIGludGVyZmFjZSBh
bmQgdGhpcyBpcyB0aGUgTWFjDQo+ICBhZGRyZXNzIG90aGVyIGRldmljZXMgb24geW91ciBuZXR3
b3JrIHdpbGwgc2VlIHNvIGl0IG11c3QgYmUgZnVsbHkgdmFsaWQgKGFuZA0KPiAgbm90IGNvbmZs
aWN0aW5nIHdpdGggb3RoZXIgZGV2aWNlcyBvbiB5b3VyIG5ldHdvcmspLg0KPiANCj4gQ2hlZXJz
DQo+IEJlcnRyYW5kDQo+IA0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gVmlwdWwgS3VtYXINCj4g
PiANCj4gPiBPbiBUaHUsIEF1ZyAyNSwgMjAyMiBhdCAyOjM2IEFNIFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+ID4gT24gV2VkLCAyNCBBdWcgMjAy
MiwgVmlwdWwgU3VuZWphIHdyb3RlOg0KPiA+ID4gSGkgQmVydHJhbmQsDQo+ID4gPiBUaGFua3Mg
Zm9yIHlvdXIgcmVzcG9uc2UhDQo+ID4gPiANCj4gPiA+IEkgYnVpbGRlZCB0aGUgZ3Vlc3QgaW1h
Z2Ugb24geW9jdG8ga2lya3N0b25lIHNvdXJjZSB3aGljaCBoYXMgRlNUWVBFIGV4dDMuIEd1ZXN0
IGltYWdlIGdlbmVyYXRlZCBpcw0KPiA+ID4geGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJl
cnJ5cGk0LTY0LmV4dDMuDQo+ID4gPiBCZWxvdyBpcyB0aGUgY29udGVudCBvZiBndWVzdC5jZmcg
ZmlsZQ0KPiA+ID4gDQo+ID4gPiAgICBrZXJuZWwgPSAiL2hvbWUvcm9vdC9JbWFnZSIgDQo+ID4g
PiAgICBjbWRsaW5lID0gImNvbnNvbGU9aHZjMCBlYXJseXByaW50az14ZW4gc3luY19jb25zb2xl
IHJvb3Q9L2Rldi94dmRhIiANCj4gPiA+ICAgIG1lbW9yeSA9ICIyNTYiIA0KPiA+ID4gICAgbmFt
ZSA9ICJndWVzdDEiIA0KPiA+ID4gICAgdmNwdXMgPSAxIA0KPiA+ID4gICAgc2VyaWFsPSJwdHki
IA0KPiA+ID4gICAgZGlzayA9IFsgJ3BoeTovZGV2L2xvb3AwLHh2ZGEsdycgXSANCj4gPiA+ICAg
IHZpZj1bICdtYWM9MDA6MTE6MjI6NjY6ODg6MjIsYnJpZGdlPXhlbmJyMCx0eXBlPW5ldGZyb250
JywgXQ0KPiA+ID4gDQo+ID4gPiBJIGFtIHRyeWluZyB0byBtb3VudCB4ZW4tZ3Vlc3QtaW1hZ2Ut
bWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyB0byBhIHZpcnR1YWwgZGV2aWNlICYgdGhlbiB3
aWxsIHJ1biB0aGUgZ3Vlc3QgVk0gYnkgY29tbWFuZCAieGwgY3JlYXRlIC1jDQo+ID4gPiBndWVz
dC5jZmciLiBCdXQgZmFjaW5nIGlzc3VlIHdoaWxlIHRyeWluZyB0byBtb3VudC4gDQo+ID4gDQo+
ID4gWW91IGRvbid0IGFjdHVhbGx5IG5lZWQgdG8gbW91bnQNCj4gPiB4ZW4tZ3Vlc3QtaW1hZ2Ut
bWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MyBhbnl3aGVyZSB0byB1c2UgaXQgdG8gcnVuDQo+
ID4geW91ciBndWVzdCBWTSB3aXRoICJ4bCBjcmVhdGUiLiANCj4gPiANCj4gPiBJdCBpcyBlbm91
Z2ggdG8gZG8gdGhpcyBpbnN0ZWFkLCBhcyBCZXJ0cmFuZCBzdWdnZXN0ZWQ6DQo+ID4gDQo+ID4g
ZGlzaz1bImZpbGU6L3BhdGgvdG8vZmlsZS94ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVy
cnlwaTQtNjQuZXh0Myx4dmRhLHciXQ0KPiA+IA0KPiA+IE5vIG5lZWQgdG8gY2FsbCBsb3NldHVw
IG9yIG1vdW50LiBKdXN0IHhsIGNyZWF0ZSAtYy4NCj4gPiANCj4gPiBNb3JlIGFuc3dlcnMgYmVs
b3cuDQo+ID4gDQo+ID4gDQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gVmlwdWwgS3VtYXINCj4gPiA+
IA0KPiA+ID4gT24gV2VkLCBBdWcgMjQsIDIwMjIgYXQgODowNiBQTSBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiA+ID4gICAgICAgSGkgVmlwdWws
DQo+ID4gPiANCj4gPiA+ICAgICAgID4gT24gMjQgQXVnIDIwMjIsIGF0IDE1OjE2LCBWaXB1bCBT
dW5lamEgPHZzdW5lamE2M0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gICAgICAgPg0KPiA+ID4g
ICAgICAgPiBIaSwNCj4gPiA+ICAgICAgID4NCj4gPiA+ICAgICAgID4gSSBhbSBwb3J0aW5nIHhl
biBoeXBlcnZpc29yIG9uIHJwaTQgd2l0aCB5b2N0byBraXJrc3RvbmUgc291cmNlcy4gRm9sbG93
ZWQgdGhlIGJhc2ljIHN0ZXBzIHRvIGJ1aWxkIHhlbi1pbWFnZS1taW5pbWFsICYNCj4gPiA+ICAg
ICAgIHhlbi1ndWVzdC1pbWFnZS1taW5pbWFsLiBJIGNvdWxkIGZsYXNoIHNkIGNhcmQgd2l0aCB4
ZW4gbWluaW1hbCBpbWFnZSAmIGNvdWxkIHNlZSBkb20wIHVwLiBJIGNvcGllZCAiSW1hZ2UiLA0K
PiA+ID4gICAgICAgInhlbi1ndWVzdC1pbWFnZS1taW5pbWFsIiAuZXh0MyBmaWxlICYgZ3Vlc3Qu
Y2ZnIHRvICIvaG9tZS9yb290Ii4gQWZ0ZXIgdGhhdCBjcmVhdGVkIGEgYnJpZGdlIHdpdGggYmVs
b3cgc3RlcDoNCj4gPiA+ICAgICAgID4NCj4gPiA+ICAgICAgID4ga2lsbGFsbCAtU0lHVVNSMiB1
ZGhjcGMNCj4gPiA+ICAgICAgID4gYnJjdGwgYWRkYnIgeGVuYnIwDQo+ID4gPiAgICAgICA+IGJy
Y3RsIGFkZGlmIHhlbmJyMCBldGgwDQo+ID4gPiAgICAgICA+IGtpbGxhbGwgdWRoY3BjDQo+ID4g
PiAgICAgICA+IHVkaGNwYyAtUiAtYiAtcCAvdmFyL3J1bi91ZGhjcGMueGVuYnIwLnBpZCAtaSB4
ZW5icjANCj4gPiA+ICAgICAgID4NCj4gPiA+ICAgICAgID4gQ291bGQgc2VlIHRoZSB4ZW5icjAg
aW50ZXJmYWNlIHVwLg0KPiA+ID4gICAgICAgPiBBZnRlciB0aGF0IHdoaWxlIG1vdW50aW5nIHRo
ZSBndWVzdCBmaWxlIHN5c3RlbSBpdCBzaG93cyBubyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5IGJ1
dCB0aGUgZmlsZSBpcyBhbHJlYWR5IHRoZXJlLg0KPiA+ID4gICAgICAgPg0KPiA+ID4gICAgICAg
PiBbMjM6NDA6MTVdIDxHdWVzdDkwNDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIGxzIC1sDQo+
ID4gPiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gLXJ3LXItLXItLSAgICAxIHJvb3Qg
ICAgIHJvb3QgICAgICAyNDY1MjI4OCBNYXIgIDkgMTI6MzYgSW1hZ2UNCj4gPiA+ICAgICAgID4g
WzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiAtcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAg
ICAgICAgMjQ3IE1hciAgOSAxMjozNyBndWVzdDEuY2ZnDQo+ID4gPiAgICAgICA+IFsyMzo0MDox
NV0gPEd1ZXN0OTA0Nj4gLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgIDg2ODIyMDky
OCBNYXIgIDkgMTI6MzkgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4
dDMNCj4gPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBp
NC02NDp+IyBjaG1vZCAwNzc3IHhlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02
NC5leHQzDQo+ID4gPiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gcm9vdEByYXNwYmVy
cnlwaTQtNjQ6fiMgbHMgLWwNCj4gPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiAt
cnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgIDI0NjUyMjg4IE1hciAgOSAxMjozNiBJ
bWFnZQ0KPiA+ID4gICAgICAgPiBbMjM6NDA6MTVdIDxHdWVzdDkwNDY+IC1ydy1yLS1yLS0gICAg
MSByb290ICAgICByb290ICAgICAgICAgICAyNDcgTWFyICA5IDEyOjM3IGd1ZXN0MS5jZmcNCj4g
PiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiAtcnd4cnd4cnd4ICAgIDEgcm9vdCAg
ICAgcm9vdCAgICAgODY4MjIwOTI4IE1hciAgOSAxMjozOSB4ZW4tZ3Vlc3QtaW1hZ2UtbWluaW1h
bC1yYXNwYmVycnlwaTQtNjQuZXh0Mw0KPiA+ID4gICAgICAgPiBbMjM6NDA6MTVdIDxHdWVzdDkw
NDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIGxvc2V0dXAgL2Rldi9sb29wMCB4ZW4tZ3Vlc3Qt
aW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0Mw0KPiA+ID4gICAgICAgPiBbMjM6NDA6
MTVdIDxHdWVzdDkwNDY+IGxvc2V0dXA6IHhlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJy
eXBpNC02NC5leHQzOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gPiAgICAgICA+IFsy
Mzo0MDoxNV0gPEd1ZXN0OTA0Nj4gcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMgbG9zZXR1cCAvZGV2
L2xvb3AwIC9ob21lL3Jvb3QveGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0
LmV4dDMNCj4gPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiBsb3NldHVwOiAvaG9t
ZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQzOiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gPiAgICAgICA+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0
Nj4gcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMNCj4gPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vl
c3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02NDp+Iw0KPiA+ID4gICAgICAgPiBbMjM6NDA6MTVd
IDxHdWVzdDkwNDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jDQo+ID4gPiAgICAgICA+IFsyMzo0
MDoxNV0gPEd1ZXN0OTA0Nj4gcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMgbG9zZXR1cCAvZGV2L2xv
b3AwIC9ob21lL3Jvb3QveGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4
dDMNCj4gPiA+ICAgICAgID4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiBsb3NldHVwOiAvaG9tZS9y
b290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQzOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gDQo+ID4gSXQgbG9va3MgbGlrZSBlaXRoZXINCj4gPiAv
aG9tZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQzIGRv
ZXNuJ3QgZXhpc3Qgb3INCj4gPiAvZGV2L2xvb3AwIGRvZXNuJ3QgZXhpc3QNCj4gPiANCj4gPiAN
Cj4gPiA+ICAgICAgIFdoeSBkbyB5b3Ugd2FudCB0byBtb3VudCB0aGUgZmlsZSBzeXN0ZW0gPw0K
PiA+ID4gDQo+ID4gPiAgICAgICBBbnl3YXkgdGhpcyBpcyBub3QgcmVsYXRlZCB0byBYZW4sIEkg
Z3Vlc3MgeW91IGNvdWxkIHN0YXJ0IHdpdGhvdXQgeGVuIGFuZCBzdGlsbCBub3QgbWFuYWdlIHRv
IG1vdW50IHRoZSBmaWxlIGxpa2UgdGhhdCAobGludXgNCj4gPiA+ICAgICAgIGNvbmZpZ3VyYXRp
b24gaXNzdWUgPykNCj4gPiA+IA0KPiA+ID4gICAgICAgV2hhdCBpcyB0aGUgY29udGVudCBvZiB5
b3UgZ3Vlc3QuY2ZnDQo+ID4gPiAgICAgICBIb3cgZG8geW91IHdhbnQgdG8gcGFzcyB0aGUgZ3Vl
c3Qgcm9vdCBmaWxlIHN5c3RlbSA/DQo+ID4gPiANCj4gPiA+ICAgICAgIFlvY3RvIHNob3VsZCBh
Y3R1YWxseSBnZW5lcmF0ZSBhbiBpbWcgZmlsZSBhbmQgeW91IGNvdWxkIHVzZSBpdCBieSBoYXZp
bmcgc29tZXRoaW5nIGxpa2UgdGhpcyBpbiB5b3VyIGd1ZXN0LmNmZzoNCj4gPiA+ICAgICAgIGRp
c2s9WyJmaWxlOi9ob21lL3Jvb3QvZ3Vlc3QxLmltZyx4dmRhLHfigJ1dDQo+ID4gPiANCj4gPiA+
ICAgICAgIENoZWVycw0KPiA+ID4gICAgICAgQmVydHJhbmQNCj4gPiA+IA0KPiA+ID4gICAgICAg
Pg0KPiA+ID4gICAgICAgPiBBbnkgaW5wdXQgb24gdGhpcyBpc3N1ZSB3aWxsIGJlIHJlYWxseSBo
ZWxwZnVsLCBleHBlY3RpbmcgeW91ciByZXNwb25zZS4NCj4gPiA+ICAgICAgID4NCj4gPiA+ICAg
ICAgID4gVGhhbmtzICYgUmVnYXJkcywNCj4gPiA+ICAgICAgID4gVmlwdWwgS3VtYXINCj4gPiA+
IA0KPiA+ID4gDQo+ID4gPg0KPiANCg0K

