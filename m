Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65556875D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 13:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362167.592113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93bC-0004DG-Vx; Wed, 06 Jul 2022 11:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362167.592113; Wed, 06 Jul 2022 11:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93bC-0004Aj-TC; Wed, 06 Jul 2022 11:53:42 +0000
Received: by outflank-mailman (input) for mailman id 362167;
 Wed, 06 Jul 2022 11:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LAHD=XL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o93bC-0004Ad-7n
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:53:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46b8d463-fd22-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 13:53:40 +0200 (CEST)
Received: from AS8PR04CA0101.eurprd04.prod.outlook.com (2603:10a6:20b:31e::16)
 by AM9PR08MB6193.eurprd08.prod.outlook.com (2603:10a6:20b:282::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 11:53:38 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::7c) by AS8PR04CA0101.outlook.office365.com
 (2603:10a6:20b:31e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Wed, 6 Jul 2022 11:53:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 11:53:36 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Wed, 06 Jul 2022 11:53:36 +0000
Received: from d0d4842eaa9c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81518F89-CC36-4B42-A010-B7CC5CAD553D.1; 
 Wed, 06 Jul 2022 11:53:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0d4842eaa9c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 11:53:29 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB7152.eurprd08.prod.outlook.com (2603:10a6:20b:3dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 11:53:28 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 11:53:27 +0000
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
X-Inumbo-ID: 46b8d463-fd22-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hXbSVl5owvks6v3gZFogd0RH5T852SIq0KD2H9++Lnw1QKwZj1SUI4P6AsA2ucqkQEble9AZKj5OXg4i7PWDCC0r83tqvgKzM4n7G0Qx6ejAu+6bQXWc+KUveX43cuec4fBqsrTReSap+Rns4VnbEdsY0Y8Moin+Vh2OotQTKZXYWK2S5GV/hwiQKnwY4mpg7zNf+u3n6q59Lrle1QsFVnV5oK+jRTJx6lcaYsDhN/N93KNhWTiuKaV9glDG21qT7YY0eZdnuD2gAexzTFiP+l6Wbm8YkAyTQgl1otAYdysfKI8abAsSDqiNG0EPU0zx5iNNbWbDyk4ZQCBtcK90TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpe7j8NvqOpmkuLdRbbe/V1v9ng/QgJXcmvxSoYjtJI=;
 b=S1U2BggHYvR0gDORSA0OS4yHGR4bpGjM24g2GHDGCmpcaycVbTHhJu8b7+6SKi0N4VkWcvuC12D2N4oyNkcnlx/ikXXYuoDIAHvEgpqmWeXl15ixyEK6LAk7XizQpcE8sbNru54UXoTsWxZI4R58EeWLMdRL5ZcFja5uF9Gw+5qrRFO4ergSF/OlbysPXvkH7vJ1psqj76XqkMI33TM54Jx6mkhCmPrlLH3IN0/xkzANktJasttYI/Gxf9ICAPuuZ+MBYb5o32Lcvn0b5uYMTBPBWppka829i549e6MsULbYXg9iYr+sLttpV5AGzonrUx+bLbHlVchpX5/ysFeBCQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpe7j8NvqOpmkuLdRbbe/V1v9ng/QgJXcmvxSoYjtJI=;
 b=qNvbnXSYmbl8xNBUCwHlGSRJOAwgoAOEJAmHN+v8UdfUKatRPpzD87rfSdfwEw6ZAbRo8OBAm8ndkgkzRRT9qqmHo1k1EgRso7O/lbl9CXcwP91IK70JnGUg34JnikBSc9aoTmUFHfreMQtSjlbLptPtHhgXyZ3qP+p0APbxtQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7b6ecec97bc0329
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG+OgX/L6ZDNRosAXVKT7ay12UX4ZxtR5OdKZHZfYtkcVOgBvrUaapSsXb9jnzM0NlFUDoq3PnpzVNifo7qsfZEdtfNjkvqRnZfP72XaM8c32XvLKztU7VfsYzcCkbB4xN973dOZJK+q3V51tBRSfkDTSPPgxa4eYdMP1Dxk/FPv+sPD3p1/qTip3AIyGbEAD3z/OQpaXa5lxJsx1FfGvoik3yVGfQt/XWNzU8kRoFq/QzvkwSjJaUMeJjwcqm5Jnc3mKzGe8iobI3o+qHJZXN3M6puEw18I4bk4D5659K7YjJ6ATwkeXQvWuN10mCi5hj9cdYpUkj85T6dfpxGwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpe7j8NvqOpmkuLdRbbe/V1v9ng/QgJXcmvxSoYjtJI=;
 b=h0xykj15s7YNc9fNHoFu5HPUk4JTuNtTixEybTANttJV6zKm2kXdxSRB3V3eCVCO1q7H68l+oanx+YNOBraCVclHCfLJkt2T0O4BICm1poFU2fsn+GCvvYhqMR3BnM45pjvhFXGItHQWN+tAHvb8V9xFQjK/oQMMStbe57mv8ZINZphLv21vYcxiSPFiHZRdeemcWgDyQOr4VFL4PhR9K4ovYYIM2WWw1mcFq0sB9B7EKKEIM7ww/na7j2U/ANurivv/5ZdhwBbNNIefmTC0QT9EqYRZ1qBOAmpibcn9C3ZlhDcwj2Ou6bSw2ySu6XCn6jnCYDRG7rE/I1ZzuHxNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpe7j8NvqOpmkuLdRbbe/V1v9ng/QgJXcmvxSoYjtJI=;
 b=qNvbnXSYmbl8xNBUCwHlGSRJOAwgoAOEJAmHN+v8UdfUKatRPpzD87rfSdfwEw6ZAbRo8OBAm8ndkgkzRRT9qqmHo1k1EgRso7O/lbl9CXcwP91IK70JnGUg34JnikBSc9aoTmUFHfreMQtSjlbLptPtHhgXyZ3qP+p0APbxtQU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/8] xen/evtchn: make evtchn_bind_interdomain global
Thread-Topic: [PATCH 1/8] xen/evtchn: make evtchn_bind_interdomain global
Thread-Index: AQHYhkXPcukJScWMoU6OKeMe60D1nq1v8kMAgAFfMQA=
Date: Wed, 6 Jul 2022 11:53:27 +0000
Message-ID: <E82858AB-2387-4EB4-8883-E09DF0BCB4D5@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <b8324e47bcbd7feeb992501b22b46f0ede3c2c3d.1655903088.git.rahul.singh@arm.com>
 <e75264a9-9938-725f-23d8-4cd968969c7b@suse.com>
In-Reply-To: <e75264a9-9938-725f-23d8-4cd968969c7b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a89b12d7-74f0-44da-2adb-08da5f462940
x-ms-traffictypediagnostic:
	AM9PR08MB7152:EE_|VE1EUR03FT017:EE_|AM9PR08MB6193:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nUP7tkAhJl98owpH8EuNK0q1tdW4oXGj5YPGzYSOwpBdNWn10il9XcEZw0UVXNNGmbq+hQK+7F/l8M+CfM8hWJOefQa8iSnmsItecTkAnOVkzNH6Ie22PK9MV4G7bNLV4/L6lYrp9KofBMS/KLkeaRF/sxNrFDKC6H5v/XsNzYtz6StUBg2IEE3SauBNO/JhfzJGZG/dfvmozeJh0XYzzKaDRxUSXsKiOkI15764YIPgfgUXOuo9DZPYAaN+BrlMdQEq5nA3pvj1T99sIhFw/pPhI7ICVVWVKWFWH9Iug29vwrf38N/gxrAYeSB+xpr26a/oGGi2/8OVxGIOy7fzxR7yZmRVn9vKTgu02KAakr/luAP9SJTeLNpA3N32voTqmvYYYGK0Bm83RuaMlKlKCtGAREqrd+/Nt98b8Gpxx6FpHKF2OecpZIXkcd1MKtnvCK57lB825zi8Qxm2Wfx7OqX/vfoH2hPQZBhllufkUcyoF/5AdgaSM/i+fE+NJjEfEx6awp0EUFCMMOafzXMegnGW9yvJjRV/bi6I6KJxUI26Xvui26lCMYxvpwS0vdIbzwxH3I2v9VL+32UULN/RfOTp0iFcNqi3dLL9vGK3eFlC1O8X7Q0pbuzw9R4N46f91h3FTkInvrp3x16FN8Axbp9ROAPFzS6KsLdGi5vB4OkOHsfRUIJbNbv7fXUBnTsbeuSf2dapIXnVEalxx/5gV+njRVFNblFiOc1pW8crBsqIXlpNjuCQY3T3PKjfUbUJ43ctoC4XmySmfznw0F3Zn4fity0blQrla7cZKMJjnlYGTjIEPhVv7dnVuLqkdSl4jyXvex5szJQXMCyfUxx6eIJFANomAoxD3ENHGaMj1nw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(66476007)(83380400001)(186003)(91956017)(71200400001)(33656002)(76116006)(66946007)(66556008)(66446008)(64756008)(8676002)(4326008)(86362001)(478600001)(6486002)(8936002)(5660300002)(4744005)(26005)(38070700005)(122000001)(38100700002)(2906002)(41300700001)(2616005)(53546011)(6506007)(54906003)(36756003)(6916009)(316002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <755BA39929E06143852CD3C66A2D12BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7152
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be5f4129-9fdc-4295-e636-08da5f46239b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Id7UNKdJP6cwiITRGv1orr09Lw7j3qqTzsdFcITmuPoWRKXNYDCzaJQAd9J6w2uTTjzF2ZWVEFDaL26Sia6mRH3ymbwoGrAep4WWMty0oA1Hw8xOhkyn8mYe7WrDthZsiokzlv8BcLjfCNFHZm56RqIfFGwvfZLaAYJ3la137Xs55i7U10DqrBhrnQ/nTXROOfeFk4a0nc4RQAhleEdN4iSJ4+Yx5QRtIcLZVtbTSc2Gt/3KKFEuz3ObZb0NnO69Vg4Csv6bzKRyDUaSO/aELWUfBXeVLDLIhNmiMCGFMPluKZThaMECpfWh0iopr55CdgYD3cEvh+wJdTQmn22vU5OFLJUPXvyXFUBaXc0IU3kRmlRfbiSxZatAdQOyMNlpgeQCEQmPzhH596vCNp07zXF70XBOyAFdpJceiT7DnOcM8pdeGOE80qy4T/Cf4Tl3Azg97kJ1XjwSrXX3NTLDDZzXk6QniDLhMuBzyXCULSKEPC8oOUPYcE1tcD1b0gy4SSR32SDygZhTY7b/cyvSyU0XW/sbXJiWPLRLyh8xNfS4XKkfiBPv+0iiPEm3M4Nogn2fF7XL2qDG4e8D5kkISu3bGMG7n78/FGYJuQeJbe8Fj/E1VeYbwDqe+/M1G5ytWYFhjrvfwmlBtJ9BGmQ/bBYmyymoDmXOL56Ry8xDrsjfZDWjH1hgPxbSOGrwc0Cg+3DAE8BXuiwLuSgfryqUeMiwh6dSVG79VWrIPuaJKUaAvLUgS+cvgs8qwIHm5eWTpbBRcjHSTzl+byGyy5BoZp1Je7MCNrVhXno0QeR3N7LdSg8B+ZvMQT+0zFcWtuMV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966006)(36840700001)(40470700004)(81166007)(336012)(47076005)(82310400005)(82740400003)(356005)(54906003)(316002)(6862004)(86362001)(4744005)(8936002)(5660300002)(83380400001)(40480700001)(70586007)(4326008)(8676002)(70206006)(40460700003)(26005)(36860700001)(6512007)(186003)(2616005)(6486002)(478600001)(53546011)(41300700001)(2906002)(6506007)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 11:53:36.9673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89b12d7-74f0-44da-2adb-08da5f462940
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6193

Hi Jan,


> On 5 Jul 2022, at 3:56 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.06.2022 16:37, Rahul Singh wrote:
>> Event channel support will be added for dom0less domains to allocate
>> static event channel. It is necessary to have access to the
>> evtchn_bind_interdomain function to do that, so make
>> evtchn_bind_interdomain global and also make it __must_check.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> In light of MISRA I don't think this should be a separate change.

I will merge patch #1 #3 and #4 in next version.

Regards,
Rahul

