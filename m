Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480B55E516
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 15:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357114.585537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Bex-0005jP-8a; Tue, 28 Jun 2022 13:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357114.585537; Tue, 28 Jun 2022 13:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Bex-0005gb-5B; Tue, 28 Jun 2022 13:53:43 +0000
Received: by outflank-mailman (input) for mailman id 357114;
 Tue, 28 Jun 2022 13:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+uE0=XD=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o6Bev-0005gT-ST
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 13:53:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6d4fadf-f6e9-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 15:53:40 +0200 (CEST)
Received: from AM6P193CA0074.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::15)
 by DU0PR08MB7568.eurprd08.prod.outlook.com (2603:10a6:10:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 13:53:37 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::a7) by AM6P193CA0074.outlook.office365.com
 (2603:10a6:209:88::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 13:53:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 13:53:36 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Tue, 28 Jun 2022 13:53:36 +0000
Received: from 358754253f0b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8DAB5619-3306-4E18-B672-5B84316F3CA3.1; 
 Tue, 28 Jun 2022 13:53:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 358754253f0b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 13:53:29 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR08MB3071.eurprd08.prod.outlook.com (2603:10a6:803:46::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 13:53:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5373.016; Tue, 28 Jun 2022
 13:53:27 +0000
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
X-Inumbo-ID: b6d4fadf-f6e9-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MEQFxpwC4dVe5RcSRvdnyrSkpSANDvVA5Z77cQdb5HI5lUhB3SCBrDvZ54cTBx/0WLftugeyoYUKlheXrIE6o9LmmBW1hih4kKUk57Wb9LihmE0TqadwiKKkxnKoY8xBh5c3VZpwQmitR/95kK8lcVyUWO6sAeTElNcDA8HcQ5FAymdygdxIPDG/+65/enGn2+762YZQlrBfRWPqCpqB+LgPRoV856rugA6FdfEqcbp6/8zooO1UckuoW6A79ho+Fd63Aqj4FZYifKdAHNBIUMvVTvxwCdP5GoKnZe+GimDQV6+8ECIW/Dc0RaY+7kUp6r1/A3iISar4y8quIeSGkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QGzdp3NXY9qbSlSCQc4sAq+S4XSDxZRLhPVPH6yvRU=;
 b=T1WNcq96eHC53OsXOJnYS8EUWfEfaAV8MMAiBR/BS0ZdsHmymHPdr/Q5Pjm3eeZqxIfym5QLxm1RJ363CRqM2/U3ItP/y6ShvNtCNl43tOblDOlFhLEAX/lIj6fMfEU0zZYZh/hIGFa9CWiRu1ISk1//GIMYkHOMRGsaqBgnbg20M9CBy7qiLWKURnFDYJGV9wgs97/ci4SPPF7Nxmkgv0xsgKZaYNw5KO0+2Vlt9WxIGmGp7CUST7jkcOfyqJFAI3+zbzUPq5qo88XTX07cLIOH453Lydys1bCSgDxez6VtskUKXhwpTLjdNXWI2DLPJgZS5rL/Mp7kOX9/Dn5phw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QGzdp3NXY9qbSlSCQc4sAq+S4XSDxZRLhPVPH6yvRU=;
 b=tTxXtXbe78Xf5TQsgVc5GPuWbJkOVBdIoxZkWZ3qgGv7242qN1GB94iMXSoBtsSRsBMUR7lgsrsOFreVvc2XtvC66FIyXYKYUXLOcv6UmGSgnpJBjvBhRvWT45LfVXAG+hqARiejDvmORAnsm4Uh4dvkmJNxWxdCux5A6jK5CB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4eae6b67f2840145
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2f1AXVbsZcs2W1QeY3Wt53OH3efSn+qkWwEuPb5eGFOC8hjYfrtdBJV4s9Lx+hWEyAZ0Ce/dgvv7tFxJzHdsSRRg0Rc6XmqyOBUD9pvDsd1NszujLbwS0znIdL5l8+RgoTE2+oCtL9+ASl6+uphYX9Q3hOIRu0BL77tcoF1KRh0LaRDGKvGKur3tarwm4692XjI+0XUp9MhpTUDWdYdMi1Sd9pNdOCBmtfMqzv7ydDN1t9AWvoybA4wDgK//6UQ56niiCBwYAAWaWkQOopQImHwe28pG8pAxZXTUNgpENO9CpBRTFnneyLpZiCYojHYeUmS0ERHbvtZS7tCNSjyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QGzdp3NXY9qbSlSCQc4sAq+S4XSDxZRLhPVPH6yvRU=;
 b=CnCCZGxnnCLwYOBS61Oy5kEU4TgS1J41bSqokJQPF8ByQeM+RUgc0jDtMJ6WFYlTN71XHRgGELds7gKTv2+nXTefbOsqOXZP9tCrJktYejlKMkGI5zwaQgq3Hv7ik1elYo5OR71Mr69k6dhwBnlnHjPC6aCFuLgXCJeTY8LVGTmURdrjqTB8j0dsX5e6mAUVo5K2tSO0W/Pk4MTdpAg/4VtWGqxeuOOo0b706jGJhtNKsBzYrHCI+WM3F+Hj8RDGFCfXvZKjS5hg6TOKeGbWnGq2mO1IH+GGwRqyuczow/acNtHQMzl2ZBRQWoJGTQiQRNtf6FtXOw3SLjIi1snfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QGzdp3NXY9qbSlSCQc4sAq+S4XSDxZRLhPVPH6yvRU=;
 b=tTxXtXbe78Xf5TQsgVc5GPuWbJkOVBdIoxZkWZ3qgGv7242qN1GB94iMXSoBtsSRsBMUR7lgsrsOFreVvc2XtvC66FIyXYKYUXLOcv6UmGSgnpJBjvBhRvWT45LfVXAG+hqARiejDvmORAnsm4Uh4dvkmJNxWxdCux5A6jK5CB4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Topic: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Index: AQHYhkX79rj81mJ150e3nBZ0EA7O6K1bhmuAgAGTuoCAAAWegIAHwJEA
Date: Tue, 28 Jun 2022 13:53:27 +0000
Message-ID: <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
In-Reply-To: <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 95c1cad0-ff16-49f6-9c52-08da590d9914
x-ms-traffictypediagnostic:
	VI1PR08MB3071:EE_|VE1EUR03FT034:EE_|DU0PR08MB7568:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 V3wCnNzfQ6r2OW1IEzRthaJFIE3FqQoK2GgLOD3z/NGRyM+OjgdzJXx5Cb6+QynhlXE0XsIFW44VX4KMLtbNVRnUBOHUrZEwto4l3EeXAzVUZwBVtCVf9BED95XUAvW23CT7NoracU+2YJpePURHLeTTwEd8UWKy0LvD35BUalXMR3zykwb86P2e/h/fLbTS8V3FCRW0wavVQDOJAuwvMIkxMxEUkZ1AaLJQmGzvkc0/kmaGSHQ3Pj+4SenY7FnMD3HnwE3CLBv2LQFe/2Df21uV9sdp+lZ2P6M5sLA/lcoDSnvio2ivWyFDtJCF2uBvpmhpOuB3vbSIOJ1/6VDie+E/G/eJ0SU4x0Yl5aeqbagTrSkNoFExy7+F2lK9qwOeQ5zV2W89zY+BZjkbF93s6yItqGK6lU0oNPTgirlBiPJ8cZaBEvb877kwv3YJrFYYOAflEKvdEdgC9Rjex5qhBCngpQmJvF9rKyXmlKujqXWl+f6VHe11/yIw9sYAj2k8KivIw5/hEEfRd4Jj3hpyKHNblXnjX9fKl0hoT05eeylP7jLt2XfAXrcCt/F0vs3wNDzGcskcbTNnxTaISJERz6G2UOThwNzdAIipp3f511/wSjY0nOED9K05uDzqsyx/XCwYuT/uk+tYmdoNMOgYyWt9mn1jeC5H2C+akduSHOeAEDCSPEXdepJhoAWphDvKtLxLPyLO7tcsiCupmD1KNcF/cha+rJHRfdzdV9LJjECPcVdtxnvrxdwRtm+AmpE7BbFtebVARV3PFn+nmf1KcS762IMZ7QDKYTB9Kc/M6f4jTjslW0Dj0n+bGU0IbzQq65C29LHwvvK0cWN9qG/M9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(36756003)(33656002)(5660300002)(4326008)(6506007)(8936002)(71200400001)(64756008)(6486002)(66446008)(66476007)(2906002)(66556008)(4744005)(316002)(86362001)(122000001)(38100700002)(83380400001)(8676002)(478600001)(66946007)(54906003)(91956017)(186003)(76116006)(6916009)(41300700001)(26005)(2616005)(53546011)(6512007)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE286CE7A8CD3A4D97DC4F9208887917@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d531b075-7e8f-42c7-5e69-08da590d93af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UhYnew4t0hTvbmqSx2aKMpJM7dGHAbtkTY/okwAE8PGMtyv3f18ul3Q6WJsQc/wkRds0UgmMidET19QBxkW84MgTn8A8+bTw7L+/wwXPt3vADO/uO7KzcvCfIVWRbxY8LV46ORbTM7HH97BxIuMS7zzmn23Ur3hWnnovOFCgYiz/R0aYho9cdCVDQi12FSF7CcptxgJ6irnYmmxwkkbXJuyYexck+dxGr5glugMbDwpxPJuHsxsZ+VNBOdCkMggh0hrnpPL1a34oOsP08JIwEu4LdDeOzYUF5P1EcrRmnkN7/sFXL9VvKZzTLVmfFJMWFs+4rTb1l/Ng+e0KOB6JDeb/boI844Qe6+8ognQG/yhTilLyHPhSIAYBzsjMmqKYItnyaB6F3N13otyvtOEaXyyOn9wo94QOqAL86hQdBPcZ2J9oCJoTz6CWt6BEc7IGzK4+nFz2VTBZs2gOuxXe6OyaHqXEWxr53IFVIgEzgBYWSoJ2qLvqmHEiWHHMvBlRP1NwNBASm12cUIGbS2Uzu2y5LDzp30pFQXgqxeIEC9TX4hQIPqOo0xHjN6rQwHvv5WQoGx+Hrl7Bt2+lWUI0jpFD6jOtgpgsM8Da9Att7dJZxqDPAvfS/iZPQqpsNLjHLvVjESEOPtdmk4r80SbfoaTbSfo6OC/0dIzSrlxUJMTyZY/1Pq9MlsertovLYFlfDis4a+sAS1ZuMFb+ujtfzjg/BGbRjXiEjMyTI79cjrrwnbG3ChP/yxCgUTGOH9CtJGSpsV/Hjo9xOKxt/5uVYrSJRrky4AxHlBxT0GMIz5lMzY+4z7Y5nw2ywSJnawg4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(40470700004)(46966006)(36860700001)(8676002)(186003)(47076005)(336012)(5660300002)(83380400001)(33656002)(86362001)(2616005)(82310400005)(70586007)(8936002)(4326008)(40480700001)(70206006)(478600001)(6862004)(41300700001)(356005)(82740400003)(36756003)(6512007)(6506007)(54906003)(6486002)(53546011)(2906002)(40460700003)(26005)(316002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 13:53:36.2964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c1cad0-ff16-49f6-9c52-08da590d9914
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7568

Hi Julien

> On 23 Jun 2022, at 4:30 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 23/06/2022 16:10, Rahul Singh wrote:
>> Hi Julien,
>>> On 22 Jun 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 22/06/2022 15:38, Rahul Singh wrote:
>>>> Guest can request the Xen to close the event channels. Ignore the
>>>> request from guest to close the static channels as static event channe=
ls
>>>> should not be closed.
>>>=20
>>> Why do you want to prevent the guest to close static ports? The problem=
 I can see is...
>> As a static event channel should be available during the lifetime of the=
 guest we want to prevent
>> the guest to close the static ports.
> I don't think it is Xen job to prevent a guest to close a static port. If=
 the guest decide to do it, then it will just break itself and not Xen.

It is okay for the guest to close a port, port is not allocated by the gues=
t in case of a static event channel.=20
Xen has nothing to do for close the static event channel and just return 0.

Regards,
Rahul
 =

