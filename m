Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E693B59D6A0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391823.629811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQCM-0007D0-HF; Tue, 23 Aug 2022 09:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391823.629811; Tue, 23 Aug 2022 09:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQCM-0007Aa-E0; Tue, 23 Aug 2022 09:27:50 +0000
Received: by outflank-mailman (input) for mailman id 391823;
 Tue, 23 Aug 2022 09:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQQCL-0006j4-3w
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:27:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50084.outbound.protection.outlook.com [40.107.5.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da2f6a36-22c5-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 11:27:48 +0200 (CEST)
Received: from FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::17)
 by VI1PR0802MB2416.eurprd08.prod.outlook.com (2603:10a6:800:bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Tue, 23 Aug
 2022 09:27:44 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::85) by FR0P281CA0130.outlook.office365.com
 (2603:10a6:d10:97::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 09:27:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 09:27:43 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 23 Aug 2022 09:27:43 +0000
Received: from 12a4e586824c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B6A9CB0-8B83-4E9B-AFEB-0EA27DC54773.1; 
 Tue, 23 Aug 2022 09:27:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12a4e586824c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 09:27:36 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by HE1PR0801MB2044.eurprd08.prod.outlook.com (2603:10a6:3:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 09:27:34 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:27:34 +0000
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
X-Inumbo-ID: da2f6a36-22c5-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qn0WX9DnBZm53pHuDDd+1tZ3nbHN2BX1OiGgZ4/4Fwfk5FuztuQ7i3p7pYiEg5q2t4wlfZPAZWidWVgC67VYeQmua0YOZ2PdWZUI/JWDohOVZ5TwV/je3kBunz+M7qOgX1xKPM1XHQNLl8LEz68WJ9K4XdCGvoZ+OaOu2VLQfkBXxQCxfIZGVW6nt+YDVq8VEvmGrxdSoKvVsRwvektdevSLpcKX0YHKqNLBLgTyI+XzZVfxCd9Ke+uEOoL3RFrqDJYCzqGQNhOsFDKZaH7V9LSZqgYUlxaKs3Kg4m671jhKZXpkVSuUse8uRU7XW6vkylsCV4/U3/Jzjy1cGRlP1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAWLnt5nhfE7yzdw3JjEcMzs6pCf0liTzqNZngpTyHU=;
 b=Lk4NnB74sA/6nPL2aMT1jauYtRrLYpSa4ppuZsXDQKlrae5zJ/i59kbC72KqplwlDpRizgkmeF6QLUVHNjvy7syaziBt7MPorF2c361GSfGZlZLceB1XZvl8cPRdgxDOqb9qE+1kbosLKcBNE1yeqRliBFDGvh4e8nm5OSnG7N57iXB5bvtnAsPCqeqCO6YhSi6iMmIEmsp9U3CHW1zdDqAicohlrsO7HVBRxtoP36P7dXU/5/tFlZ576VkopZ7m6xIV3QeuKEvHmEhEDY/3Uu4kqukJ5+fA1JLvkBdwaazPVjPjT0arCicaTuB3MgWjuUJ3in93hymZ6nYxnNMLbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAWLnt5nhfE7yzdw3JjEcMzs6pCf0liTzqNZngpTyHU=;
 b=SFa9BvuAGr8Y24PMAMP0dqPg77nWNgd53x08QFF+PKZCSg09MceZDp5egwCtwcAmimdn4uYV9eX/ffoU248vBDjrRmExTouuyPjHKvepiABT4QNlhwwR1CgliAajK7V5EtcUxKRuh55yzBXvzUh5Jen6YLoH8CAH516sQ7/SDOc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5655f46c0f7abc2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNJcGOn06X6nrQupGtU3zOw5mtaQFTVjHXneAckQOQg91myslQbE9U7sEQd0oQE7ZNFLWiKYNWOUTWIaositpjY1m11gDZX/UiiK9zOr9iizteya60BdbsicEjQCYGnrpak0PpzVEUXoSGk9dm/GHvXwqenFQWIkUoQplBLlkOQKtp4j2ntL9Cy7QDE/4jQnpc5GP/mhYMHGAXiaMbwILHHa9E8aViVTa+x7syoE57272gWZjEyIXrgwPwk5WB0JvMLpaqUBuueNtZSJnLkv2NIiL62ZfzEFqIEtMOsaYgIvWkwQDhBH9w/uIILo+vCQqrWF6u14epwJr0nJyopLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAWLnt5nhfE7yzdw3JjEcMzs6pCf0liTzqNZngpTyHU=;
 b=O8zhu+dq4BfMsk0fNrIcJqMXj5uWua3XVuvHc+KsSBIehzfyRmQtOQHDyjyRE0lO7ve48ZQ22SUIOepydzDJjjZLyaeM1buYo1AVIw7CfqJNKqSHUzk+tk+e1kp1n4dUcNyg5mRzUvhLqDOE9M/ChOIkZj+E1EFbR4NypwIOq0wzZEB6BGTaQW5UgtaroDZEVdyvDJKDxXK4xGm5aH1XmmUct9YOpsFD7wfB3p0++ogqG/Wpalv9xSr6g/0pMm2w5jzt0WBkmzAmn8ITd4as6jnvV9vsnSWlLExZiPLqqnZnY8Dw7dvNKZQ+g4QAMMVLkvGqI1BLbmrE+rU/zzjtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAWLnt5nhfE7yzdw3JjEcMzs6pCf0liTzqNZngpTyHU=;
 b=SFa9BvuAGr8Y24PMAMP0dqPg77nWNgd53x08QFF+PKZCSg09MceZDp5egwCtwcAmimdn4uYV9eX/ffoU248vBDjrRmExTouuyPjHKvepiABT4QNlhwwR1CgliAajK7V5EtcUxKRuh55yzBXvzUh5Jen6YLoH8CAH516sQ7/SDOc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/7] xen/evtchn: modify evtchn_alloc_unbound to
 allocate specified port
Thread-Topic: [PATCH v2 5/7] xen/evtchn: modify evtchn_alloc_unbound to
 allocate specified port
Thread-Index: AQHYs7NT/ePVRG/IfEm3N5HsoShX2K28LhSAgAAPqoA=
Date: Tue, 23 Aug 2022 09:27:34 +0000
Message-ID: <CE0C7662-35B8-4F46-82CA-18B8DD34F08F@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <02234e7aab1e8f3d18e5398f1c4745203df77364.1660902588.git.rahul.singh@arm.com>
 <d8f1056c-8ab4-f220-8f2a-c1042e77ed58@xen.org>
In-Reply-To: <d8f1056c-8ab4-f220-8f2a-c1042e77ed58@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a8a312d1-3a5f-4591-460b-08da84e9bbd2
x-ms-traffictypediagnostic:
	HE1PR0801MB2044:EE_|VE1EUR03FT054:EE_|VI1PR0802MB2416:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HdYe2hLyTPoIRqJUS7Tx0nMEuL6t4Wc3Eq4FqbT8zxX8eduHDP/ByVNROrWTziNm55kx4yNwEu45ls45Rh/AyDLmkhfwKTPJ/fxU+CYbVUAG8yYravU1UdGEkscsI+MW++HMVK74Mi48OdN5cm+If2KfVR8Xpv1FL+sfRJp3baRCiRrq29jcUjyJDmT2pjc6dOh+D99kmUya8SUe53jMEPsmKtMWfWjoIRyCS3ZlF1W7cOYzsagvQ8EasQGs/dpvA1rV5N2mQe0dXU08fH461ZHEQMADYj44wR94PcC0d1IWC8OlIgArWFZ0WW7/8HmqKgtZZO72CpepEwMMz7nhGBc2RIHV2JWs0PJKYlAW218A5QiQgmNrYgw7W7pJkALOOs4DG9In4mBf2CAOkrSKyPru9a0fUqZcVLLzJIaULcoeMdkHoYxg1xpjxVy6r7IAlvM44VPWqXJ70FY0wgPQ2r3FQIKcENzT38kp1bWsgIONBFDJHBLB9qTNUuKlA3pa1h5fRn/jcVDHEoz/Uu2D9JMjY+RdsPDt7oEdxSiYwu7lDVvJcEAnR84YuawA3ShrKnFmippzfd/+pwSz93Rj1sniNq4/aVDQx9XWrvbffOmVTbQNJ3on9qsEVm21x1ASMat+8duHqtw8YppeUXF/iYFaV8BVVUoVmvcoT/X/zXka/1OO9h8F7BAJDmFavKbp98fIUQ1bvBWYRlG1LXG1gMOseELdreWxwOxUpq0zFzIPCHGS3LfQblY8YW/g46tcVN9netWwStFCtf8KsSz+yn8P1GGVJ6TnqA7NXuqkytg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(71200400001)(6486002)(478600001)(6916009)(54906003)(316002)(38070700005)(2616005)(186003)(6506007)(53546011)(41300700001)(38100700002)(26005)(122000001)(6512007)(36756003)(76116006)(2906002)(33656002)(5660300002)(4744005)(86362001)(8936002)(91956017)(66476007)(66446008)(64756008)(66556008)(4326008)(66946007)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86B33EE299BC4F4C8F70D01FA6142011@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2044
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22cced7a-4162-42eb-9dba-08da84e9b5f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WIRCXFlcsQddd+Nztu+iKIJW4mygLmeb/GaDYV/aogk2Q/RbsH54rgJmSdkaxez8jM5Za6p8JFtHppTEhJUxUN75dRMTqAP/6hd2702GyCdxVN/G5qDNp5kjmFD1lpm3r+fjDk5DBytpwOVE1yLjYVuRNUmGaowhCTSQY/hUpCTpTC6XqJETWaIaBpUwz/zMQCxgflx0b2dRa2nL7WTtwPXuyls0f+GChmcH4GX3XWzS4amXBht30FQCRv5i4Hhqb9FAjUXJj3c8Ez7tBKGqsrZpjXb6eRy+NYYVA7og032h2DhyD9FvR/ZG774+r3rQ0okaxFoAeLwk4cUPvORCXZMD7YbIf/r3nVuv2YxORRRaN9zReiIlC8PQoDcXiqAx/lsZ2X9jA7X9ubva1FP8pYasHKdLNh64wHHu6N+0HttDS0L7gC+d8iEgo0F4V9aXwbmoVjrgIxmHS7SIwL9iqodg5xLaKGfDMnH3QWhfCYWxa2gUCUCTh5Jg8/3tauZaxAhen1Oi0Sw1LNZcQoE/KnrEOtDSVpMPKkKn5krxdERkbk29UwNl9qyCrwyDah2ktZFBd3IZ3JjzVQ4/MwGLeiq5v9CYZyJIrHh2GMYIf7EzroYIqdPJ244ee8rkVzFo7svLV4MThSX00WeHqXeHvwYAaDBcufZMZLhR/bAd32XjdOJhPdvzLb6RImIAQj1BAAMuAQoXvTQKo4+hlE+y7nbvJqF07r648AKmeidzNTrT5pY2WqphARMN5Rg0P1xi2YRJRD/Nr6fc3ufVVEV1zA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(40470700004)(36860700001)(40480700001)(86362001)(356005)(40460700003)(33656002)(82310400005)(81166007)(82740400003)(36756003)(41300700001)(4744005)(8936002)(6862004)(5660300002)(54906003)(316002)(8676002)(70206006)(4326008)(70586007)(6486002)(2616005)(336012)(186003)(53546011)(26005)(47076005)(6506007)(2906002)(478600001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:27:43.8462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a312d1-3a5f-4591-460b-08da84e9bbd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2416

SGkgSnVsaWVuLA0KDQo+IE9uIDIzIEF1ZyAyMDIyLCBhdCA5OjMxIGFtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMTkvMDgv
MjAyMiAxMTowMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBldnRjaG5fYWxsb2NfdW5ib3VuZCgp
IGFsd2F5cyBhbGxvY2F0ZXMgdGhlIG5leHQgYXZhaWxhYmxlIHBvcnQuIFN0YXRpYw0KPj4gZXZl
bnQgY2hhbm5lbCBzdXBwb3J0IGZvciBkb20wbGVzcyBkb21haW5zIHJlcXVpcmVzIGFsbG9jYXRp
bmcgYQ0KPj4gc3BlY2lmaWVkIHBvcnQuDQo+IA0KPiBOSVQ6IFNhbWUgYXMgcGF0Y2ggIzQsIGl0
IGlzIG5vdCBjbGVhciB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIGN1cnJlbnQgYmVoYXZpb3Iu
DQo+IA0KDQpBY2suIEkgd2lsbCBhZGQg4oCcY3VycmVudGx54oCdIGluIG5leHQgdmVyc2lvbi4N
CiANClJlZ2FyZHMsDQpSYWh1bA==

