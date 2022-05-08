Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426D451EB38
	for <lists+xen-devel@lfdr.de>; Sun,  8 May 2022 05:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323857.545750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnXNA-0005Sb-1a; Sun, 08 May 2022 03:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323857.545750; Sun, 08 May 2022 03:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnXN9-0005PD-QK; Sun, 08 May 2022 03:14:15 +0000
Received: by outflank-mailman (input) for mailman id 323857;
 Sun, 08 May 2022 03:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yNf5=VQ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nnXN8-0005P7-EK
 for xen-devel@lists.xenproject.org; Sun, 08 May 2022 03:14:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecf9fc5b-ce7c-11ec-8fc4-03012f2f19d4;
 Sun, 08 May 2022 05:14:09 +0200 (CEST)
Received: from AS9PR05CA0044.eurprd05.prod.outlook.com (2603:10a6:20b:489::34)
 by DB6PR0802MB2565.eurprd08.prod.outlook.com (2603:10a6:4:a1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sun, 8 May
 2022 03:14:05 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::77) by AS9PR05CA0044.outlook.office365.com
 (2603:10a6:20b:489::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Sun, 8 May 2022 03:14:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Sun, 8 May 2022 03:14:05 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Sun, 08 May 2022 03:14:04 +0000
Received: from e0797aeb21f5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84E6AC0C-E63D-4A2E-8C00-167B8754F84E.1; 
 Sun, 08 May 2022 03:13:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0797aeb21f5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 08 May 2022 03:13:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB5286.eurprd08.prod.outlook.com (2603:10a6:20b:aa::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Sun, 8 May
 2022 03:13:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5227.018; Sun, 8 May 2022
 03:13:51 +0000
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
X-Inumbo-ID: ecf9fc5b-ce7c-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GBVnmS/90LOPq7ZEXRb7/aUXpCRlPW5X2R/qSyQzVWcrZ+vPtc8eB7TR1LZk35glpyV39uas08rFRqS6JRf5LEhVnkboMg4Kg/39iN/45hOSyKP4+LeKAYAzFtzTKN6MDuFlYTCA2JxxD46M4G6zXJn2PSYxvyT+R9PTTabER/jq+Jas18x4fCgVoH663qco2IEiZfLt0vh5BbU9YTH2UK7/lPM6na7MxEvctIdBH+3+eb4am81HmWpDQKE0PkScr4z9jBtxPzCikndifg/UHbYWG+zOh5J7rH4IFmZ44Yca5RwL3Gh9ChbDPp0xcPD554Dakn06kfxBk0PXC122Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYyamzAjjg8kElrjSX/zthgqFQnzQRvH1by5BqKiDWE=;
 b=gZ3MD2p8IR4/HqVU5vtkzDhHwZ00TWGmNqKrMzRytNlO9LOBfpH7plzW4HiXRjWAx6nuRqW5J/wC5T5ytm1QXd0bNfPw3copMI11GPBvgDkT+1ceygVb7OMrjEt0WyRAL8s+KOTaAZWbc6pg9DkXn/Ej+av7J0HoGmNSDAR5Lbn1kcOI/0YYvsIEOQIEs30lmnzUQOlxuHCRMn+DK9CY6odqW1II3WvrlvmjFZo6OMXD4ll0aR2onqMQJFoyuUkqxDRWQCuR+BVsok//xUYAT43kfggLGogZc6oRCgRcboaJObA9wevrhQTiQV1I0tdz0/DmTVZL7B4UbV8jg8pLFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYyamzAjjg8kElrjSX/zthgqFQnzQRvH1by5BqKiDWE=;
 b=lKJS/2/ThttQ5ixZxnXXQZFi6U0IqhsIVrva0PYiptM4pxfkBoMXMAr0ZhJOWpXvSoxAocY9i81RP3pTjZZ5cn1WZjPBrP7WVQLL042MfiP5i/PrK8dIw2ItrR0GDsqRpZcZ3sVcIEyF3Z/9VcaPd0lV9FZ4sB9cVK9qeQ5kgbU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+RmFIBsJMDnnZ4/ctK02bISdoWH4ykbHqURuvkVE0JPkIHQG61NvtaEdoyhxt3XJlo8TWVnRUYuD8rjm5sU6QG9F3TRvwvBt04rcrTr0AOdzKlWAXOcf2W2McQElURvlHZVgASKvp/xXrGaiOGxTfGb/lJbQMcVcBK1tMNpg1rqjHvr02SBVofdxUzMwulrcH2/bxmVsogSHSir/yuO2rEeTuncX/YqJqweQIWg1d6C0BFDUjiGkO3yarwF9Jzy4Oo71wwsqtbQZMM4XKjyGTWKlSHLqTrZvm+Dxn4an18YwmSx+AkCvCpHr0Hect6EsdsDPHjVCreu6FVowt1hXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYyamzAjjg8kElrjSX/zthgqFQnzQRvH1by5BqKiDWE=;
 b=e0oyi1CmIBU58kQEsN5omcHbcHy0hnFaJjff6POAqc0ZusS4L0bC/2lu3enJcQliWlFNaGK3rTp4vd+QXKFzlYOqtdVXbmLGStM05mF3l+wEPul9N+nH7GZatltbAdsKLjHg8DEt3sZny7JMr7Hg4dCmkNTPFX61N99EFpqETUUoUcVzIEn50toEjsG441weK3QQ0xaSgFv6MXZtxSR5x4gsGGwNf7wc/HtWkhP7d8qGqsrpzzUUKOOBI2vSbE/smLM45EmV03s6GLBjeA3KF8VvC5Ip5iGLQMxegtdaBzThFa1QXY4UpTVpk/oWQ074jMxXYXJmUHCTgSHim/U8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYyamzAjjg8kElrjSX/zthgqFQnzQRvH1by5BqKiDWE=;
 b=lKJS/2/ThttQ5ixZxnXXQZFi6U0IqhsIVrva0PYiptM4pxfkBoMXMAr0ZhJOWpXvSoxAocY9i81RP3pTjZZ5cn1WZjPBrP7WVQLL042MfiP5i/PrK8dIw2ItrR0GDsqRpZcZ3sVcIEyF3Z/9VcaPd0lV9FZ4sB9cVK9qeQ5kgbU=
From: Wei Chen <Wei.Chen@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>
Subject: Proposal for Porting Xen to Armv8-R64 - DraftC (Archive for Day1)
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftC (Archive for
 Day1)
Thread-Index: AdhiiZ/pFQ8D6hDLSDWFvMIljUxbzQ==
Date: Sun, 8 May 2022 03:13:50 +0000
Message-ID:
 <PAXPR08MB7420E5D885238BFBC00764E09EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1C29708CE76EC841B3AF97F6355EFF17.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 46059300-1f0b-4eaa-8b0f-08da30a0cf02
x-ms-traffictypediagnostic:
	AM6PR08MB5286:EE_|AM5EUR03FT009:EE_|DB6PR0802MB2565:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB256535DFC755314E6306E2B89EC79@DB6PR0802MB2565.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +rLZxwyj4TmjS5lhQ40GGnA8Fn85KqDgzGj8flOLH76EafRUlB8YrO15ruiIkVlrCkxEhzTDR9FPiF4EZMl2enem5XTcE3xXKWeM+ARTIuBaKYXz/LoqtZ2pOjPyWN1nVAUpl7UaetbiVzFp6UFB/XFS6VaO7nsVe2V73qjBPTfQIPofWzq5mr15TUoA8p1Nday/XEiDO8nt2uSLDVl9ZH07WnJzBjwE4QkkjGV/wxWnRxUlfaeTsG0zIX/1rgGHd7U2H6EBZQeVTf6ZybMwTN63UqKNOvXjGvUaHLflT09QXuAAlXmC3aIiO5t6KJy04CMdYWNXDnc1gG1cXvv7LgUAmZzTpBn0DaA4fLNtFbdE/Bsi6yZg+BhWiAqpTcY8+qBhSN9P5LcGX2YrdCmVM9Qo3hLXADkIfMEvJK0t+uUCU0veapVpeqSxn413tTpeFTWITzD2ztuqaM3i1GtNw4C/+G6GCO36iKZxzs+2UA4Q58dnfFA8VVJS03gJSo07h+erHIDT6WXVZquq9Eqla9SF+JBd4H6G0DUVvhfbTl8oJkLblS4Lz6Zhr0iBmp2JSgk7+KpGLuoF9pegYTpq1KpopzpeytLDvDHLSqCEVmz+cavyqaWgTdOzLYk0TH7gLPi12TVNxhfkqX9/Wb1P5u3wcon9+bkv92us0v+TT2UoCHdSDbeYffKNcozUyrgiBCaCVcDL2IGdh/z66iOwg2Y50F/VoohlSL1LxqYvZhWFp9TEcoZSSMr8AKmGuwfgnhIVAdiuUYgytfODQVxD8tpcEx3j0p9fhHEV80JtMC3iMN4btQCucc4VuM5nZYY7W4ew0QA/owfgcrYPRy2WqJldfhyE6EBkaNj9K3oBjm4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(33656002)(5660300002)(30864003)(64756008)(6506007)(55016003)(71200400001)(7696005)(66476007)(8676002)(52536014)(26005)(9686003)(83380400001)(66446008)(54906003)(2906002)(186003)(66946007)(122000001)(110136005)(66556008)(4326008)(38100700002)(38070700005)(76116006)(316002)(86362001)(508600001)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53829009-87a4-4486-e168-08da30a0c66f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PsBaus80GEQG8at5uZuAA01A/YQPQ6/I0IaVt1zq1yn5LuCvxtNO1OKruqEy9sYuEROcSmB/1AIXJNsqKg5BktY6ADmXOprxVWLHm173Qx7rTaNGweb+T7QXAbqWleBIbGYx6CQVH927SLDIhpIBSlLAV9IGPRijCSOIZ2/Dp5Aish2Gf+D7PJAttSgkmZMFzZCpsa64yU6d02buy4qUCdhuIa2i2JQ5ktg4HqWwmbO33NAVvi/04ZPjH/2bntBnWNVilhwQkhxIWqpqJwf/z9cuUHI6GbEMl0dypAm/6B4ZqLDOEXkKCy1mZDi24Ef1ofR8fYMDAHQhObRfPoXINMkUSbG4rND9oX1v2tIssXsBAacFevgxj+1BnaZRtigWbS7fADRMpAiRiykBexjvlu3vOi8wgyw7IUQdT2HIhvaqQSYWTfOf5aeN+kJBbqBCaztDcga9ccqaUyTcY5LsPtjZR+99IlYlsvK8qx5z0uK0I0zFdWniewwIGqBMHL3zWX1DPddfwgkbO4MnJtoe6788mAyqdaTGNKe0s9ItvM3l0YSWSiUbiFbRuC71iQ1LM4v9Tw3TVoUKIX43QCrpMWX6QPiBrj/LPjkq3WSlys8f9/w5o9jovCmDPMh+FyDHHG+Jj3a40iaeFu13wa8GATSlmMyDGbByg3lrjaxpvoQKEO/tLrHcca0MtM1yOiu59ki7pCYWKbwUElSS7QcQ0WO1q8RUqbQGh1iv9iJnN0xlyEhhWXg/thPhTahRK1T8NirvCRFNt8utojhslp/rItH5y3m/BgY40aTyavaHBRc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(8676002)(70206006)(70586007)(2906002)(110136005)(55016003)(5660300002)(7696005)(30864003)(9686003)(33656002)(4326008)(52536014)(8936002)(26005)(356005)(36860700001)(83380400001)(508600001)(6506007)(54906003)(86362001)(316002)(336012)(82310400005)(47076005)(81166007)(186003)(21314003)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2022 03:14:05.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46059300-1f0b-4eaa-8b0f-08da30a0cf02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2565

# Proposal for Porting Xen to Armv8-R64

(Update to Draft-C as a discussion archive for Day1 patches)

This proposal will introduce the PoC work of porting Xen to Armv8-R64,
which includes:
- The changes of current Xen capability, like Xen build system, memory
  management, domain management, vCPU context switch.
- The expanded Xen capability, like static-allocation and direct-map.

***Notes:***
1. ***This proposal only covers the work of porting Xen to Armv8-R64***
   ***single CPU.Xen SMP support on Armv8-R64 relates to Armv8-R***
   ***Trusted-Frimware (TF-R). This is an external dependency,***
   ***so we think the discussion of Xen SMP support on Armv8-R64***
   ***should be started when single-CPU support is complete.***
2. ***This proposal will not touch xen-tools. In current stange,***
   ***Xen on Armv8-R64 only support dom0less, all guests should***
   ***be booted from device tree.***

## Changelogs
Draft-B -> Draft-C:
1. Update the event-channel support section to use runtime
   MPU mapping instead of whole MPU context switch.
2. Split two stages for Armv8-R64 Xen start address solution.
3. Remove "malicious tools".
4. Remove GCC version bump.

Draft-A -> Draft-B:
1. Update Kconfig options usage.
2. Update the section for XEN_START_ADDRESS.
3. Add description of MPU initialization before parsing device tree.
4. Remove CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS.
5. Update the description of ioremap_nocache/cache.
6. Update about the free_init_memory on Armv8-R.
7. Describe why we need to switch the MPU configuration later.
8. Add alternative proposal in TODO.
9. Add use tool to generate Xen Armv8-R device tree in TODO.
10. Add Xen PIC/PIE discussion in TODO.
11. Add Xen event channel support in TODO.

## Contributors:
Wei Chen <Wei.Chen@arm.com>
Penny Zheng <Penny.Zheng@arm.com>

## 1. Essential Background

### 1.1. Armv8-R64 Profile
The Armv-R architecture profile was designed to support use cases that
have a high sensitivity to deterministic execution. (e.g. Fuel Injection,
Brake control, Drive trains, Motor control etc)

Arm announced Armv8-R in 2013, it is the latest generation Arm architecture
targeted at the Real-time profile. It introduces virtualization at the high=
est
security level while retaining the Protected Memory System Architecture (PM=
SA)
based on a Memory Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.

- The latest Armv8-R64 document can be found here:
  [Arm Architecture Reference Manual Supplement - Armv8, for Armv8-R AArch6=
4 architecture profile](https://developer.arm.com/documentation/ddi0600/lat=
est/).

- Armv-R Architecture progression:
  Armv7-R -> Armv8-R AArch32 -> Armv8 AArch64
  The following figure is a simple comparison of "R" processors based on
  different Armv-R Architectures.
  ![image](https://drive.google.com/uc?export=3Dview&id=3D1nE5RAXaX8zY2KPZ8=
imBpbvIr2eqBguEB)

- The Armv8-R architecture evolved additional features on top of Armv7-R:
    - An exception model that is compatible with the Armv8-A model
    - Virtualization with support for guest operating systems
        - PMSA virtualization using MPUs In EL2.
- The new features of Armv8-R64 architecture
    - Adds support for the 64-bit A64 instruction set, previously Armv8-R
      only supported A32.
    - Supports up to 48-bit physical addressing, previously up to 32-bit
      addressing was supported.
    - Optional Arm Neon technology and Advanced SIMD
    - Supports three Exception Levels (ELs)
        - Secure EL2 - The Highest Privilege, MPU only, for firmware, hyper=
visor
        - Secure EL1 - RichOS (MMU) or RTOS (MPU)
        - Secure EL0 - Application Workloads
    - Optionally supports Virtual Memory System Architecture at S-EL1/S-EL0=
.
      This means it's possible to run rich OS kernels - like Linux - either
      bare-metal or as a guest.
- Differences with the Armv8-A AArch64 architecture
    - Supports only a single Security state - Secure. There is not Non-Secu=
re
      execution state supported.
    - EL3 is not supported, EL2 is mandatory. This means secure EL2 is the
      highest EL.
    - Supports the A64 ISA instruction
        - With a small set of well-defined differences
    - Provides a PMSA (Protected Memory System Architecture) based
      virtualization model.
        - As opposed to Armv8-A AArch64's VMSA based Virtualization
        - Can support address bits up to 52 if FEAT_LPA is enabled,
          otherwise 48 bits.
        - Determines the access permissions and memory attributes of
          the target PA.
        - Can implement PMSAv8-64 at EL1 and EL2
            - Address translation flat-maps the VA to the PA for EL2 Stage =
1.
            - Address translation flat-maps the VA to the PA for EL1 Stage =
1.
            - Address translation flat-maps the IPA to the PA for EL1 Stage=
 2.
    - PMSA in EL1 & EL2 is configurable, VMSA in EL1 is configurable.

### 1.2. Xen Challenges with PMSA Virtualization
Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to run
with an MPU and host multiple guest OSes.

- No MMU at EL2:
    - No EL2 Stage 1 address translation
        - Xen provides fixed ARM64 virtual memory layout as basis of EL2
          stage 1 address translation, which is not applicable on MPU syste=
m,
          where there is no virtual addressing. As a result, any operation
          involving transition from PA to VA, like ioremap, needs modificat=
ion
          on MPU system.
    - Xen's run-time addresses are the same as the link time addresses.
        - Enable PIC/PIE (position-independent code) on a real-time target
          processor probably very rare. Further discussion in 2.1 and TODO
          sections.
    - Xen will need to use the EL2 MPU memory region descriptors to manage
      access permissions and attributes for accesses made by VMs at EL1/0.
        - Xen currently relies on MMU EL1 stage 2 table to manage these
          accesses.
- No MMU Stage 2 translation at EL1:
    - A guest doesn't have an independent guest physical address space
    - A guest can not reuse the current Intermediate Physical Address
      memory layout
    - A guest uses physical addresses to access memory and devices
    - The MPU at EL2 manages EL1 stage 2 access permissions and attributes
- There are a limited number of MPU protection regions at both EL2 and EL1:
    - Architecturally, the maximum number of protection regions is 256,
      typical implementations have 32.
    - By contrast, Xen does not need to consider the number of page table
      entries in theory when using MMU.
- The MPU protection regions at EL2 need to be shared between the hyperviso=
r
  and the guest stage 2.
    - Requires careful consideration - may impact feature 'fullness' of bot=
h
      the hypervisor and the guest
    - By contrast, when using MMU, Xen has standalone P2M table for guest
      stage 2 accesses.

## 2. Proposed changes of Xen
### **2.1. Changes of build system:**

- ***Introduce new Kconfig options for Armv8-R64***:
  Unlike Armv8-A, because lack of MMU support on Armv8-R64, we may not
  expect one Xen binary to run on all machines. Xen images are not common
  across Armv8-R64 platforms. Xen must be re-built for different Armv8-R64
  platforms. Because these platforms may have different memory layout and
  link address.
    - `ARM64_V8R`:
      This option enables Armv8-R profile for Arm64. Enabling this option
      results in selecting MPU. This Kconfig option is used to gate some
      Armv8-R64 specific code except MPU code, like some code for Armv8-R64
      only system ID registers access.

    - `ARM_MPU`
      This option enables MPU on Armv8-R architecture. Enabling this option
      results in disabling MMU. This Kconfig option is used to gate some
      ARM_MPU specific code. Once when this Kconfig option has been enabled=
,
      the MMU relate code will not be built for Armv8-R64. The reason why
      not depends on runtime detection to select MMU or MPU is that, we don=
't
      think we can use one image for both Armv8-R64 and Armv8-A64. Another
      reason that we separate MPU and V8R in provision to allow to support =
MPU
      on 32bit Arm one day.

  ***Try to use `if ( IS_ENABLED(CONFIG_ARMXXXX) )` instead of spreading***
  ***`#ifdef CONFIG_ARMXXXX` everywhere, if it is possible.***

- ***About Xen start address for Armv8-R64***:
  On Armv8-A, Xen has a fixed virtual start address (link address too) on a=
ll
  Armv8-A platforms. In an MMU based system, Xen can map its loaded address
  to this virtual start address. On Armv8-A platforms, the Xen start addres=
s
  does not need to be configurable. But on Armv8-R platforms, they don't ha=
ve
  MMU to map loaded address to a fixed virtual address. And different platf=
orms
  will have very different address space layout, so it's impossible for Xen=
 to
  specify a fixed physical address for all Armv8-R platforms' start address=
.

  - Stage 1, introduce `XEN_START_ADDRESS`
    This option allows to set the custom address at which Xen will be
    linked. This address must be aligned to a page size. Xen's run-time
    addresses are the same as the link time addresses.
    ***Notes: Fixed link address means the Xen binary could not be***
    ***relocated by EFI loader. So in current stage, Xen could not***
    ***be launched as an EFI application on Armv8-R64.(TODO#3.3)***

    - Provided by platform files.
      We can reuse the existed arm/platforms store platform specific files.
      And `XEN_START_ADDRESS` is one kind of platform specific information.
      So we can use platform file to define default `XEN_START_ADDRESS` for
      each platform.

    - Provided by Kconfig.
      This option can be a supplymental option. Users can define a customiz=
ed
      `XEN_START_ADDRESS` to override the default value in platform's file.

  - Stage 2, generated `XEN_START_ADDRESS` from device tree by build script=
s
      Vendors who want to enable Xen on their Armv8-R platforms, they can
      use some tools/scripts to parse their boards device tree to generate
      the basic platform information, like `XEN_START_ADDRESS`. These
      tools/scripts do not necessarily need to be integrated in Xen, but Xe=
n
      can give some recommended configuration. For example, Xen can recomme=
nd
      Armv8-R platforms to use lowest ram start address + 2MB as the defaul=
t
      Xen start address. The generated platform files can be placed to
      arm/platforms for maintenance.

- ***About MPU initialization before parsing device tree***:
      Before Xen can start parsing information from device tree and use
      this information to setup MPU, Xen need an initial MPU state. This
      is because:
      1. More deterministic: Arm MPU supports background regions, if we
         don't configure the MPU regions and don't enable MPU. The default
         MPU background attributes will take effect. The default background
         attributes are `IMPLEMENTATION DEFINED`. That means all RAM region=
s
         may be configured to device memory and RWX. Random values in RAM o=
r
         maliciously embedded data can be exploited.
      2. More compatible: On some Armv8-R64 platforms, if MPU is disabled,
         the `dc zva` instruction will make the system halt (This is one
         side effect of MPU background attributes, the RAM has been configu=
red
         as device memory). And this instruction will be embedded in some
         built-in functions, like `memory set`. If we use `-ddont_use_dc` t=
o
         rebuild GCC, the built-in functions will not contain `dc zva`.
         However, it is obviously unlikely that we will be able to recompil=
e
         all GCC for ARMv8-R64.

    - Stage 1, reuse `XEN_START_ADDRESS`
      In the very beginning of Xen boot, Xen just need to cover a limited
      memory range and very few devices (actually only UART device). So we
      can use two MPU regions to map:
      1. `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` or.
         `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_size`as
         normal memory.
      2. `UART` MMIO region base to `UART` MMIO region end to device memory=
.
      These two are enough to support Xen run in boot time. And we don't ne=
ed
      to provide additional platform information for initial normal memory
      and device memory regions. In current PoC we have used this option
      for implementation, and it's the same as Armv8-A.

    - Stage 2, generate information for initial MPU state from device tree
      Introduce some macros to allow users to set initial normal
      memory regions:
      `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
      and device memory:
      `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
      These macros are the same platform specific information as
      `XEN_START_ADDRESS`, so the script of generating `XEN_START_ADDRESS`
      also can be applied to these macros.

- ***Define new system registers for compiliers***:
  Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
  specific system registers. As Armv8-R64 only have secure state, so
  at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
  first GCC version that supports Armv8.4 is GCC 8.1. In addition to
  these, PMSA of Armv8-R64 introduced lots of MPU related system registers:
  `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
  `MPUIR_ELx`. But the first GCC version to support these system registers
  is GCC 11. We don't want to bump GCC version to 11 in the first stage,
  it will affect some makefile scripts of common and other architectures.

  Instead, we will:
  - Encode new system registers in macros
        ```
        /* Virtualization Secure Translation Control Register */
        #define VSTCR_EL2  S3_4_C2_C6_2
        /* Virtualization System Control Register */
        #define VSCTLR_EL2 S3_4_C2_C0_0
        /* EL1 MPU Protection Region Base Address Register encode */
        #define PRBAR_EL1  S3_0_C6_C8_0
        ...
        /* EL2 MPU Protection Region Base Address Register encode */
        #define PRBAR_EL2  S3_4_C6_C8_0
        ...
        ```
     If we encode all above system registers, we don't need to bump GCC
     version. And the common CFLAGS Xen is using still can be applied to
     Armv8-R64. We don't need to modify Makefiles to add specific CFLAGS.
     ***Notes:***
     ***Armv8-R AArch64 supports the A64 ISA instruction set with***
     ***some modifications:***
     ***Redefines DMB, DSB, and adds an DFB. But actually, the***
     ***encodings of DMB and DSB are still the same with A64.***
     ***And DFB is an alias of DSB #12. In this case, we think***
     ***we don't need a new architecture specific flag to***
     ***generate new instructions for Armv8-R.***

### **2.2. Changes of the initialization process**
In general, we still expect Armv8-R64 and Armv8-A64 to have a consistent
initialization process. In addition to some architecutre differences, there
is no more than reusable code that we will distinguish through CONFIG_ARM_M=
PU
or CONFIG_ARM64_V8R. We want most of the initialization code to be reusable
between Armv8-R64 and Armv8-A64.

- We will reuse the original head.s and setup.c of Arm. But replace the
  MMU and page table operations in these files with configuration operation=
s
  for MPU and MPU regions.

- We provide a boot-time MPU configuration. This MPU configuration will
  support Xen to finish its initialization. And this boot-time MPU
  configuration will record the memory regions that will be parsed from
  device tree.

  In the end of Xen initialization, we will use a runtime MPU configuration
  to replace boot-time MPU configuration. The runtime MPU configuration wil=
l
  merge and reorder memory regions to save more MPU regions for guests.
  ![img](https://drive.google.com/uc?export=3Dview&id=3D1wTFyK2XfU3lTlH1PqR=
DoacQVTwUtWIGU)

- Defer system unpausing domain after free_init_memory.
  When Xen initialization is about to end, Xen unpauses guests created
  during initialization. But this will cause some issues. The unpause
  action occurs before free_init_memory, however the runtime MPU
  configuration is built after free_init_memory. In Draft-A, we had
  discussed whether a zeroing operation for init code and data is
  enough or not. Because I had just given a security reason for doing
  free_init_memory on Armv8-R (free_init_memory will drop the Xen init
  code & data, this will reduce the code an attacker can exploit).
  But I forgot other very important reasons:
  1. Init code and data will occupy two MPU regions, because they
     have different memory attributes.
  2. It's not easy to zero init code section, because it's readonly.
     We have to update its MPU region to make this section RW. This
     operation doesn't do much less than free_init_memory.
  3. Zeroing init code and data will not release the two MPU regions
     they are using. This would be a very big waste of a limited MPU
     regions resource.
  4. Current free_init_memory operation is reusing lots of Armv8-A
     codes, except re-add init memory to Xen heap. Because we're using
     static heap on Armv8-R.

  So if the unpaused guests start executing the context switch at this
  point, then its MPU context will base on the boot-time MPU configuration.
  Probably it will be inconsistent with runtime MPU configuration, this
  will cause unexpected problems (This may not happen in a single core
  system, but on SMP systems, this problem is foreseeable, so we hope to
  solve it at the beginning).

  Why we need to switch the MPU configuration that late?
  Because we need to re-order the MPU regions to reduce complexity of runti=
me
  MPU regions management.
  1. In the boot stage, we allocate MPU regions in sequence until the max.
     Since a few MPU regions will get removed along the way, they will leav=
e
     holes there. For example, when heap is ready, fdt will be reallocated
     in the heap, which means the MPU region for device tree is never neede=
d.
     And also in free_init_memory, although we do not add init memory to he=
ap,
     we still reclaim the MPU regions they are using. Without ordering, we
     may need a bitmap to record such information.

     In context switch, the memory layout is quite different for guest mode
     and hypervisor mode. When switching to guest mode, only guest RAM,
     emulated/passthrough devices, etc could be seen, but in hypervisor mod=
e,
     all Xen used devices and guests RAM shall be seen. And without reorder=
ing,
     we need to iterate all MPU regions to find according regions to disabl=
e
     during runtime context switch, that's definitely a overhead.

     So we propose an ordering at the tail of the boot time, to put all fix=
ed
     MPU regions in the head, like xen text/data, etc, and put all flexible
     ones at tail, like device memory, guests RAM.

     Then later in runtime, like context switch, we could easily just disab=
le
     ones from tail and inserts new ones in the tail.

### **2.3. Changes to reduce memory fragmentation**

In general, memory in Xen system can be classified to 4 classes:
`image sections`, `heap sections`, `guest RAM`, `boot modules (guest Kernel=
,
initrd and dtb)`

Currently, Xen doesn't have any restriction for users how to allocate
memory for different classes. That means users can place boot modules
anywhere, can reserve Xen heap memory anywhere and can allocate guest
memory anywhere.

In a VMSA system, this would not be too much of a problem, since the
MMU can manage memory at a granularity of 4KB after all. But in a
PMSA system, this will be a big problem. On Armv8-R64, the max MPU
protection regions number has been limited to 256. But in typical
processor implementations, few processors will design more than 32
MPU protection regions. Add in the fact that Xen shares MPU protection
regions with guest's EL1 Stage 2. It becomes even more important
to properly plan the use of MPU protection regions.

- An ideal of memory usage layout restriction:
![img](https://drive.google.com/uc?export=3Dview&id=3D1kirOL0Tx2aAypTtd3kXA=
td75XtrngcnW)
1. Reserve proper MPU regions for Xen image (code, rodata and data + bss).
2. Reserve one MPU region for boot modules.
   That means the placement of all boot modules, include guest kernel,
   initrd and dtb, will be limited to this MPU region protected area.
3. Reserve one or more MPU regions for Xen heap.
   On Armv8-R64, the guest memory is predefined in device tree, it will
   not be allocated from heap. Unlike Armv8-A64, we will not move all
   free memory to heap. We want Xen heap is deterministic too, so Xen on
   Armv8-R64 also rely on Xen static heap feature. The memory for Xen
   heap will be defined in tree too. Considering that physical memory
   can also be discontinuous, one or more MPU protection regions needs
   to be reserved for Xen HEAP.
4. If we name above used MPU protection regions PART_A, and name left
   MPU protection regions PART_B:
   4.1. In hypervisor context, Xen will map left RAM and devices to PART_B.
        This will give Xen the ability to access whole memory.
   4.2. In guest context, Xen will create EL1 stage 2 mapping in PART_B.
        In this case, Xen just need to update PART_B in context switch,
        but keep PART_A as fixed.

***Notes: Static allocation will be mandatory on MPU based systems***

**A sample device tree of memory layout restriction**:
```
chosen {
    ...
    /*
     * Define a section to place boot modules,
     * all boot modules must be placed in this section.
     */
    mpu,boot-module-section =3D <0x10000000 0x10000000>;
    /*
     * Define a section to cover all guest RAM. All guest RAM must be locat=
ed
     * within this section. The pros is that, in best case, we can only hav=
e
     * one MPU protection region to map all guest RAM for Xen.
     */
    mpu,guest-memory-section =3D <0x20000000 0x30000000>;
    /*
     * Define a memory section that can cover all device memory that
     * will be used in Xen.
     */
    mpu,device-memory-section =3D <0x80000000 0x7ffff000>;
    /* Define a section for Xen heap */
    xen,static-mem =3D <0x50000000 0x20000000>;

    domU1 {
        ...
        #xen,static-mem-address-cells =3D <0x01>;
        #xen,static-mem-size-cells =3D <0x01>;
        /* Statically allocated guest memory, within mpu,guest-memory-secti=
on */
        xen,static-mem =3D <0x30000000 0x1f000000>;

        module@11000000 {
            compatible =3D "multiboot,kernel\0multiboot,module";
            /* Boot module address, within mpu,boot-module-section */
            reg =3D <0x11000000 0x3000000>;
            ...
        };

        module@10FF0000 {
                compatible =3D "multiboot,device-tree\0multiboot,module";
                /* Boot module address, within mpu,boot-module-section */
                reg =3D <0x10ff0000 0x10000>;
                ...
        };
    };
};
```
It's little hard for users to compose such a device tree by hand. Based
on the discussion of Draft-A, Xen community suggested users to use some
tools like [imagebuilder](https://gitlab.com/xen-project/imagebuilder) to g=
enerate the above device tree properties.
Please goto TODO#3.3 section to get more details of this suggestion.

### **2.4. Changes of memory management**
Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
decouple Xen from VMSA. And give Xen the ability to manage memory in PMSA.

1. ***Use buddy allocator to manage physical pages for PMSA***
   From the view of physical page, PMSA and VMSA don't have any difference.
   So we can reuse buddy allocator on Armv8-R64 to manage physical pages.
   The difference is that, in VMSA, Xen will map allocated pages to virtual
   addresses. But in PMSA, Xen just convert the pages to physical address.

2. ***Can not use virtual address for memory management***
   As Armv8-R64 only has PMSA in EL2, Xen loses the ability of using virtua=
l
   address to manage memory. This brings some problems, some virtual addres=
s
   based features could not work well on Armv8-R64, like `FIXMAP`, `vmap/vu=
map`,
   `ioremap` and `alternative`.

   But the functions or macros of these features are used in lots of common
   code. So it's not good to use `#ifdef CONFIG_ARM_MPU` to gate relate cod=
e
   everywhere. In this case, we propose to use stub helpers to make the cha=
nges
   transparently to common code.
   1. For `FIXMAP`, we will use `0` in `FIXMAP_ADDR` for all fixmap operati=
ons.
      This will return physical address directly of fixmapped item.
   2. For `vmap/vumap`, we will use some empty inline stub helpers:
        ```
        static inline void vm_init_type(...) {}
        static inline void *__vmap(...)
        {
            return NULL;
        }
        static inline void vunmap(const void *va) {}
        static inline void *vmalloc(size_t size)
        {
            return NULL;
        }
        static inline void *vmalloc_xen(size_t size)
        {
            return NULL;
        }
        static inline void vfree(void *va) {}
        ```

   3. For `ioremap`, it depends on `vmap`. As we have make `vmap` to always
      return `NULL`, they could not work well on Armv8-R64 without changes.
      `ioremap` will return input address directly. But if some extended
      functions like `ioremap_nocache`, `ioremap_cache`, need to ask a new
      memory attributes. As Armv8-R doesn't have infinite MPU regions for
      Xen to split the memory area from its located MPU region and assign
      the new attributes to it. So in `ioremap_nocache`, `ioremap_cache`,
      if the input attributes are different from current memory attributes,
      these functions will return `NULL`.
        ```
        static inline void *ioremap_attr(...)
        {
            /* We don't have the ability to change input PA cache attribute=
s */
            if ( CACHE_ATTR_need_change )
                return NULL;
            return (void *)pa;
        }
        static inline void __iomem *ioremap_nocache(...)
        {
            return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
        }
        static inline void __iomem *ioremap_cache(...)
        {
            return ioremap_attr(start, len, PAGE_HYPERVISOR);
        }
        static inline void __iomem *ioremap_wc(...)
        {
            return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
        }
        void *ioremap(...)
        {
            return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
        }

        ```
    4. For `alternative`, it has been listed in TODO, we will simply disabl=
e
       it on Armv8-R64 in current stage. But simply disable `alternative`
       will make `cpus_have_const_cap` always return false.
        ```
        * System capability check for constant cap */
        #define cpus_have_const_cap(num) ({                \
               register_t __ret;                           \
                                                           \
               asm volatile (ALTERNATIVE("mov %0, #0",     \
                                         "mov %0, #1",     \
                                         num)              \
                             : "=3Dr" (__ret));              \
                                                           \
                unlikely(__ret);                           \
                })
        ```
        So, before we have an PMSA `alternative` implementation, we have to
        implement a separate `cpus_have_const_cap` for Armv8-R64:
        ```
        #define cpus_have_const_cap(num) cpus_have_cap(num)
        ```

### **2.5. Changes of guest management**
Armv8-R64 only supports PMSA in EL2, but it supports configurable
VMSA or PMSA in EL1. This means Xen will have a new type guest on
Armv8-R64 - MPU based guest.

1. **Add a new domain type - MPU_DOMAIN**
   When user want to create a guest that will be using MPU in EL1, user
   should add a `mpu` property in device tree `domU` node, like following
   example:
    ```
    domU2 {
        compatible =3D "xen,domain";
        direct-map;
        mpu; --> Indicates this domain will use PMSA in EL1.
        ...
    };
    ```
    Corresponding to `mpu` property in device tree, we also need to introdu=
ce
    a new flag `XEN_DOMCTL_CDF_INTERNAL_mpu` for domain to mark itself as a=
n
    MPU domain. This flag will be used in domain creation and domain doing
    vCPU context switch.
    1. Domain creation need this flag to decide enable PMSA or VMSA in EL1.
    2. vCPU context switch need this flag to decide save/restore MMU or MPU
       related registers.

2. **Add MPU registers for vCPU to save EL1 MPU context**
   Current Xen only supports MMU based guest, so it hasn't considered to
   save/restore MPU context. In this case, we need to add MPU registers
   to `arch_vcpu`:
    ```
    struct arch_vcpu
    {
        ...
    #ifdef CONFIG_ARM_MPU
        /* Virtualization Translation Control Register */
        register_t vtcr_el2;

        /* EL1 MPU regions' registers */
        pr_t *mpu_regions;
    #endif
        ...
    }
    ```
    Armv8-R64 can support max to 256 MPU regions. But that's just theoretic=
al.
    So we don't want to embed `pr_t mpu_regions[256]` in `arch_vcpu` direct=
ly,
    this will be a memory waste in most cases. Instead we use a pointer in
    `arch_vcpu` to link with a dynamically allocated `mpu_regions`:
    ```
    p->arch.mpu_regions =3D _xzalloc(sizeof(pr_t) * mpu_regions_count_el1, =
SMP_CACHE_BYTES);
    ```
    As `arch_vcpu` is used very frequently in context switch, so Xen define=
s
    `arch_vcpu` as a cache alignment data structure. `mpu_regions` also wil=
l
    be used very frequently in Armv8-R context switch. So we use `_xzalloc`
    to allocate `SMP_CACHE_BYTES` alignment memory for `mpu_regions`.

    `mpu_regions_count_el1` can be detected from `MPUIR_EL1` system registe=
r
    in Xen boot stage. The limitation is that, if we define a static
    `arch_vcpu`, we have to allocate `mpu_regions` before using it.

3. **MPU based P2M table management**
   Armv8-R64 EL2 doesn't have EL1 stage 2 address translation. But through
   PMSA, it still has the ability to control the permissions and attributes
   of EL1 stage 2. In this case, we still hope to keep the interface
   consistent with MMU based P2M as far as possible.

   p2m->root will point to an allocated memory. In Armv8-A64, this memory
   is used to save the EL1 stage 2 translation table. But in Armv8-R64,
   this memory will be used to store EL2 MPU protection regions that are
   used by guest. During domain creation, Xen will prepare the data in
   this memory to make guest can access proper RAM and devices. When the
   guest's vCPU will be scheduled in, this data will be written to MPU
   protection region registers.

### **2.6. Changes of exception trap**
As Armv8-R64 has compatible exception mode with Armv8-A64, so we can reuse =
most
of Armv8-A64's exception trap & handler code. But except the trap based on =
EL1
stage 2 translation abort.

In Armv8-A64, we use `FSC_FLT_TRANS`
```
    case FSC_FLT_TRANS:
        ...
        if ( is_data )
        {
            enum io_state state =3D try_handle_mmio(regs, hsr, gpa);
            ...
        }
```
But for Armv8-R64, we have to use `FSC_FLT_PERM`
```
    case FSC_FLT_PERM:
        ...
        if ( is_data )
        {
            enum io_state state =3D try_handle_mmio(regs, hsr, gpa);
            ...
        }
```

### **2.5. Changes of device driver**
Because Armv8-R64 only has single secure state, this will affect some
devices that have two secure state, like GIC. But fortunately, most
vendors will not link a two secure state GIC to Armv8-R64 processors.
Current GIC driver can work well with single secure state GIC for Armv8-R64=
.

### **2.7. Changes of virtual device**
Currently, we only support pass-through devices in guest. Because event
channel, xen-bus, xen-storage and other advanced Xen features haven't been
enabled in Armv8-R64.

## 3. TODO
This section describes some features that are not currently implemented in
the PoC. Those features are things that should be looked in a second stage
and will not be part of the initial support of MPU/Armv8-R. Those jobs coul=
d
be done by Arm or any Xen contributors.

### 3.1. Alternative framework support
    On Armv8-A system, `alternative` is depending on `VMAP` function to rem=
ap
    a code section to a new read/write virtual address. But on Armv8-R, we =
do
    not have virtual address to do remap. So as an alternative method, we w=
ill
    disable the MPU to make all RAM `RWX` in "apply alternative all patches=
"
    progress temporarily.

    1. Disable MPU -> Code section becomes RWX.
    2. Apply alternative patches to Xen text.
    3. Enable MPU -> Code section restores to RX.

    All memory is RWX, there may be some security risk. But, because
    "alternative apply patches" happens in Xen init stage, it probably
    doesn't matter as much.

### 3.2. Xen Event Channel Support
    In Current RFC patches we haven't enabled the event channel support.
    But I think it's good opportunity to do some discussion in advanced.
    On Armv8-R, all VMs are native direct-map, because there is no stage2
    MMU translation. Current event channel implementation depends on some
    shared pages between Xen and guest: `shared_info` and per-cpu `vcpu_inf=
o`.

    There are two issues with these two pages:

    3.2.1. Direct-mapping:
    For `shared_info`, in current implementation, Xen will allocate a page
    from heap for `shared_info` to store initial meta data. When guest is
    trying to setup `shared_info`, it will allocate a free gfn and use a
    hypercall to setup P2M mapping between gfn and `shared_info`.

    For direct-mapping VM, this will break the direct-mapping concept.
    And on an MPU based system, like Armv8-R system, this operation will
    be very unfriendly. Xen need to pop `shared_info` page from Xen heap
    and insert it to VM P2M pages. If this page is in the middle of
    Xen heap, this means Xen need to split current heap and use extra
    MPU regions. Also for the P2M part, this page is unlikely to form
    a new continuous memory region with the existing p2m pages, and Xen
    is likely to need another additional MPU region to set it up, which
    is obviously a waste for limited MPU regions. And This kind of dynamic
    is quite hard to imagine on an MPU system.

    For `vcpu_info`, in current implementation, Xen will store `vcpu_info`
    meta data for all vCPUs in `shared_info`. When guest is trying to setup
    `vcpu_info`, it will allocate memory for `vcpu_info` from guest side.
    And then guest will use hypercall to copy meta data from `shared_info`
    to guest page. After that both Xen `vcpu_info` and guest `vcpu_info`
    are pointed to the same page that allocated by guest.

    This implementation has serval benefits:
    1. There is no waste memory. No extra memory will be allocated from Xen=
 heap.
    2. There is no P2M remap. This will not break the direct-mapping, and
       is MPU system friendly.
    So, on Armv8-R system, we can still keep current implementation for
    per-cpu `vcpu_info`.

    So, our proposal is that, can we reuse current implementation idea of
    `vcpu_info` for `shared_info`? We still allocate one page for
    `d->shared_info` at domain construction for holding some initial meta-d=
ata,
    using alloc_domheap_pages instead of alloc_xenheap_pages and
    share_xen_page_with_guest. And when guest allocates a page for
    `shared_info` and use hypercall to setup it,  We copy the initial data =
from
    `d->shared_info` to it. And after copy we can update `d->shared_info` t=
o point
    to guest allocated 'shared_info' page. In this case, we don't have to t=
hink
    about the fragmentation of Xen heap and p2m and the extra MPU regions.

    As guest cannot access 'shared_info' until it makes the
    XENMAPSPACE_shared_info hypercall. So it should be possible to get rid
    of the initial 'shared_info' allocation in Xen.

    3.2.2. How to access these pages of remote domain in hypercall
    As 'shared_info' and 'vcpu_info' are allocated by Guest. And these page=
s
    are not mapped in Xen's MPU regions, instead they should be mapped in
    guest's P2M MPU regions. When guest issues a hypercall to notify a peer
    domain through event channel. Xen needs to update the pending bitmap
    in peer domain's page.

    For MMU system, Xen has a full view of system memory in runtime. Becaus=
e
    it has dedicated EL2 MMU to map whole system memory. So it has the abil=
ity
    to update peer domain's pending bitmap. But in MPU system, the EL2 MPU =
is
    shared by Xen and guest P2M mapping. In hypercall context, the EL2 MPU
    only contains Xen memory (code, data and heap) and current running gues=
t's
    P2M mapping. When Xen accesses peer domain's pending bitmap, it will ca=
use
    EL2 data abort.

    So, for MPU system, we need to reserve one EL2 MPU region to map peer
    domain's page to handle hypercalls which need to access this peer domai=
n's
    page. More detailed discussions have been listed in [Draft-B](https://l=
ists.xenproject.org/archives/html/xen-devel/2022-04/msg01719.html).


    But here still has some concerns:
    `d->shared_info` in Xen is accessed without any lock. So it will not be
    that simple to update `d->shared_info`. It might be possible to protect
    d->shared_info (or other structure) with a read-write lock.

    Do we need to add PGT_xxx flags to make it global and stay as much the
    same with the original op, a simple investigation tells us that it only
    be referred in `get_page_type`. Since ARM doesn't care about type count=
s
    and always return 1, it doesn't have too much impact.

### 3.3. Xen Partial PIC/PIE
    We have mentioned about PIC/PIE in section 1.2. With PIC/PIE support,
    Xen can be loaded at any address and run properly. But it's rare to use
    PIC/PIE on a real-time system (code size, more memory access). So a
    partial PIC/PIE image maybe better. But partial PIC/PIE image may not
    solve the Xen start address issue.

    But a partial PIC/PIE support may be needed for Armv8-R. Because Arm
    [EBBR](https://arm-software.github.io/ebbr/index.html) require Xen
    on Armv8-R to support EFI boot service. Due to lack of relocation
    capability, EFI loader could not launch xen.efi on Armv8-R. So maybe
    we still need a partially supported PIC/PIE. Only some boot code
    support PIC/PIE to make EFI relocation happy. This boot code will
    help Xen to check its loaded address and relocate Xen image to Xen's
    run-time address if need.

### 3.4. A tool to generate Armv8-R Xen device tree
1. Use a tool to generate above device tree property.
   This tool will have some similar inputs as below:
   ---
   DEVICE_TREE=3D"fvp_baremetal.dtb"
   XEN=3D"4.16-2022.1/xen"

   NUM_DOMUS=3D1
   DOMU_KERNEL[0]=3D"4.16-2022.1/Image-domU"
   DOMU_RAMDISK[0]=3D"4.16-2022.1/initrd.cpio"
   DOMU_PASSTHROUGH_DTB[0]=3D"4.16-2022.1/passthrough-example-dev.dtb"
   DOMU_RAM_BASE[0]=3D0x30000000
   DOMU_RAM_SIZE[0]=3D0x1f000000
   ---
   Using above inputs, the tool can generate a device tree similar as
   we have described in sample.

   - `mpu,guest-memory-section`:
   This section will cover all guests' RAM (`xen,static-mem` defined region=
s
   in all DomU nodes). All guest RAM must be located within this section.
   In the best case, we can only have one MPU protection region to map all
   guests' RAM for Xen.

   If users set `DOMU_RAM_BASE`, `DOMU_RAM_SIZE` or `DOMU_STATIC_MEM_RANGES=
`,
   these will be converted to the base and size of `xen,static-mem`. This t=
ool
   will scan all `xen, static-mem` in DomU nodes to determine the base and
   size of `mpu,guest-memory-section`. If any other kind of memory has been
   detected in this section, this tool can report an error.
   Except build time check, Xen also need to do runtime check to prevent a
   bad device tree that generated by malicious tools.

   If users set `DOMU_RAM_SIZE` only, this will be converted to the size of
   `xen,static-mem` only. Xen will allocate the guest memory in runtime, bu=
t
   not from Xen heap. `mpu,guest-memory-section` will be calculated in runt=
ime
   too. The property in device tree doesn't need or will be ignored by Xen.

   - `mpu,boot-module-section`:
   This section will be used to store the boot modules like DOMU_KERNEL,
   DOMU_RAMDISK, and DOMU_PASSTHROUGH_DTB. Xen keeps all boot modules in
   this section to meet the requirement of DomU restart on Armv8-R. In
   current stage, we don't have a privilege domain like Dom0 that can
   access filesystem to reload DomU images.

   And in current Xen code, the base and size are mandatory for boot module=
s
   If users don't specify the base of each boot module, the tool will
   allocate a base for each module. And the tool will generate the
   `mpu,boot-module-section` region, when it finishes boot module memory
   allocation.

   Users also can specify the base and size of each boot module, these will
   be converted to the base and size of module's `reg` directly. The tool
   will scan all modules `reg` in DomU nodes to generate the base and size =
of
   `mpu,boot-module-section`. If there is any kind of other memory usage
   has been detected in this section, this tool can report an error.
   Except build time check, Xen also need to do runtime check to prevent a
   bad device tree.

   - `mpu,device-memory-section`:
   This section will cover all device memory that will be used in Xen. Like
   `UART`, `GIC`, `SMMU` and other devices. We haven't considered multiple
   `mpu,device-memory-section` scenarios. The devices' memory and RAM are
   interleaving in physical address space, it would be required to use
   multiple `mpu,device-memory-section` to cover all devices. This layout
   is common on Armv8-A system, especially in server. But it's rare in
   Armv8-R. So in current stage, we don't want to allow multiple
   `mpu,device-memory-section`. The tool can scan baremetal device tree
   to sort all devices' memory ranges. And calculate a proper region for
   `mpu,device-memory-section`. If it find Xen need multiple
   `mpu,device-memory-section`, it can report an unsupported error.

2. Use a tool to generate device tree property and platform files
   This opinion still uses the same inputs as opinion#1. But this tool only
   generates `xen,static-mem` and `module` nodes in DomU nodes, it will not
   generate `mpu,guest-memory-section`, `mpu,boot-module-section` and
   `mpu,device-memory-section` properties in device tree. This will
   generate following macros:
   `MPU_GUEST_MEMORY_SECTION_BASE`, `MPU_GUEST_MEMORY_SECTION_SIZE`
   `MPU_BOOT_MODULE_SECTION_BASE`, `MPU_BOOT_MODULE_SECTION_SIZE`
   `MPU_DEVICE_MEMORY_SECTION_BASE`, `MPU_DEVICE_MEMORY_SECTION_SIZE`
   in platform files in build time. In runtime, Xen will skip the device
   tree parsing for `mpu,guest-memory-section`, `mpu,boot-module-section`
   and `mpu,device-memory-section`. And instead Xen will use these macros
   to do runtime check.
   But, this also means these macros only exist in local build system,
   these macros will not be maintained in Xen repo.

Both options are acceptable and we could support both. The main difference =
for
the user is that option #2 requires a Xen build after running ImageBuilder,
while option #1 might not.

But we don't have to implement both options right away. We can start from
option#1, it will be easier for initial implementation, and the current PoC
implementation will still be possible to use.

--
Cheers,
Wei Chen


