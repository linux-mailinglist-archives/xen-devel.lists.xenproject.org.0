Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F035A4569
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 10:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394491.633910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSaQI-0007Vb-HR; Mon, 29 Aug 2022 08:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394491.633910; Mon, 29 Aug 2022 08:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSaQI-0007SG-CR; Mon, 29 Aug 2022 08:47:10 +0000
Received: by outflank-mailman (input) for mailman id 394491;
 Mon, 29 Aug 2022 08:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emil=ZB=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oSaQH-0007SA-EO
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 08:47:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286a4539-2777-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 10:47:05 +0200 (CEST)
Received: from AM6PR08CA0038.eurprd08.prod.outlook.com (2603:10a6:20b:c0::26)
 by AS4PR08MB7405.eurprd08.prod.outlook.com (2603:10a6:20b:4e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 08:47:03 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::78) by AM6PR08CA0038.outlook.office365.com
 (2603:10a6:20b:c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Mon, 29 Aug 2022 08:47:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 08:47:02 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 29 Aug 2022 08:47:02 +0000
Received: from 61d029a8a4ac.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9888F35F-5E34-4576-ADC7-13F6482207B2.1; 
 Mon, 29 Aug 2022 08:46:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61d029a8a4ac.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Aug 2022 08:46:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB6614.eurprd08.prod.outlook.com (2603:10a6:20b:338::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 08:46:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 08:46:53 +0000
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
X-Inumbo-ID: 286a4539-2777-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mJLzIN/O7YwDzfm4ARt+9dkYuc2yCp07+l2Iek/JzRizIoOvh/juj3y2OLu0GxbmculbHrMUIm8eJJodcGLutnzxKoDMBSYd8xArp4iHa0UmrbTV9SQQ+W2nzHGDbft3jQdBou+GPwFR6d9C9b1cJkxN2Ma63PQNJ45bVoJLp5L7B1cQ+P3LYqKIwUj8LnJ4IgxN7U9JoOMUTgntfwU8ex4oj0CkcYeHlbrvKa7ChwfdYIMVZnN5vRKpeBCoxFBUylblWAf9GjBTKCikfI8cP3DYx4UfaFdTUjvXAPWMcZpv8iFrwSZZ7bCm3QEC9kowarcfOhtINhTCrMFZ/NohQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1YcX7aTy6VetbRllemKCAlm2k0/XB/FgLBgsk2WXsA=;
 b=CnyW166dbflaSS5ewV2Ikg7ue/6qLoumrxPVlvtEL71QyTJMJVIq1dHz+VW5/bvNf2Ao1jlcS2q6i8/QvmHYCBpTV4A5gJ02s9FCGnUbRGZMWsVl2lcXstJvYVwBBtY1KQIzNCsWEQX2gjgaXpK00yyZBhmMw+s1B+P1N0RK4v0SwRrHh++jCktG010ilTPHNAVQzwtEq9RMp2C+xSquWPWH3lIMSRU9TsD0R3sMnDgR9HZW82Dcx+BbkD2+LogAb9FrZ+zb0iqAW4v4Gy32eoVdAT+v8ndGad1HIdIfmiKSxgWKhCzJGwecEC5q+T/wuw16sY4kWFK1DRCukx+Kcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1YcX7aTy6VetbRllemKCAlm2k0/XB/FgLBgsk2WXsA=;
 b=lnsFtk68BH4G27YxTpudJc8nNgj9S9V3dBJrI6Kz870SpWhWubi6H3Gf4U1yz34p+jU+13a2rDyF5lm1+DAYDdJ1jGTxUozz6TmMHsCa1ERf8+nHycizXnjg+ARMSR5d8GUZOffkOqTGbrLImVM+yQ8zK9YSNeGWcsSgXgcm6uo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLEMHZeBOS+TYj5xCFZ9y5guOgNShNP4H2zzZsIDjasc4pi2Ug2hKRNomydS3rLD5HHr8PHb6q1KVjr3yzMy+UNIL//yk8SC5kNDO+ozMDq+Sc1d0dHBvTjMNHQ1fDk+EEeadv1w4eC53vBv2cRw+PO8syU+HdBd+ybQt2l1N1AvGSSajatA/7RWwDjs0M4rZXGmbGin7Z+RBKXb5RoVLTxRC5SVlxJsVgfcFoirS3gn8wN/8tvYRxOJZ8Nln7P/1n9raJLGt/w0/NzVCm+Za0zrQxoKHF4fqHAwwBMq+TvrscdEzibBN+1W6YreAPwonAOMJ+6sk/soXKBwxoD8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1YcX7aTy6VetbRllemKCAlm2k0/XB/FgLBgsk2WXsA=;
 b=b9wr4IAkHdVZQ3SNL6uVDYquVxQMjcPbvpMrRz/axO/f+R5fPKQ8IFeHFVhdZvsHdcifnhg7WP6P/n/z0CMTnLakKE+Vu3iA8//Rr+x23IRf2HFnWE8EZppRqVbp3jTzK6Pjnfn8BlkAJkqzT/hzzwdsFESJQlnOLGdDmG13ZZP/ZUeA1IebGKIh2pj+EEVpGxeWkypVVTA0N3BwAJ0XgnUdqfdOzR8GPhw5HloZZ0nW9S/FLcliDo4RVuUOSIP1n11e+d382ol5nDlSb1MNonRlmwuDRi1LSKZ8RkiQl63IUCFi/p1uYBv23tu05HcjWdSZxw7hPXMYaY3k800QTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1YcX7aTy6VetbRllemKCAlm2k0/XB/FgLBgsk2WXsA=;
 b=lnsFtk68BH4G27YxTpudJc8nNgj9S9V3dBJrI6Kz870SpWhWubi6H3Gf4U1yz34p+jU+13a2rDyF5lm1+DAYDdJ1jGTxUozz6TmMHsCa1ERf8+nHycizXnjg+ARMSR5d8GUZOffkOqTGbrLImVM+yQ8zK9YSNeGWcsSgXgcm6uo=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/6] xen/x86: Provide helpers for common code to access
 acpi_numa
Thread-Topic: [PATCH v3 1/6] xen/x86: Provide helpers for common code to
 access acpi_numa
Thread-Index: AQHYtdMuStODhqLRIUWXc955/EIfNq2/bFqAgAYumSA=
Date: Mon, 29 Aug 2022 08:46:53 +0000
Message-ID:
 <PAXPR08MB7420CC962329E885F2D3990F9E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-2-wei.chen@arm.com>
 <784c1d55-be94-eef9-eb96-fd8fd902db12@suse.com>
In-Reply-To: <784c1d55-be94-eef9-eb96-fd8fd902db12@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1E639C232A3B3547A96F334FE04DE5F2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 08ec7b58-a8d5-4531-c536-08da899b0b49
x-ms-traffictypediagnostic:
	AS8PR08MB6614:EE_|AM7EUR03FT038:EE_|AS4PR08MB7405:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PBdwyORjWqkCjNb/DLRUxUEw2FVKpISEl1onqEyBCEdabc3f7uSH7sTNyoTMXTzC5CghBL3FKgU5p4Q7vJm4yzSSEhf+FnR4AwT3PKLetjVDM2lCzJtFE31dgbhJNMyIB3sCjtqBXfnmePqQpRAhrbzrAoPrRKF7VTQgkq3pMH9NKTUIC3a5AOfNrlL8z9zKlje/99XUfBLr35cODO/zL//+62diYh0phUzKfmmQVQl+PPYkzw6oxvJdvpPpTM5uTFV+S7BP8Glc8ghfqHwmDNbb1+y5x8yu2Z0Hrvcc9x/wWMiDClgUj8FkIT+hbf7a13WeHgVrNL4e3GlmcCO2ABax5LQ3agQlBMsRXmIs/HQHbyfxJtXVzMcXJ+zdfraUltB/F3pPpEaADOH2SJsj5jhbly5ifA4kHTen8ruS8ZswkHb8EtqusyXqv3jFC5aGByP2nEuf0NCKphDgTRzco8s0cySpvVo4L+C3F/OERc4/LcAqrVxftAaKpt0qLeJ+oi+hnL8P+3P1vF4n3D3ApBi3V+uM998ooXx6ZG5V1DK68GgCpIdvLrKYhgJtznVC2a0rO4Q9O4WAugT0CzNVaFXMTbzGao7Z04D2zAPAw8I1LscO/qhXISlH97gsFE8aXyLWAw6w4JMAZ676jtIPCsDMgtHR0MRL25EDAukHliULcpADJo9ltwfC1Td/l0+yB4mzRTcVnjw1uI7giyzvSc9xCZBwO+dTnF2GN5apawEzq89bc9oWAQHy7b/aKJCDcn7b6TtrjxzStmSjG3yEoQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(33656002)(6916009)(71200400001)(316002)(26005)(9686003)(2906002)(83380400001)(53546011)(6506007)(7696005)(186003)(86362001)(38070700005)(55016003)(54906003)(122000001)(478600001)(5660300002)(41300700001)(8936002)(38100700002)(52536014)(4326008)(66556008)(66476007)(66446008)(66946007)(64756008)(76116006)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eaaaa247-f1f1-4501-c8ea-08da899b05b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VoDMhaD23NaMdxedDz4KLWRqe61h9uIz2L0+HQEzoAIiXyFk7nE/sRR/QnSXV5fym6JaeE/2EWME9zrse+0vIGOqD+yvyHImct3ZpTTIGlIhL/gA/oOaqIFN6aagg1g1B0WGjz4L026sATHO/QVo2NdRHukHHZiyrm3W8mhRTbPoOxwvpRKXIWUMFjNd8Gk93kL++hdj6gftB4u1q5LMOw9rxGdqiq32uouKPGkAX0nGtZna8um1lb2QWe093DN68QGH4hIUNcKDUkLDJ0dQaHL4FSxApAmM4y51mCgTei0LrF4nzfgeX0z/rQVVM/CmZ/33QNOUfnD9hTBeGC0qZIGWkhobmGSbQglRMOj4Ear8px2iOj7SCb6Hq4C07/GlmMYtYa3fAN8C8PMPlWtPa2uxE2a0BNS0Xt9mQgIJWm/IFjcY9sZ0gnry0S49rxdX2968cH8Iy+N08TfAHXAE8Y1ALUrr/36B/7Ot9L9Qm4yJtf6EVRtyO60AUWDNvIOdqkK3LljurWj0YPvyNsPu5Ib2M9jQKMsIlU0EMNWBh2+R17YCQuKcNd93QKIQTEjPWxGeyLHUOzbyNrmVGvxLfeimGYMN0qDfEgUdMIVmXxMFXAgY/2q111DPE8l6ZAGdum+gt/IoAU7BkcsbRSm5N5kyZrUww1FYR9ecRIJldJCNvGBycKTCfI9eK47G6OfR5nUejifCU9xeqlc8F1fPh3vt03G6BcAeBpv+8nd/MBE2vF2l2yHtRp34zdi0rwTv5lCjj1bRo705/GAf/p959g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(40470700004)(36840700001)(46966006)(53546011)(52536014)(7696005)(26005)(6506007)(478600001)(9686003)(41300700001)(47076005)(83380400001)(186003)(336012)(2906002)(5660300002)(6862004)(8936002)(40460700003)(55016003)(54906003)(40480700001)(82310400005)(316002)(8676002)(70206006)(4326008)(70586007)(356005)(81166007)(82740400003)(86362001)(36860700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 08:47:02.8041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ec7b58-a8d5-4531-c536-08da899b0b49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7405

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDjmnIgyNeaXpSAxODoxOA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
MS82XSB4ZW4veDg2OiBQcm92aWRlIGhlbHBlcnMgZm9yIGNvbW1vbiBjb2RlIHRvDQo+IGFjY2Vz
cyBhY3BpX251bWENCj4gDQo+IE9uIDIyLjA4LjIwMjIgMDQ6NTgsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9udW1hLmgNCj4gPiArKysgYi94ZW4v
YXJjaC94ODYvaW5jbHVkZS9hc20vbnVtYS5oDQo+ID4gQEAgLTMyLDggKzMyLDkgQEAgZXh0ZXJu
IHZvaWQgbnVtYV9hZGRfY3B1KGludCBjcHUpOw0KPiA+ICBleHRlcm4gdm9pZCBudW1hX2luaXRf
YXJyYXkodm9pZCk7DQo+ID4gIGV4dGVybiBib29sIG51bWFfb2ZmOw0KPiA+DQo+ID4gLQ0KPiA+
IC1leHRlcm4gaW50IHNyYXRfZGlzYWJsZWQodm9pZCk7DQo+ID4gK2V4dGVybiBpbnQgYXJjaF9u
dW1hX3NldHVwKGNvbnN0IGNoYXIgKm9wdCk7DQo+ID4gK2V4dGVybiBib29sIGFyY2hfbnVtYV9k
aXNhYmxlZChib29sIGluaXRfYXNfZGlzYWJsZSk7DQo+IA0KPiBXaGF0IGlzIHRoZSBwYXJhbWV0
ZXIgbmFtZSBpbnRlbmRlZCB0byBtZWFuPyBTaW5jZSB0aGUgb25seSBjYWxsZXINCj4gcGFzc2Vz
ICJmYWxzZSIsIHRoaXMgYWxzbyBpc24ndCByZWFsbHkgcG9zc2libGUgdG8gZ3Vlc3MgZnJvbSB0
aGUNCj4gdXNlKHMpIGluIHRoaXMgcGF0Y2guIEluIGFueSBldmVudCBwZXJoYXBzIGJlc3QgZm9y
IHRoZSBwYXJhbWV0ZXINCj4gdG8gYmUgaW50cm9kdWNlZCBvbmx5IG9uY2UgaXQncyBhY3R1YWxs
eSBuZWVkZWQuDQo+IA0KDQpUaGlzIHBhcmFtZXRlciB3aWxsIGJlIHVzZWQgaW4gcGF0Y2gjNSBh
bmQgc2V0IHRvIHRydWUsIEkgd2lsbCBpbnRyb2R1Y2UNCnRoaXMgcGFyYW1ldGVyIGluIHRoYXQg
cGF0Y2guDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L251bWEuYw0KPiA+IEBAIC01MCw5ICs1MCwzMSBAQCBub2RlbWFza190IF9fcmVhZF9t
b3N0bHkgbm9kZV9vbmxpbmVfbWFwID0geyB7IFswXSA9DQo+IDFVTCB9IH07DQo+ID4gIGJvb2wg
bnVtYV9vZmY7DQo+ID4gIHM4IGFjcGlfbnVtYSA9IDA7DQo+ID4NCj4gPiAtaW50IHNyYXRfZGlz
YWJsZWQodm9pZCkNCj4gPiAraW50IF9faW5pdCBhcmNoX251bWFfc2V0dXAoY29uc3QgY2hhciAq
b3B0KQ0KPiA+ICB7DQo+ID4gLSAgICByZXR1cm4gbnVtYV9vZmYgfHwgYWNwaV9udW1hIDwgMDsN
Cj4gPiArI2lmZGVmIENPTkZJR19BQ1BJX05VTUENCj4gPiArICAgIGlmICggIXN0cm5jbXAob3B0
LCAibm9hY3BpIiwgNikgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIG51bWFfb2ZmID0gZmFs
c2U7DQo+ID4gKyAgICAgICAgYWNwaV9udW1hID0gLTE7DQo+ID4gKyAgICAgICAgcmV0dXJuIDA7
DQo+IA0KPiBXaXRoIHRoaXMgInJldHVybiIgLi4uDQo+IA0KPiA+ICsgICAgfQ0KPiA+ICsgICAg
ZWxzZQ0KPiANCj4gLi4uIHRoaXMgImVsc2UiIGlzIHVubmVjZXNzYXJ5IGFuZCBoZW5jZSB3b3Vs
ZCBiZXR0ZXIgYmUgZHJvcHBlZCwNCj4gbm90IHRoZSBsZWFzdCB0byAuLi4NCj4gDQo+ID4gKyNl
bmRpZg0KPiA+ICsgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAuLi4gYXZvaWQgdGhlIG90aGVy
d2lzZSBhbWJpZ3VvdXMgaW5kZW50YXRpb24gb2YgdGhpcyBsaW5lLg0KPiANCg0KVGhpcyBpcyBh
IGdvb2Qgc3VnZ2VzdGlvbiwgY3VycmVudCBpbmRlbnRhdGlvbiBsb29rcyB3ZWlyZCwgSSB3aWxs
IGZpeCBhYm92ZSAzDQppbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCldlaSBDaGUNCg0KPiBK
YW4NCg==

