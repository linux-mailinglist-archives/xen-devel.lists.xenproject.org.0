Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659B67DCEDB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625812.975478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpWb-0002gO-2E; Tue, 31 Oct 2023 14:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625812.975478; Tue, 31 Oct 2023 14:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpWa-0002dx-Uy; Tue, 31 Oct 2023 14:15:20 +0000
Received: by outflank-mailman (input) for mailman id 625812;
 Tue, 31 Oct 2023 14:15:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qxpWZ-0002dr-3a
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:15:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb16e1ef-77f7-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 15:15:18 +0100 (CET)
Received: from AM0PR10CA0121.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::38)
 by AS8PR08MB9696.eurprd08.prod.outlook.com (2603:10a6:20b:614::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 14:14:39 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:208:e6:cafe::ac) by AM0PR10CA0121.outlook.office365.com
 (2603:10a6:208:e6::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 14:14:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 14:14:38 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Tue, 31 Oct 2023 14:14:38 +0000
Received: from a285a782e20c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A77F009E-C6A5-4ECC-A554-CBAE6A703632.1; 
 Tue, 31 Oct 2023 14:13:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a285a782e20c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 14:13:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB10054.eurprd08.prod.outlook.com (2603:10a6:20b:649::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 14:13:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6933.022; Tue, 31 Oct 2023
 14:13:51 +0000
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
X-Inumbo-ID: eb16e1ef-77f7-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h8Vlq0YAUwUmqTY0bqwv3dMBDm1Qt72FOxjTqZ9G5gWq5wtjcvj3KyAbtWS8P86noH/VKaYBJcZ9qeJc1GOuTic1ETwmiW4SRA1SDi47Rv4edjfpLP4tPAqhVAuwdV0ynCXt5ElKfeswLCEV/z0o3eor+VJZfu/5m+sPfYiVo5vwuUN8dHWdzfS82uXuD6DjjhCgJieWqUMkJn6heXShBdHdffxdILZy8/Szb8sRPAt/A09ye5v1paQcZLVeImORcLNDgPwrodAiIUfEmWmrrkhFLDO6Fi7dwlnoNKt4hk2cqWtUHkyEZPgeFoMlDuUP1KR1ox9HKug+NIdezdCVaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEooZUmQGmKCow4jTsxUpCM8zslkHcSbt5XsLX0OnKU=;
 b=Kxp5ixVJbcCh2PkGQTtPbip8kVC2zQHOhgr9yfCyGBe5xiif4MvWXsDGgjs+oY8fYuDqaX6FdxGYfreYkxhJCrV6hXKH/6hmdO0Kn9OvHnSQzyUE7CjcHuQWWLSA52kglGygo46giuwZydh8Pi6xomkx2qgJHRArfC/MIJofNxGZwsgSdHRBTBp2arUZeyWdbDdJrd3mFIu8e9TuWEZ0cjscSi612HQDbBc7WUjlIBLDIHU1ZduLkWnU5VMyyRbbmCYnctkt5OC9Yd5AHiZ5UsN86S6fKNYB5K515UHpkkbvl2v+5QxirJOdhs/A+jme9DXKskwEc0PHg3DfhT97+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEooZUmQGmKCow4jTsxUpCM8zslkHcSbt5XsLX0OnKU=;
 b=ceYiNpmgAVp1JOmfRKTr/kV6VcqlbBY6+KtyuuAv37qceYtXvaCfzw5Hd/z7J/KRTph+iARcRlRRoyM4Yg6DHuf33LKeJGAp2qQpy0gDY3PYOJmnMev5Blydp4ZV01Cl17xc9dkjsN9B3I+yHzbnzysd+m/D+VpTyOnLGcC+44Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c50d159493fd36f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0thC5K6L85g2+5EWFkZ6AZ3PB/CAsfhZD/PwIA5TG4Mg90roJqpUScNZXO1d05CNac6GSMCkr0Dd4IKN4YFwW4F65abBl+UM3RMqm4p0MV7CCxE9dXEZLtW1A2ZXpcOplMf7KhVLwOZOSuT5S2/tjT1ADhf1Ey6c5gZ7+noDRcAZkAynbVm+nz2EBdsuSZcN1bu+DUoRP3cARZ+U4D8RpucbIcLCsF08A65NuXf/U1fd7TDaxoVgn02y6cP4IruTrzNq3mi3BpHIxXXaJ730qMeDPrr7JXmOlrurKqc0M1iwjhf1Amlle4ONOAD1dWRbtSiwMd6uJxx5cqRo7B5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEooZUmQGmKCow4jTsxUpCM8zslkHcSbt5XsLX0OnKU=;
 b=inH3MZVwSG8SNbfzXynnDoEbf1bzg1yc6NdLF6xy0uG5OHDTz9igRsAz1rfc+1q0AJvGa3DKvFqIqiCv4G1QuKpAXwHEupvpgavdwiIWd8XRA0PQ4UB/uH4wm/sw6rPosN+yQ1qijnClBHWSREfGWm69kZy5UG1Y4FSUxzL60/JyVJ2ZrqStbNMijZXJqr94UZs6jJkqiZtVBRMg4C0wp1zXZpMfNtl/0nhca/7Fe3b7doU+/GTG9ScJI7aLARFBgIsfXQyL0zl0hgxOgfAi0ieRvPvNG4xJu0Q3A27XxwfcXQyCZ7Eq7MBq347moYTRfBqYrM+LsnrCV4vbQQajog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEooZUmQGmKCow4jTsxUpCM8zslkHcSbt5XsLX0OnKU=;
 b=ceYiNpmgAVp1JOmfRKTr/kV6VcqlbBY6+KtyuuAv37qceYtXvaCfzw5Hd/z7J/KRTph+iARcRlRRoyM4Yg6DHuf33LKeJGAp2qQpy0gDY3PYOJmnMev5Blydp4ZV01Cl17xc9dkjsN9B3I+yHzbnzysd+m/D+VpTyOnLGcC+44Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, "ayan.kumar.halder@amd.com"
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Topic: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Index: AQHaC/4b2xNoaiIkmUiyfHAuabY8yrBj8OgA
Date: Tue, 31 Oct 2023 14:13:51 +0000
Message-ID: <DFC25ACE-FFBE-43CF-9CE2-90671D122CEC@arm.com>
References:
 <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
 <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
 <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
In-Reply-To: <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB10054:EE_|AM1PEPF000252DF:EE_|AS8PR08MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: 724b70f8-08c8-4b82-f89d-08dbda1bb7eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xbi/2x8yDWPMI6Y0hWnIDfl/UFUmE5c5nQdO/qFQg2QgSyTLTZr80kmaAVktmttV7wZcwBu9foGYn+QZPKKqYIyQNoYckjYHdT6Tdh1AaJIKBsAlSCKZmZi+IcWAc00OvvSuU3gH9KCGnOfMX/gOTVPx7Zlst3t1gcIeJ5qjsuW99xikQlMDDRgh3ybesPH7GkpJMUAV8F6p6eRFxt7E3lJNjiYdARFao64EbhHdJmdtNQdZlJklQPOZIKYc2+cwCKSn3UY72om2A+c0tZR1ubwUK7ItqDTh5QVlk4UmYWta32ATkTPjDyYjxubOETL0NO93N625TI9mTl6zFNTKPrBZ5Anw+dyI44CVQlO1KRoHbSC7foCVGFmHjRtUTy2imVJstHqevy3ogFPbQ9L1AIovl2dL+uqj9QCnjhpYCYyrGDW4LDx7nBfAMIZKwUgaAbcMjYv3J1jCGO5I3p6gGVSa+RUpq/KvlzyCejjBqN36RZeg+Rv9Bl0YgzEr4BzQzmtHaEouIGPoHqRPA58f+ZGI/izQSpx4woUeI6RZUqzdDYcBORNurrvJWxdGEEDEXN4vrgwM/zXmXmKRN1SPYdXYy3+h6QyYT/d/SYYeDo0xvFySZi0MMSRHLNKip3WRFlrZlxOs6CP+zYxpA2AhAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(91956017)(66446008)(66556008)(6916009)(64756008)(54906003)(66476007)(66946007)(76116006)(4326008)(8676002)(8936002)(316002)(33656002)(7416002)(5660300002)(41300700001)(2906002)(86362001)(38100700002)(122000001)(26005)(6512007)(2616005)(38070700009)(478600001)(6486002)(53546011)(71200400001)(36756003)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <43B4FC59F0E1B848A1712BDFC9300691@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10054
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	837ca6e8-c05d-4116-d086-08dbda1b9b89
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5e9yqB1O4X8d9rg260c9Hjr/ykHCgE/QfD/PCNHP4DEFY5jj3drm2IpKEhcGKfUm5T7VNd01Z8NhqBnHvRNWbXRASHnubR5c7f8OIN2FWjwKjzeYrHFrQtkntfwYwOhWS0qHF324+yYlZnu5C9p0eT/CvPINzprpWL9yi2zxZ56YmTJjzFucYramBhacKyHVUY9k1n7JAp2/m5ZIQ4vFjtBx/kVyWR1pMoIPuIw7mMayAeQ2uwgaBo97W9GTXaC2+HYMIJWHEwNjxyTUcSRnoAoTvn/Ojj47pyKyBfLvCa1dJJYM40i/k5lrMSWcM9t1xqcWbMnWfg9KJf/95/oDWsNeLfSW7reLUaaEU+G7WQ9jKg/MHoNP4fnOpMrEN/HyOnoSyVVx1kKHFHmEK/mnCMesgArqZDWIdTqZ9F0KM+oGCTMuW8jtlgZt/brpVnHIQWoZ+NvsGgjtcfMrhWXLeXAMMrw4O93CgCJzrSpXmWgoTACdAqX22Nk9NAQAetNM5o+BUySAOCPiL8+ldbv3ChqOTRWl/YfqsUJJHM6wqNbJl6VZHDDtiEYXmHEMH75Rg3Coh9y92maTT5Eg7NqDYiegSk98wZKbAgV22Ni3qFtDJiFESrqLQglxVmLmiAFm3yOowXdt7JooO+VSlxDTETFgd8XWjyXnCu+vbpJZqNoELQwW8cTZHrd5VUEqfycx/0tKET+jWYtak7RzPLJdc57eucMO1hFxwOQLLToSKaVaV0/QqF1QwcwF1bkMVEH9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(64100799003)(40470700004)(36840700001)(46966006)(41300700001)(8936002)(6862004)(4326008)(8676002)(6512007)(6506007)(70206006)(54906003)(316002)(36860700001)(70586007)(2616005)(2906002)(26005)(336012)(5660300002)(356005)(86362001)(81166007)(33656002)(40480700001)(53546011)(47076005)(82740400003)(6486002)(40460700003)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:14:38.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 724b70f8-08c8-4b82-f89d-08dbda1bb7eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9696

DQoNCj4gT24gMzEgT2N0IDIwMjMsIGF0IDEzOjI3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIFN0ZWZhbm8sDQo+IA0KPiBPbiAzMC8xMC8yMDIzIDIyOjQ5
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBNb24sIDMwIE9jdCAyMDIzLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+Pj4gSGkgTmljb2xhLA0KPj4+IA0KPj4+IE9uIDI3LzEwLzIwMjMg
MTY6MTEsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNy
YS9kZXZpYXRpb25zLnJzdCBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4gaW5kZXgg
ODUxMWExODkyNTNiLi44YWFhYTE0NzNmYjQgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RvY3MvbWlzcmEv
ZGV2aWF0aW9ucy5yc3QNCj4+Pj4gKysrIGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPj4+
PiBAQCAtOTAsNiArOTAsMTMgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBS
dWxlczoNCj4+Pj4gICAgICAgICAgICAtIF9fZW11bGF0ZV8yb3AgYW5kIF9fZW11bGF0ZV8yb3Bf
bm9ieXRlDQo+Pj4+ICAgICAgICAgICAgLSByZWFkX2RlYnVncmVnIGFuZCB3cml0ZV9kZWJ1Z3Jl
Zw0KPj4+PiAgICsgICAqIC0gUjcuMQ0KPj4+PiArICAgICAtIEl0IGlzIHNhZmUgdG8gdXNlIGNl
cnRhaW4gb2N0YWwgY29uc3RhbnRzIHRoZSB3YXkgdGhleSBhcmUgZGVmaW5lZA0KPj4+PiArICAg
ICAgIGluIHNwZWNpZmljYXRpb25zLCBtYW51YWxzLCBhbmQgYWxnb3JpdGhtIGRlc2NyaXB0aW9u
cy4gU3VjaCBwbGFjZXMNCj4+Pj4gKyAgICAgICBhcmUgbWFya2VkIHNhZmUgd2l0aCBhIC9cKiBv
Y3RhbC1vayBcKi8gaW4tY29kZSBjb21tZW50LCBvciB3aXRoIGENCj4+Pj4gU0FGDQo+Pj4+ICsg
ICAgICAgY29tbWVudCAoc2VlIHNhZmUuanNvbikuDQo+Pj4gDQo+Pj4gUmVhZGluZyB0aGlzLCBp
dCBpcyB1bmNsZWFyIHRvIG1lIHdoeSB3ZSBoYXZlIHR3byB3YXlzIHRvIGRldmlhdGUgdGhlIHJ1
bGUNCj4+PiByNy4xLiBBbmQgbW9yZSBpbXBvcnRhbnRlbHksIGhvdyB3b3VsZCB0aGUgZGV2ZWxv
cHBlciBkZWNpZGUgd2hpY2ggb25lIHRvIHVzZT8NCj4+IEkgYWdyZWUgd2l0aCB5b3Ugb24gdGhp
cyBhbmQgd2Ugd2VyZSBkaXNjdXNzaW5nIHRoaXMgdG9waWMganVzdCB0aGlzDQo+PiBtb3JuaW5n
IGluIHRoZSBGVVNBIGNvbW11bml0eSBjYWxsLiBJIHRoaW5rIHdlIG5lZWQgYSB3YXkgdG8gZG8g
dGhpcw0KPj4gd2l0aCB0aGUgU0FGIGZyYW1ld29yazoNCj4+IGlmIChzb21lIGNvZGUgd2l0aCB2
aW9sYXRpb24pIC8qIFNBRi14eC1zYWZlICovDQo+PiBUaGlzIGRvZXNuJ3Qgd29yayB0b2RheSB1
bmZvcnR1bmF0ZWx5LiBJdCBjYW4gb25seSBiZSBkb25lIHRoaXMgd2F5Og0KPj4gLyogU0FGLXh4
LXNhZmUgKi8NCj4+IGlmIChzb21lIGNvZGUgd2l0aCB2aW9sYXRpb24pDQo+PiBXaGljaCBpcyBu
b3QgYWx3YXlzIGRlc2lyYWJsZS4gb2N0YWwtb2sgaXMganVzdCBhbiBhZC1ob2Mgc29sdXRpb24g
Zm9yDQo+PiBvbmUgc3BlY2lmaWMgdmlvbGF0aW9uIGJ1dCB3ZSBuZWVkIGEgZ2VuZXJpYyB3YXkg
dG8gZG8gdGhpcy4gTHVjYSBpcw0KPj4gaW52ZXN0aWdhdGluZyBwb3NzaWJsZSB3YXlzIHRvIHN1
cHBvcnQgdGhlIHByZXZpb3VzIGZvcm1hdCBpbiBTQUYuDQo+IA0KPiBXaHkgY2FuJ3Qgd2UgdXNl
IG9jdGFsLW9rIGV2ZXJ5d2hlcmUgZm9yIG5vdz8gTXkgcG9pbnQgaGVyZSBpcyB0byBtYWtlIHNp
bXBsZSBmb3IgdGhlIGRldmVsb3BwZXIgdG8ga25vdyB3aGF0IHRvIHVzZS4NCj4gDQo+PiBJIHRo
aW5rIHdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2ggZm9yIG5vdyBhbmQgaGFybW9uaXplIGl0IG9u
Y2UgU0FGIGlzDQo+PiBpbXByb3ZlZC4NCj4gDQo+IFRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgZGV2
aWF0aW9uIG5lZWRzIHNvbWUgaW1wcm92ZW1lbnQuIFRvIGdpdmUgYW4gZXhhbXBsZSwgd2l0aCB0
aGUgY3VycmVudCB3b3JkaW5nLCBvbmUgY291bGQgdGhleSBjYW4gdXNlIG9jdGFsLW9rIGV2ZXJ5
d2hlcmUuIEJ1dCBhYm92ZSwgeW91IGFyZSBpbXBseWluZyB0aGF0IFNBRi14eC1zYWZlIHNob3Vs
ZCBiZQ0KPiBwcmVmZXJyZWQuDQo+IA0KPiBJIHdvdWxkIHN0aWxsIHN0cm9uZ2x5IHByZWZlciBp
ZiB3ZSB1c2Ugb2N0YWwtb2sgZXZlcnl3aGVyZSBiZWNhdXNlIHRoaXMgaXMgc2ltcGxlIHRvIHJl
bWVtYmVyLiBCdXQgaWYgdGhlIG90aGVyIGFyZSBoYXBweSB0byBoYXZlIGJvdGggU0FGLVhYIGFu
ZCBvY3RhbC1vaywgdGhlbiB0aGUgZGVzY3JpcHRpb24gbmVlZHMgdG8gYmUgY29tcGxldGVseSB1
bmFtYmlndW91cyBhbmQgdGhlIHBhdGNoIHNob3VsZCBjb250YWluIHNvbWUgZXhwbGFuYXRpb24g
d2h5IHdlIGhhdmUgdHdvIGRpZmZlcmVudCB3YXlzIHRvIGRldmlhdGUuDQoNCldvdWxkIGl0IGJl
IG9rIHRvIGhhdmUgYm90aCwgZm9yIGV4YW1wbGU6IC8qIFNBRi1YWC1zYWZlIG9jdGFsLW9rICov
DQoNClNvIHRoYXQgdGhlIHN1cHByZXNzaW9uIGVuZ2luZSBkbyB3aGF0IGl0IHNob3VsZCAoY3Vy
cmVudGx5IGl0IGRvZXNu4oCZdCBzdXBwcmVzcyB0aGUgc2FtZSBsaW5lLCBidXQgd2UgY291bGQg
ZG8gc29tZXRoaW5nIGFib3V0IGl0KSBhbmQgdGhlIGRldmVsb3Blcg0KaGFzIGEgd2F5IHRvIHVu
ZGVyc3RhbmQgd2hhdCBpcyB0aGUgdmlvbGF0aW9uIGhlcmUgd2l0aG91dCBnb2luZyB0byB0aGUg
anVzdGlmaWNhdGlvbiBkYXRhYmFzZS4NCg0KDQo=

