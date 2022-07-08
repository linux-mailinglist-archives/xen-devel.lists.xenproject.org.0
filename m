Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0156B3A3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363246.593702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iWY-0001tB-Vr; Fri, 08 Jul 2022 07:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363246.593702; Fri, 08 Jul 2022 07:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iWY-0001qz-St; Fri, 08 Jul 2022 07:35:38 +0000
Received: by outflank-mailman (input) for mailman id 363246;
 Fri, 08 Jul 2022 07:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITNJ=XN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o9iWX-0001pv-1m
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:35:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d57fa29-fe90-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 09:35:34 +0200 (CEST)
Received: from AM5PR0701CA0020.eurprd07.prod.outlook.com
 (2603:10a6:203:51::30) by AM8PR08MB6433.eurprd08.prod.outlook.com
 (2603:10a6:20b:36b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 07:35:31 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::1c) by AM5PR0701CA0020.outlook.office365.com
 (2603:10a6:203:51::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Fri, 8 Jul 2022 07:35:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 07:35:30 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Fri, 08 Jul 2022 07:35:29 +0000
Received: from 43010edddf83.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9AD7C36-F871-476A-805B-0953F634DBE1.1; 
 Fri, 08 Jul 2022 07:35:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43010edddf83.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 07:35:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 07:35:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Fri, 8 Jul 2022
 07:35:17 +0000
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
X-Inumbo-ID: 8d57fa29-fe90-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h18peno+Q7IeKI9SQP4AbI9n28MnIc4TScslgrikIavf28FooC8MVQ89EqW+QbdRdAa0hiLi9oWEdBqQCzkv6G8OOLAmA7b2lTfuxiSgS6i8yX8kSiFcdlGfelFy7XJ/1BCbhK9jFL51+RgCF8uJbRExfWbypv8Bgz+uWOAwVbqL4RJfK1wN9XAfJ3uzIqJmdzXRwWZ5dovamQZJxoqXNhfCM9GMijXjKUi1DqaMbMZLhP9zCEdkJ4le83gNDhfmz+fKmeUFvpfkNY11vjV3sLxeDavgsPZ+YgdAtSPWR6MB6QncvVGxskEOAoQZlsZw5HvsqVTpJtyGcdc84vTnWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE+WFuNzX8GpfHH4BB0wjIQK4dcy90sVhvBf4d2ehFY=;
 b=ZUxkiGIvwEXIymj4LK0yPDg0cF0Ikp4lQn5/Ir5VS6nv35YO8sVWGfoIBKBKR3XWmrpew+16JTMhf8aspn5iFSPNNQBzc1FHBcfxGKQd5j7I7Tuk9E5e7OYXLwCdS++RiWkeRaJ/kHhcv+i8F1gmIu0/JQ+RMAdjA23NKUqK1ugpd+E0pWdBGTfbVYRWQjIOwPxvMi2lS+6aA9NLiJnDojM4A/wSx76Fto7hZ72PawXozRqSVvQrj5bD0xJjGG/J7ezqzBSr7tttsIQuzuHvQMAcnDxyyxZtFU4nJj7pmVg8LVh8Dt6hNDi0lJD36mMT+vb1bLycTrHH1WlfI7KDGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE+WFuNzX8GpfHH4BB0wjIQK4dcy90sVhvBf4d2ehFY=;
 b=vVz31XpyBVPVECVKme7Y5LDZv52DboIEui23pjIXKViEud7jtSLDvclpT637qx144fMHHipVlMtn2dIwUyM4dnqfNBBvRbD2BVxwx0/5KO1Nw2l/+KM36cRFPWWSZaohCI2jNzTAjQ80qayQ7tJiH8fYo2Th1xOa2doKbr4Nlo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxdHkqKyzLmlR3bVE55prs+SJBuFSnqasAx4K+tcTwyxie0XVDAFjMs6rYVbC7fI7+pLehl3vcrDPCwQHBRj6lh08vpsAPpdGZiQOn4/KxkXJwLvHVrq24Ka+Q7Z4WwMLNYpcsnbOAxNuUlDG3bhmO/5gj77JBrf43eZGfVL+V89E+tqVqdwaxlBYhSNGZbH0c7vos2BW9YEmc4eRhtYl7NF44P8zPuPnOpF/3Z3hiXhnurDY+wSTqk1n5DZWKSs9KVgJbzuy9hTM80Ij7WTGMUD6g4Gx+2nRONAvvwyAbkdh07hTRbYx9fBFK3lxE6X8n9eMdTCPjfc+f318AyM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE+WFuNzX8GpfHH4BB0wjIQK4dcy90sVhvBf4d2ehFY=;
 b=Lnr+WPWJbciCNZ9HpUB+ilC+wwP28OGy7lzmvLYW65jXOy1aHGmTBuVGw8tYfQLbJSIDnIQiq/FYc6DEQkFaZx4yjQjfyNjHsesMdwCpXser/CsgO79rkwQEX4Wq8+pGjau8jTzbniGtjK+xx6mmUrf7/Wx5FNHls5DBAhmkcWkJlNv3b2n2u3M5yPr493DJD6rXzDsmuUZuzfz1mcvmQPtDEpBaC6L8yCgFKORHYqhu+AinWWyy/9u9FgqUGbY+6+itxZW/j00aea3ULyhd9b0JmtFWHCfdBadh6LgWZZ3h3GoPMTqajHiTR/YJtnuECU6KcTwHbJZvG//6nd6zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE+WFuNzX8GpfHH4BB0wjIQK4dcy90sVhvBf4d2ehFY=;
 b=vVz31XpyBVPVECVKme7Y5LDZv52DboIEui23pjIXKViEud7jtSLDvclpT637qx144fMHHipVlMtn2dIwUyM4dnqfNBBvRbD2BVxwx0/5KO1Nw2l/+KM36cRFPWWSZaohCI2jNzTAjQ80qayQ7tJiH8fYo2Th1xOa2doKbr4Nlo4=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: Xen 4.17: Proposed release schedule
Thread-Topic: Xen 4.17: Proposed release schedule
Thread-Index: AdiSei6vjIC3DQhRQxe+drETJuVp3w==
Date: Fri, 8 Jul 2022 07:35:17 +0000
Message-ID:
 <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 36BB5B1F521FCC4EA4B75A6C404CB7D6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 69dba295-9261-400a-fd26-08da60b46f50
x-ms-traffictypediagnostic:
	AS8PR08MB6151:EE_|VE1EUR03FT057:EE_|AM8PR08MB6433:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zp2hskBSgDnsvHiYf5carenTbHNWtWUcK5rfqAbQCsxpduPcPgY/GdHXwzfWBxfQybjVgfxM/GUj3fc8FkLdnzgF79eFU5EGWfexZ27eN8q1/Nst6D+KWPpNfjf+0uTCf08XRYGeJcDhn06YAaFa9txDEwjIH0Z/g7Wy8aXMEXT1o4dESMR1mmLnwTFkFykGfFGx8a20RysRzjCSvuyo3O5Sas/EShN6HfD9RRNwN1Vdp4Ht4gM4l/sr4J1VkPCMD6N9BbpD/H8FfQz5i3MShur9TtIkkPqyDjf+KL7znqx7dMNzZd6v33+7Bxj+H6kQhReS1jZ1K76+zIY1RIvQ6WHVt9Bm51trnVzjujONw/E1iQnqBuMBhMVCPjIe2gmhlrANeVS67fEDRZ/LZES+vEUHuFzsvAqGqcgOv5SGxEH6Sfa54bCeWvl0S5EhrS30ZPft32yJkE0OQCc/xa9rw38KcEdRKYjYl9j5kwxqlv3R7e0YTN5qTz7onAzRCKrkFPMfDyur2CP0/XNpfHUMTqZvZe7MURrUN+nI6EdGkgfwhcoPWI/9lLUyuqqKKNQDt+6QtkqxEG/k56k0K1neU+NxK59IQi1vA+Qo7q0cW+gcW1KH6DF9QmHNOjRIJ8v3P8ntL7xzkqjbvJVXfdSJs+gEFUpFzszHfUJh6BIAmfdMwi5flzZ8h/8r+Sg7AenCO+gdH3y9PP/ASSp9WmzPzZyaZcBOacBFgQyVljVasEeC7Th0IhVCA3clRqPn2cOTAkNYKVVtrLUcRLGaJfwm//TkeOSgKOwjsRxRc+Bw7/xmmxXxmhYt9pYwgUJHGVdr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(71200400001)(66556008)(66476007)(66446008)(64756008)(66946007)(4326008)(8676002)(76116006)(9686003)(54906003)(6916009)(316002)(38070700005)(86362001)(186003)(26005)(52536014)(2906002)(38100700002)(33656002)(41300700001)(122000001)(478600001)(7696005)(83380400001)(6506007)(5660300002)(8936002)(7416002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe8dccae-d6dc-465b-e8f5-08da60b46791
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eUQK+O/GpBv+PlV8FXkMrn5q7dllO48AfH/gq1gL6Xn+TVvzLxjgOtvSx+O9OyjA71aw1vPp6deKVJ8J9yVmZQrFkeamBaVWokEYbNaYedi725Rr2oeKXUeqaB26Wg4DafMSVRgj7QnTfRA6+E/5kIlkOpIl70+Ix3xedg8f+M54jazwwcBPzMd8q1QQRclG04EsYqG8s1GYfL5GAu/2s2uEDgTF0APyb98Cj7quHKF+ZzVNjQVOs3/gqSNB0pFUSzeAf2Pt5JenNMjefvE2ixPS8FbF/rfBEO0jVnRp7X4kpnB+9ulj0b0KtOTJm4xOjRVHnsx0QgSi1EJCEb5fr2LxYSzUH9krViglLmUWQA+7fHiwW0ynHOjtYp3qWko6GTtwPT1LJ1+m3jDPpeIAs0CfnTc/SLcDN7ipFkf9Aubr2pF3pCvO78DfBjmlSHhTDJ+nnuDHwSQsJoNGoQyvrNByeeje+GYqUc8cvsYWhLGW9VcI9vbjWTBDcXyw02Ct+THHsI+N/8soDUFmqolQhteGE5o6il5JUNunD1v7eUnfNZrCRwUKOJXrBW99DrtcbqzUKl6VXNJQxK8QS2M7tqZrcCJ0b1+ix+uE9uAvIGGyF0gk6jB0KMCduIsDhVepuXUKiiAOTj8inAhi0fVdTO22MhELuzJQcBQJcsyYbb+jkaIRMTyqQrpN1wCbvOoYsWvjukskJS7QM6FeWY7DDObuxKycgm6B0x7+tNLtey79z2iqA/i/EG/FgpQEZMSMQeyFda8n0O9UjdIBRPJ1rz+N/FtRR2Og1q0/pVunwaEeN6feoTTctLalZFF1hNrw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(36840700001)(46966006)(5660300002)(9686003)(356005)(82740400003)(107886003)(36860700001)(26005)(8676002)(70586007)(70206006)(83380400001)(47076005)(8936002)(336012)(52536014)(186003)(4326008)(86362001)(82310400005)(478600001)(33656002)(41300700001)(55016003)(40460700003)(81166007)(316002)(6506007)(2906002)(40480700001)(6916009)(54906003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 07:35:30.3211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dba295-9261-400a-fd26-08da60b46f50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6433

Hi,

As discussed in the community call on July 7, the release schedule for Xen =
4.17
is proposed below. Please send comments ASAP and in any case by the end of
Friday the 15th of July. I hope we can finalise the schedule then.

Original date following the 8 month release cycle (August 2022) is likely t=
o miss
considering the summer season in Europe and the fact that we would have had=
 to
feature freeze in July, but this is likely to be not feasible anymore.

Based on the Xen 4.16 release timeline, for Xen 4.17 release:

Proposed option 1: Wed Sep 28, 2022
(+9 months from Xen 4.16 release, after Xen Summit)

- Last posting date          Fri Jul 29, 2022 (+3 weeks from now)

Patches adding new features should be posted to the mailing list
by this date, although perhaps not in their final version.

- Feature freeze             Fri Aug 19, 2022 (+3 weeks from Last posting d=
ate)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Sep 9, 2022 (+3 weeks from Feature freeze)

Bugfixes only.

- Hard code freeze           Fri Sep 16, 2022 (+1 week from Code freeze)

Branch off staging-4.17. Bugfixes for serious bugs (including regressions),
and low-risk fixes only.

- Final commits              Fri Sep 23, 2022 (+1 week from Hard code freez=
e)

Docs/prep only

- Release                    Wed Sep 28, 2022


Proposed option 2: Wed Nov 2, 2022
(+1 year from Xen 4.16 release)

- Last posting date          Fri Aug 12, 2022 (+5 weeks from now)

- Feature freeze             Fri Sep 2, 2022 (+3 weeks from Last posting da=
te)

- Code freeze                Fri Sep 23, 2022 (+3 weeks from Feature freeze=
)

- Hard code freeze           Fri Oct 14, 2022 (+3 weeks from Code freeze)

- Final commits              Fri Oct 28, 2022 (+2 weeks from Hard code free=
ze)

- Release                    Wed Nov 2, 2022


As soon as the release schedule is decided, I will post reminders one
week before important dates.

Kind regards,
Henry

