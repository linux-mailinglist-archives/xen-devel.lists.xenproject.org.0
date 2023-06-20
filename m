Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650A73687D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 11:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551509.861093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBY5o-0006gI-2X; Tue, 20 Jun 2023 09:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551509.861093; Tue, 20 Jun 2023 09:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBY5n-0006dV-Uy; Tue, 20 Jun 2023 09:56:07 +0000
Received: by outflank-mailman (input) for mailman id 551509;
 Tue, 20 Jun 2023 09:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkVc=CI=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1qBY5m-0006dP-BS
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 09:56:06 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a95062c5-0f50-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 11:56:01 +0200 (CEST)
Received: from DUZPR01CA0249.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::10) by AS8PR08MB6280.eurprd08.prod.outlook.com
 (2603:10a6:20b:29b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 09:55:58 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::bb) by DUZPR01CA0249.outlook.office365.com
 (2603:10a6:10:4b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 09:55:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 09:55:58 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 20 Jun 2023 09:55:58 +0000
Received: from 0a60fa59c456.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54F5BD3C-44CA-4DDF-8FB0-7525DB28B709.1; 
 Tue, 20 Jun 2023 09:55:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a60fa59c456.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 09:55:52 +0000
Received: from DB9PR08MB7674.eurprd08.prod.outlook.com (2603:10a6:10:37d::21)
 by AS8PR08MB6231.eurprd08.prod.outlook.com (2603:10a6:20b:298::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 09:55:50 +0000
Received: from DB9PR08MB7674.eurprd08.prod.outlook.com
 ([fe80::4beb:efa7:47c1:5b21]) by DB9PR08MB7674.eurprd08.prod.outlook.com
 ([fe80::4beb:efa7:47c1:5b21%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:55:49 +0000
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
X-Inumbo-ID: a95062c5-0f50-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEzqIZLEJxQK5n4KfXGUlk25PodseeNRgwKhXQxp8rg=;
 b=O7D8ZStA2RIAlH39HL09Ac06wLh3vaTnlEStMX4Gzjd0PSeXPM9bw/P1Z+MVm4L+3hHoDY9ylhrAsuDN+1E2xHIO2rdAALgpyJpJs6nTozUpJas9qe0baoeD4WZwyfmrgeFrew/Dw8BkhzBxKRsrbn2tTF7oID1KB9TietvdLYU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc09ea447b986d2a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI8cb0/5+bnYn8McybyszRahdVcKZ9SBO3X51V0XHR4MzLFxat90V6P4SfuKXABg9KvuUPBR34LS0hJifrP3Obq+9BQyfEzjzDUgw1D9ugjgB/XjbwDy5cYKHgJESU5ERqk1RcGlC2638/zVbccq84Rbuer2nCboYbESzIgb2hX+Iil0FUdNGOwx13xprYpRMoafszpZM6yCcIX6xTZkm6QG/7R4oP9AUQw+7BUEnTrrnusr2o7xjXDi31jOCvLziziWL7SU5VEk8NLzCLDbRfAzpFWawCza0DPgqt5OtoBUxoh2QGvIrLzU6Un6HwQJ4yQbSMeRoUzW7VU/rq8ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEzqIZLEJxQK5n4KfXGUlk25PodseeNRgwKhXQxp8rg=;
 b=Gl1ZPiEqLNIBSwJ0TEb403tEDX1050z+dr5oykTiwogeq4BWyg5ElBgtI9VIopQs/GfQ4cCkKPIwEQGOFP7IeAboN3cOcDsu7X0QeVvwX5Q5Src/10ESY8qBJRRZgenWdaM26o5Sq8HL7I2k20K672ud++PIvLMYsKRWq1qyd0oLt1dm9TKH6t5OiHxDjVdBU8SA5bzAIx6ph5xcxbN5Th0ePEQUIDQ+lev/3ki7RxY9qwnsTOOyDl+jnzK0+G9nKZJ4az3N9N56PjPjnHg6UszDm4NW72FZQPu7qatUpFPk3M43x/HSBrtilmVmC95uMi2Nfvz9yhL2aZt7b019hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEzqIZLEJxQK5n4KfXGUlk25PodseeNRgwKhXQxp8rg=;
 b=O7D8ZStA2RIAlH39HL09Ac06wLh3vaTnlEStMX4Gzjd0PSeXPM9bw/P1Z+MVm4L+3hHoDY9ylhrAsuDN+1E2xHIO2rdAALgpyJpJs6nTozUpJas9qe0baoeD4WZwyfmrgeFrew/Dw8BkhzBxKRsrbn2tTF7oID1KB9TietvdLYU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <afbd3e2d-1c6f-35bc-7916-50cf3fea8f87@arm.com>
Date: Tue, 20 Jun 2023 17:55:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] build: Drop CONFIG_$ARCH_$(XEN_OS) definitions
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
From: Jiamei Xie <jiamei.xie@arm.com>
In-Reply-To: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0251.apcprd06.prod.outlook.com
 (2603:1096:4:ac::35) To DB9PR08MB7674.eurprd08.prod.outlook.com
 (2603:10a6:10:37d::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7674:EE_|AS8PR08MB6231:EE_|DBAEUR03FT008:EE_|AS8PR08MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: a552abd6-05e1-4725-a37d-08db71748c3a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wNnaaIPLAmS9f2IK6uxVPLEDoAaFkMOHakq9i4LlZobNNVLxW2zC6pbH09yv2PBooWKdrxr+/rV8/6pnZbx1HQ3Ri+sC/ZZ0gQ+qexo7nRQazTXyxv6iqymlFh7L1nkFY/4jO6MtbtmqGZmgzWxIxJSQxdRXoCirQ8SdurOgPonc1xi/cgQ5o7LhqqC21nspCbN60b1gnLI97BCs282jdtbqRGaYKR/PZ/Ib09TiuIoLuKFGZYpAzPynillmHK8Nm2yk6aSMsYsYm5iInzjl7Zoj6DHOALPxQPyWDJWLTVBc7JMVU4s5V61s2GXuHJWuoG/Xl5Wk/iAaowppKhnWlNZDuyCSWcLwj2RI11ghTFa30jXX/TrAliWGY9MHvmKoeMKIEsrP6ad3B4/8yzSqyqR/NTaTre7TEM3WW8no2QNALICMtnHAMl23CG84qEoBzfCsmGtqT2Su3pszfc1MKLqabtgoBsn3tfa6ZakFn0Vs9THqBhjwcYMA+3xJ+6qNNa5GHK3UINlCma+0etXx98qPTS/YQtjNZKgL9+hs9egpUPzdbqDPmrUuvDtikRDrmK6DhsJLQSnrwnJmgufTY6M1WMc6NzqSaaOafEk9jMS9tMc49zEsqYYsPsehLJDFC7B1J/S0RE6CBIkhrKxnTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(31686004)(6486002)(478600001)(6916009)(66476007)(66556008)(66946007)(36756003)(6666004)(41300700001)(38100700002)(316002)(31696002)(86362001)(6512007)(26005)(6506007)(83380400001)(186003)(2616005)(53546011)(44832011)(2906002)(4744005)(8936002)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6231
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	140a9f88-8d72-487c-df0d-08db717486dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t3HCK8mZPhKC4cPhRkGl6MXIOLlWoPv/O03bVMUhfEMt39+a5qqfHbRqLKsBhEWEQnpNw716hP0C6q7qcd8WEVe3x5ex4ZUHYnQS13ydX/430iiFUtBOezZUmtVwmlkYrDRMHV+NuETU1lyGzUUhf4pN3ROWzFO5+6Z7uiQwnpTZ/XdXiWbyA8H08M3QT1hdxdqzt6EVwmftBLHcDTTC7ob9HFideo8Ex345swGqCApqmvDGbXpyMtlrP3cJjJO8Arqg8OvY1pgyZrZ1y4BOf2Mquuw0ED1IGMRqh0e2qReYNKaA7yOqUEgr0yQ6fgA+JdEGkJ5vbBq/ouBLI0QK6ztjXKwAQ0j/BGdGc2Y3NFz75LABalsFiaj/8Ww1uQaWl6C8n0BjmFRwWRsAUfKfqtmxtDVMmc34nMgZEcsSPyb5Upn4V+xxklrgielIGdD0dOj+woAWSJ3iN+R2eV5mkHnHGDSiPO/Zxg0id39yqN/hg06fbMNknHuQKsuXh0lLHRI7ngKPcO95VPWKAmBqypaIBM5No+Y6RmejCkRwC3sWBnZKuJPq+RcSCcPn5duEvzDNuRtf/4BCp4k4Acctt+c89u9UuwLiHNQqu9q6FYLRd8WGZy73dKOB3LkxXHQ58FYnO1PbTBEqd+7jiZ37sTBGkghBr+/i301Kz3ZcwID3noMcGJESrCA9bmxMNsXaHmA9cmPFnFJumBJMTOEQK9yBcLpLRR/7BuRE6LYu6LUvoM2JnuEwfZOARjajwaF2udaiLDniHrBlOgqSoMheQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(8936002)(41300700001)(40460700003)(8676002)(82310400005)(478600001)(82740400003)(81166007)(356005)(2616005)(83380400001)(336012)(6666004)(6512007)(26005)(186003)(6506007)(53546011)(36860700001)(6486002)(47076005)(40480700001)(31696002)(86362001)(36756003)(316002)(70586007)(70206006)(6916009)(31686004)(4744005)(44832011)(2906002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:55:58.5855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a552abd6-05e1-4725-a37d-08db71748c3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280

Hi Andrew，

On 2023/6/20 02:06, Andrew Cooper wrote:
> These aren't used, and are not obvious useful either.
>
> tools/ does have some logic which works on $(XEN_OS) directly, and some on
> CONFIG_$(XEN_OS) too, but this isn't how we typically refer to things.
>
> The only user ever of this scheme was introduced in c0fd920e987 (2006) and
> deleted in fa2244104b4 (2010).
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
>
I run it on fvp_base_revc. It works fine.

Tested-by: Jiamei Xie <jiamei.xie@arm.com <mailto:jiamei.xie@arm.com>

Best wishes,

Jiamei

