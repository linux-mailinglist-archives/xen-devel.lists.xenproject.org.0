Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72622534CCB
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 11:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337523.562135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuACu-0002BJ-Rk; Thu, 26 May 2022 09:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337523.562135; Thu, 26 May 2022 09:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuACu-00028N-N4; Thu, 26 May 2022 09:55:04 +0000
Received: by outflank-mailman (input) for mailman id 337523;
 Thu, 26 May 2022 09:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paGh=WC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nuACt-00028H-BP
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 09:55:03 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe06::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89a3141-dcd9-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 11:55:01 +0200 (CEST)
Received: from AS8PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:20b:313::25)
 by VI1PR08MB3583.eurprd08.prod.outlook.com (2603:10a6:803:84::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 09:54:59 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::8e) by AS8PR04CA0080.outlook.office365.com
 (2603:10a6:20b:313::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 09:54:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 09:54:58 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Thu, 26 May 2022 09:54:58 +0000
Received: from 9729db715e0e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78A15CF0-13FB-497C-A18D-F5F1CEDEF94C.1; 
 Thu, 26 May 2022 09:54:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9729db715e0e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 May 2022 09:54:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3271.eurprd08.prod.outlook.com (2603:10a6:209:47::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 09:54:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 09:54:49 +0000
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
X-Inumbo-ID: e89a3141-dcd9-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UTnInzmY4CjohdmRkhTcoCmFBLUCnJe6sOji6cHEFXX4jVvnAH2tOz4JYMn/mRdQuXWxsaV/t7oN2g/pXXUI6Y2bI4g7r0sRUuhWhtx6xgL/AmLLpE836fSo2BRZQPxP+snO+LwC5MR4FBsrr8QDA/39TVxV2K2EpJi9vN1+GE0oy7A0VbE80MCwkhm9uEDnlIIBESKcNGpVtGpAHlvdAQpWyX1WqADv7i8Ih+fNxc0mcSdYKc9JEYa/2eHb8h/vYeG6scN36xea8wNPzuihsNcD7Gb685MNsQx4+ikfuQ7kp9oz2inLAnObzz+mNp7DqaY5kuQgNpPS9Xvoi23lXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk+Xz2ZDOYww1LHn7f8Zc2Tquf5nZ/LkVCi1pMSo9QA=;
 b=B/ZODfXYO8WKyeQ8EgnMCoqIOYY3RSrheryrW3XzC35r/rQiiDU0ovntPF/GR30B6btliPShvDUmhkGBGCMz5S7XoeiiWzJUvXxZhYGuIbq9NbMIYFZcf1VSWE/XlA33YtPX5Y64AtTx8VfDBgGCuEYHNhpdenayLrq0iTRoZfPkfAydGASxJRveiYyRG1EimTwAhXOfu4LJbztaqVQhz7T5rXBLrnB6vTMuUW3KZHjyEstqsBy0P3Z7HEnNB7EJ8j/d9Bc9OskxUmUju0lZu+lVvRBj4VOArPV/jhPk/4WtpUMi0EkTJvUSSJUj11AR6nPwDXpha7amR6jkPdu4NQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk+Xz2ZDOYww1LHn7f8Zc2Tquf5nZ/LkVCi1pMSo9QA=;
 b=hM5oQQH5UwWbk8N567S65tAYul78WpJzHbQl65PdN3oaR/9aulLU12wOejsYBnZLGZb1NKOrlJ7Cz3GpAEbiBplZFBPQ69QA1oRQB/rWmt7Qa3FRakXpCrAeMhA9XZ7D3vsmjRZUyplhQ9aM68d/dp5QRPoR4WSd62sGlgf3nXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c170fa962041cf3a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3JTltLb9N0zSlCQ8UrlC6L1ljMJJ0lZ9RCdKv7idBRaUZO/ZfSkEPD6XMQ2dWFZXz6Sa2hvOAzksOZrd+5z6omzhcg2HMpLCK73Bxhca+mI3JFQsAt79v0NvCTsrLhGHASrOp9f3N39FetKC4O6j7VM+pxryzYywoV69KrBSRPAPsdHdx9N8B9gB06lG7h9ZUwfcyhZSynjjvoo7Ffec3wXxJZaTIqw+eSXmlJxBOhRe++eq2VoBrihrtblsJ8FZBXNJfnoq96lzwJyNCjJF26MWl/s3R7AbpOn42lH1iGXnRFzzFw4cbnIzrhVPfhiitypTx87bABCnB1ELafhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk+Xz2ZDOYww1LHn7f8Zc2Tquf5nZ/LkVCi1pMSo9QA=;
 b=MmF84hpXWL1M1qVy+0lGNhkJt35xF+acP+IU1wTMdBmaqN2cfbnlGcMV+EUCzAw/URyeSFmAb/EfEaM9/uMC8Fea740zEAWEhMR3r5z8uqoymbaTcPLK5GEa+0YPO+rWcbAb+T7bHOOuGSZw0azBHvlneyyZ2p/DkXYcNfPXGKP91jRmKwYRHJtR3qw2o0QWR/8rUFJAA+Xj6PgDWJWo0wiyijs4WtmRT7v0kGgmhppWCRJi7Kk4JzA3TnVn2lpWjYcGHcDudTAbqNkvdKWeYVahYWYLUR2LNElWR/6p9JvaUs4nxijYz3CxOj5b66AtOyQX/U1kEvQJmPeHahtuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk+Xz2ZDOYww1LHn7f8Zc2Tquf5nZ/LkVCi1pMSo9QA=;
 b=hM5oQQH5UwWbk8N567S65tAYul78WpJzHbQl65PdN3oaR/9aulLU12wOejsYBnZLGZb1NKOrlJ7Cz3GpAEbiBplZFBPQ69QA1oRQB/rWmt7Qa3FRakXpCrAeMhA9XZ7D3vsmjRZUyplhQ9aM68d/dp5QRPoR4WSd62sGlgf3nXA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Topic: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Index: AQHYb89Ql1y5oYxB8EW1dQIiqL2u/a0vNXYAgAEjhQCAAJGbAIAAAxAA
Date: Thu, 26 May 2022 09:54:49 +0000
Message-ID: <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
In-Reply-To: <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5b36d0be-6193-4988-0821-08da3efdcb86
x-ms-traffictypediagnostic:
	AM6PR08MB3271:EE_|AM5EUR03FT056:EE_|VI1PR08MB3583:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB35831C72C1F2CA8F9AEE6A189DD99@VI1PR08MB3583.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bfRbJyyQCHO94fjw4JxwWyodWkTcpNKRU6SLjIHIghvYx0zZfJsj+NrHDlUomzQK0kbC6gUa3AnL8UUOsxBQZNs0qLsRkQUYqY7e35GoNAlKTd+W9YVQMe3F0D/onnveziHPzb7yF1cEkskDLLww2DUTQOy5pxr1ffdWRNpVKQvOsEP2MJj6OrVu6q5iDcsje5TEJShQ5YVtUiwAEyyqzLO9uSB1LqTd+17S6hx/WFZg7ng/vxHDjLe8UCgGeQCpaGpQv2hMYRs3k4/Ef03wTWCWwYxxbFpPhUDYc6dvZRUaJ1nSC6p0RbfAVBqdOpZWwbgxrA3RMGMEUmle1Keo8zAHz99HNRQWe42lucgI21w3vYDmZBrbFQftNaTYtXn3wbboLiMa9NSpF8nOfExQtllFqXMIshiUmCr7Ho2qvxf+BWDwsQAJZcktuBmdHA12/schyN+UMOin0ywL4AVaxTB5SyC2VtobE3rKUSX8sdt+1UHbXi5wgsx6s39FGuiHXQQ1WLtY0VOc3dvb3XcmWAVG7dUnZ2BESmZoVWmbkHo68LI8jBDQCd97cMM5LJPii/xpLKIo+LIAXKbQXQzGo2LD1XD4pd6Bh0s3Ak7c7B8B/u8sn6zL9W8ZqyPyNNiYjYMTdbB0WyzCg3jUugu8CpDUJ4iLv7r06u9zXkGgBJ9hmayEryXDIadkYfc8IbA/lCd00h4RUQIStNTnbpw6EG9mZVNa5R6Soey7f2yo8s5gsZWQu3/fP/NdvasPcWVsM/xxshX3U+HJE6TFScFQoSb3d44Dehf4050pHG0lvmhF6LNCU3CpdR1PwwlF8Rt9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6486002)(316002)(86362001)(508600001)(91956017)(76116006)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(6916009)(38070700005)(71200400001)(122000001)(8676002)(186003)(966005)(6512007)(38100700002)(53546011)(26005)(6506007)(2616005)(2906002)(33656002)(8936002)(5660300002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <03650940D99F4F43A3FC178EB2ED9056@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3271
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	307d03bd-5a42-4207-cbea-08da3efdc5b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SuIzghKQkbCwJ4snOOejSbK5KN63Z5Kax2YWot7HZrCS2zsd8NgeoY7c5hVCSf1geQR2zIDiTKt94bs7xxGi6jpNk7Rmq1RZ75mMlDVtB3SmfLbG0xUKfYUvkPAPzXBjTe+vK+hBe5jr/wNUXiXWZyz9zjtqNsj9w6hUYSAvmGPtVUQXKj4FMGdOgQbE42aoE16cylTt1HFggUPNPAOcEK0RBoh9uRcRsavYf5/D/5DorTsCq9p/u/vx4GJSTTOtWsn5xFDP9i4C+nnB5c7Yia7edIE/2FTYG87FZdv4w7inU0D/LC8DBT4ITzCPXbWbt6YrrzVJpMPa6NjeAPpGcNBpsfy04O9nqGZCAURBOygY0d8KjvzkQhbZxrkSCYOjVbdVgf6ypye+B9J7pVA4aNnuIkXWVfWw7lcYiIAckV1W1qPX6zXcAHSoQySuMDs9q926wZqOW8k6t6AmBVU3TdcUTpW9+szwXck/CvKiHVZCSMKXyKeUo7pCeAya+CxwRbtbrgNXEMd9lIOy5KdVPgv06reqmM+7iECLavErB4CYGGulkkY2fvQl153dKoYmZgdB547v5JRTOuZmH4pzbMK6v1rs3uZ9rjdzBiK7oZnK2zgsHUE/xZjIUxv6jkoarsu3vpTHZqSSK52XJ9pWbjfjeKN+X4pQAC3F01ZIYOKlU52t4kcc/H9PHv6ldpg32gQhCXfHFidMKCfaQ28rm8/i7AhoZxSkqhLl5Gb+K7AF3fC03ZB91a5F68Wn7JQPE8uSO4QScJ70RR95AdFjHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(5660300002)(40460700003)(81166007)(8936002)(356005)(53546011)(6506007)(8676002)(2616005)(316002)(54906003)(82310400005)(6512007)(186003)(6486002)(966005)(508600001)(36860700001)(70586007)(70206006)(336012)(4326008)(47076005)(6862004)(36756003)(33656002)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 09:54:58.7928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b36d0be-6193-4988-0821-08da3efdcb86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3583

SGkgSmFuLA0KDQo+IE9uIDI2IE1heSAyMDIyLCBhdCAxMDo0MywgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI2LjA1LjIwMjIgMDM6MDIsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIFdlZCwgMjUgTWF5IDIwMjIsIEp1bGllbiBHcmFsbCB3
cm90ZToNCj4+PiBPbiAyNS8wNS8yMDIyIDAxOjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
DQo+Pj4+ICstIFJ1bGU6IERpciA0LjcNCj4+Pj4gKyAtIFNldmVyaXR5OiBSZXF1aXJlZA0KPj4+
PiArIC0gU3VtbWFyeTogSWYgYSBmdW5jdGlvbiByZXR1cm5zIGVycm9yIGluZm9ybWF0aW9uIHRo
ZW4gdGhhdCBlcnJvcg0KPj4+PiBpbmZvcm1hdGlvbiBzaGFsbCBiZSB0ZXN0ZWQNCj4+Pj4gKyAt
IExpbms6DQo+Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMtMjAx
Mi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0ZXIvRF8wNF8wNy5jDQo+Pj4gDQo+Pj4gDQo+Pj4g
Li4uIHRoaXMgb25lLiBXZSBhcmUgdXNpbmcgKHZvaWQpICsgYSBjb21tZW50IHdoZW4gdGhlIHJl
dHVybiBpcyBpZ25vcmVkIG9uDQo+Pj4gcHVycG9zZS4gVGhpcyBpcyB0ZWNobmljYWxseSBub3Qt
Y29tcGxpYW50IHdpdGggTUlTUkEgYnV0IHRoZSBiZXN0IHdlIGNhbiBkbw0KPj4+IGluIHNvbWUg
c2l0dWF0aW9uLg0KPj4+IA0KPj4+IFdpdGggeW91ciBwcm9wb3NlZCB3b3JkaW5nLCB3ZSB3b3Vs
ZCB0ZWNobmljYWxseSBoYXZlIHRvIHJlbW92ZSB0aGVtIChvciBub3QNCj4+PiBpbnRyb2R1Y2Ug
bmV3IG9uZSkuIFNvIEkgdGhpbmsgd2UgbmVlZCB0byBkb2N1bWVudCB0aGF0IHdlIGFyZSBhbGxv
d2luZw0KPj4+IGRldmlhdGlvbnMgc28gbG9uZyB0aGV5IGFyZSBjb21tZW50ZWQuDQo+PiANCj4+
IEFic29sdXRlbHkgeWVzLiBBbGwgb2YgdGhlc2UgcnVsZXMgY2FuIGhhdmUgZGV2aWF0aW9ucyBh
cyBsb25nIGFzIHRoZXkNCj4+IG1ha2Ugc2Vuc2UgYW5kIHRoZXkgYXJlIGNvbW1lbnRlZC4gTm90
ZSB0aGF0IHdlIHN0aWxsIGhhdmUgdG8gd29yayBvdXQNCj4+IGEgZ29vZCB0YWdnaW5nIHN5c3Rl
bSBzbyB0aGF0IEVDTEFJUiBhbmQgY3BwY2hlY2sgY2FuIHJlY29nbml6ZSB0aGUNCj4+IGRldmlh
dGlvbnMgYXV0b21hdGljYWxseSBidXQgZm9yIG5vdyBzYXlpbmcgdGhhdCB0aGV5IG5lZWQgdG8g
YmUNCj4+IGNvbW1lbnRlZCBpcyBzdWZmaWNpZW50IEkgdGhpbmsuDQo+PiANCj4+IFNvIEknbGwg
YWRkIHRoZSBmb2xsb3dpbmcgb24gdG9wIG9mIHRoZSBmaWxlOg0KPj4gDQo+PiAiIiINCj4+IEl0
IGlzIHBvc3NpYmxlIHRoYXQgaW4gc3BlY2lmaWMgY2lyY3Vtc3RhbmNlcyBpdCBpcyBiZXN0IG5v
dCB0byBmb2xsb3cgYQ0KPj4gcnVsZSBiZWNhdXNlIGl0IGlzIG5vdCBwb3NzaWJsZSBvciBiZWNh
dXNlIHRoZSBhbHRlcm5hdGl2ZSBsZWFkcyB0bw0KPj4gYmV0dGVyIGNvZGUgcXVhbGl0eS4gVGhv
c2UgY2FzZXMgYXJlIGNhbGxlZCAiZGV2aWF0aW9ucyIuIFRoZXkgYXJlDQo+PiBwZXJtaXNzaWJs
ZSBhcyBsb25nIGFzIHRoZXkgYXJlIGRvY3VtZW50ZWQgd2l0aCBhbiBpbi1jb2RlIGNvbW1lbnQu
DQo+PiAiIiINCj4gDQo+IEhtbSwgc28geW91IHJlYWxseSBtZWFuIGluLWNvZGUgY29tbWVudHMu
IEkgZG9uJ3QgdGhpbmsgdGhpcyB3aWxsIHNjYWxlDQo+IHdlbGwgKHNlZSBlLmcuIHRoZSBEQ0Ug
cmVsYXRlZCBpbnRlbmRlZCBkZXZpYXRpb24pLCBhbmQgaXQgYWxzbyBnb2VzDQo+IGFnYWluc3Qg
dGhlICJubyBzcGVjaWFsIGNhc2luZyBmb3IgZXZlcnkgc3RhdGljIGFuYWx5c2lzIHRvb2wiIGNv
bmNlcm4NCj4gSSBkaWQgdm9pY2Ugb24gdGhlIGNhbGwuDQoNCk9uIHRoaXMgc3ViamVjdCB0aGUg
aWRlYSB3YXMgbW9yZSB0byBkZWZpbmUgYSDigJx4ZW7igJ0gd2F5IHRvIGRvY3VtZW50DQpkZXZp
YXRpb25zIGluIHRoZSBjb2RlIGFuZCBkbyBpdCBpbiBhIHdheSBzbyB0aGF0IHdlIGNvdWxkIGVh
c2lseSBzdWJzdGl0dXRlDQp0aGUg4oCcZmxhZ+KAnSB0byBhZGFwdCBpdCBmb3IgZWFjaCBhbmFs
eXNlciB1c2luZyB0b29scyBvciBjb21tYW5kIGxpbmUgb3B0aW9ucy4NCg0KQmVydHJhbmQNCg0K
PiANCj4gSmFuDQoNCg==

