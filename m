Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B256A17E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 13:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362946.593249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QA7-0002i2-ME; Thu, 07 Jul 2022 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362946.593249; Thu, 07 Jul 2022 11:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QA7-0002fR-Id; Thu, 07 Jul 2022 11:59:15 +0000
Received: by outflank-mailman (input) for mailman id 362946;
 Thu, 07 Jul 2022 11:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2DJn=XM=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9QA5-0002fL-5p
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 11:59:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30070.outbound.protection.outlook.com [40.107.3.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3658a64a-fdec-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 13:59:11 +0200 (CEST)
Received: from DB6PR1001CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::31)
 by AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 11:59:08 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::fb) by DB6PR1001CA0021.outlook.office365.com
 (2603:10a6:4:b7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 11:59:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 11:59:07 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Thu, 07 Jul 2022 11:59:07 +0000
Received: from 3ca93c1dbca8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8491A75E-EDA2-4F4A-85D2-A044D76EBAFB.1; 
 Thu, 07 Jul 2022 11:59:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ca93c1dbca8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 11:59:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB5223.eurprd08.prod.outlook.com (2603:10a6:10:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 11:58:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 11:58:58 +0000
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
X-Inumbo-ID: 3658a64a-fdec-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TSQpxIIpBPOtqSSjJVWvvZecFtuAiiI5C456JBOk3toWaXXyddbKHPRxnf4msPkWmqePJFicqM80YGWZPfj0+CSUxumomePiupPau8pScHuUh5TPUXigG4ET8i/5CkQ3z231UXnXr4qRyTxoAFQ29qnKpx3+ZRjO5ZL+CGTOlNgQSQwDKwr/Rc8vr6ytRgWkd0tz3LV0n6XAtlYkizTQsCiaKZpgGMjCIl7TKIYBKjjZhzrZNIigpbB+RVB0IcXqVDiJQRhXCTsrtDWglq58/IvOLDNL1GkNJyURy74zuhjluNUCd+i2ACKUyWrCg+U1nIVAjTK014gYvOes7On7EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItFaFC+hS46Qdqm03JWlqnM4Wp6UfhakAlUpTVK1JK8=;
 b=O65aWpuVQXaJCiOKW1OyKkdBFa86Vun3v7lXYj9J3Ax70u/n2pyHuAraMaEjIuFQd6XOtWv/W8xgBAU6z9iK2/WfT6tM3wIzhcCiFmj/tgyELt3rI24SEgmwdkRb0XPBQUCeinPPq591NDFE75v90UWWRFZPbWzq9fWPFfb7p5myVEu2+sorKEN4e2e0fD5Gw8d2SnQ5y9l3w5J2oGnTMMsXU/KvL6DobYEGwuVvxRVkbN47q2g2kQHu9PdeSO2RbC+rNceO55/QjXjhRFbsWD6vvVqKpkQvmSI71qEVznLQNQmQRN0qrPCotAIJZmgQ1xalqNMsxFqyDpLIaauk1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItFaFC+hS46Qdqm03JWlqnM4Wp6UfhakAlUpTVK1JK8=;
 b=wZlNhDFvXUFs9XnAFct3AYjMJrB3WxZZanZrO8JVQ8Y7s+M+T0hYf7sBI0va7vjHbbSvTrabWVa0lulvSNP6lg6/EVGFq+Wp5HfxQCJ5GriD57+pyUpx8IyOwRS077fYdbmVW04uOjn772VmU7ewJpLWNhnGWKlv2oCXyx/p8HM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77dad97c546ad625
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU7H+JyjlHmZ4cDqZTqKGJ2jEB+626LTdOkyI4DHEkzy6X2msar2BO0aWbnpHy3S51v9SrYKhre4D86wJuxieMVyugPAcBSTvUGLj+1g6kPlSwIc/bNJOuJDQ+9OLyE9ddzrVXubN5hgcd/3GzwptvhGlb3TtxultRwb1uyKqSC7ZV06+ntMSHdT6gDflfaxB7TVOd0VPEKVl800l4KY5Dnf8dlk6E1s1BFZEKXnbW95+edHKVGZhPOVDkcckmoQ87y7uOGOMh+hHHv/WvT9WpZGvyWO5qIj+bBXjL/K4WOd0gyFyUSN68ZBzLEVYms5VJX2P9YM6rIS1UdeCcNgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItFaFC+hS46Qdqm03JWlqnM4Wp6UfhakAlUpTVK1JK8=;
 b=Jvuoae6dku/VN+OTavbwDALQrfGXBY/b8JmNfMmL/gS3y3CUHbsH12zyOb9P0cQvLOT7dpg0xUaJKYDeC23dnhrpAq2hc7MNaUBtuWMOFyBT6rd3rE1KHgVT1HdKPOMF3fFzX9+MJYZuKmHg/jdbgY2hq5C3jexTOZeWdltdbnCgVoKVxrFgT4twbV+kWx0idcw50mnh96jXY9KNkv6/DBR5Zso+61iCLiJjze2OvABRo6+PxLYbo9jSC6K/jvzUZJcW8/9ytwetJ40RPgMRf1lD6TH4tTf2dQY1iXVjC2pmaQ8mrnAmO7GByJdmlMLzWQN69UP1ek9KtTMrFMPSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItFaFC+hS46Qdqm03JWlqnM4Wp6UfhakAlUpTVK1JK8=;
 b=wZlNhDFvXUFs9XnAFct3AYjMJrB3WxZZanZrO8JVQ8Y7s+M+T0hYf7sBI0va7vjHbbSvTrabWVa0lulvSNP6lg6/EVGFq+Wp5HfxQCJ5GriD57+pyUpx8IyOwRS077fYdbmVW04uOjn772VmU7ewJpLWNhnGWKlv2oCXyx/p8HM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <9f40f2c0-f586-a1cc-75c5-a0f339b89848@arm.com>
Date: Thu, 7 Jul 2022 19:58:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
 <9916754f-b730-6201-5225-167995f69b51@suse.com>
 <AS8PR08MB799100B72C4DE86A0CA1F20F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <AS8PR08MB799100B72C4DE86A0CA1F20F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8034cc26-cdda-4c30-3d78-08da601018e4
X-MS-TrafficTypeDiagnostic:
	DBBPR08MB5223:EE_|DBAEUR03FT025:EE_|AS4PR08MB7555:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kY5/lJlfmmpDhekxKDbDCjqQn/j+GC5YZ1ZSoMQe5nluOy7wihQoeKkvhOcgAAJilI6eGWEjbISe3CZw5vs/Fyw5Db53c4kclLOhn1sAS4YfqMlVXJPihOM06J5W6ZDd4GvFt7stoGR9MGDe04sEa8dFJqRyyXYa+O47xFgXZYyaCJJenDzqUMHo90OGMfvHnXTLWmjgMn23ffLxBpTqJUYy+lVgnhqy96EQZs6bsraDiAVEGTGoc5NiQv0XrNPUkD0yNRWFRO3Cl4gV0PVYuEIiPnCuxfleWIc/AfOske+OL8TZeJ9MUope3IZ7tgWjP2iXrXDnypLCL68NW382YJCs+FPk9aqgevhXCv++5RcEQDkFZ+TeIteOuFIJjBJkcqLn2hpDLlR9vzM4rrYlgJZkSN93a+0SBIxGNcEcyZjNOb5M5HXWw+aO+BHLqAeB5oHddMkhS5NqHLd3A5JOvbddu0FXBSUnGW7OJ2Y787hZbyiHIkopN+2RDMyyvCuEAx7XBEkJpdEJhD6Py7w/a9ne2i3RUq09dtuJXUWNz3TYNdTsfrKNhobqrecUU7lsgQ7/B8kGN1/c3UBp76RGC+MLXgRCh/FNvxRaexjx1pOpZKBA+HMC3Vvak13XYOFT1MM7hN77zTmZxDd521e/9QkDwjnQKcEZLQmt3vFNV4FijPi3qzonp8kA6KAXw34vX7Oy7aSvfW3Hdn2trEGpgxO9QuAFBndvbC3HszvHi+8oDHo2yh+iO2OfyvzBmI0d4x5AAC5nkwb26qEie4nn/2CdO3JwzzsAl4e+Ev3zkYgg59LLLxPczbiAAg2VoP7R8cv9oTZ6knWDzWxYbfjWrjknTVNPedQGZhYO+Qk9GUE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(8936002)(5660300002)(38100700002)(86362001)(478600001)(31696002)(6486002)(4326008)(31686004)(2906002)(26005)(110136005)(83380400001)(6512007)(186003)(54906003)(41300700001)(66556008)(66476007)(6506007)(2616005)(66946007)(316002)(53546011)(6666004)(8676002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5223
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f314dbdf-05a4-4b5f-e054-08da601012c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gUwqJBohH8PvdSVS/j1hZRWgrihJXh/CZkGWpamSahwxQKKDwYIkPYcpSocyxb3ZD++E82MhhDhuyECqAvq2aITpSf08KP8ONT6VX3v62f6EJn7Vmzsi1pVe+r93+IjDQlVKyu9dlnhVFSTFZ9YRlUX5o7tS6r5c03CQT2z3L0UT/AcG1fo5XzTweO5HBU980btWCj3GnuW/jJWHOcYz+WOG1mDdCIpw5S878gXf/lYDGXMrrcUAKYQlRId5gpMB1avyR/gql+EIbfFID6wyK8R5S8BxtvoEAyVmZglrlNrKfZcscvxxro4oHygem34iOj6zikVHTZyD8BZPam3IQgIS+3AHJFht291dmjAmsH+aFY1Y18aoK8oZpv7o/VgupA6c7Rkx4E3qjmZjiERxk0ltkDF9KhjdE3mjY6YgJyimTRxs5u6z9qHRBns2xnhezIER3kosYkNGbTNswHzAj36rHMVzTY9am4Nm7ydB8uoYL3megqoF7QkvGF6BEWOJLjOVaNlrhPXf4jBEdsGE9ZNic6d1UoMX/b3/ET6jRGm1xCBGR+DsY7/vM25iENQeHmikPJKstIGxCZt5cbbw6PFb+eqS40rJobuJydFl/SuKEYEGm/fJ4eFeuXY5E0t0yT0Beo2Gmk9SpPfBq2QT6K6ovLFheJFFkf9Bf6l6NXxGswy6D0Gtx7CuysRRciDE34tVspyLV9b39SClyVS6YwMxd0psvVFiM4Cj02W8fxMsaD2REcTMzEx6MppzYmWFR1VahYP+utTwfQQrIcRKu9nu5++yiB0c8sRM2KZNYMGQR1Rl70x+DmJePjW4LuQv2rMbgR8lM1lwDJgYoYNIYb1Ffjo/4K/aAe6kDycDt+s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(54906003)(110136005)(82310400005)(356005)(83380400001)(4326008)(8676002)(36756003)(70206006)(36860700001)(40480700001)(70586007)(31686004)(316002)(2616005)(6506007)(6666004)(6486002)(86362001)(336012)(478600001)(6512007)(26005)(82740400003)(186003)(31696002)(41300700001)(107886003)(8936002)(2906002)(47076005)(53546011)(5660300002)(81166007)(40460700003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 11:59:07.9544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8034cc26-cdda-4c30-3d78-08da601018e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7555

Hi Jan,

On 2022/7/6 13:44, Henry Wang wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
>>
>> On 09.06.2022 17:52, Jan Beulich wrote:
>>> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
>>> there's no intermediate step (mkelf32 there) involved which would strip
>>> debug info kind of as a side effect. While the installing of xen.efi on
>>> the EFI partition is an optional step (intended to be a courtesy to the
>>> developer), adjust it also for the purpose of documenting what distros
>>> would be expected to do during boot loader configuration (which is what
>>> would normally put xen.efi into the EFI partition).
>>>
>>> Model the control over stripping after Linux'es module installation,
>>> except that the stripped executable is constructed in the build area
>>> instead of in the destination location. This is to conserve on space
>>> used there - EFI partitions tend to be only a few hundred Mb in size.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> GNU strip 2.38 appears to have issues when acting on a PE binary:
>>> - file name symbols are also stripped; while there is a separate
>>>    --keep-file-symbols option (which I would have thought to be on by
>>>    default anyway), its use so far makes no difference,
>>> - the string table grows in size, when one would expect it to retain its
>>>    size (or shrink),
>>> - linker version is changed in and timestamp zapped from the header.
>>> Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
>>> Directory size (1c) exceeds space left in section (8)").
>>>
>>> Future GNU strip is going to honor --keep-file-symbols (and will also
>>> have the other issues fixed). Question is whether we should use that
>>> option (for the symbol table as a whole to make sense), or whether
>>> instead we should (by default) strip the symbol table as well.
>>
>> Without any feedback / ack I guess I'll consider this of no interest
>> (despite having heard otherwise, triggering me to put together the
>> patch in the first place), and put on the pile of effectively
>> rejected patches.
> 
> I did a test for this patch on my x86 machine and I think this patch is
> doing the correct thing, so:
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> 

Because there was no Arm EFI environment in hand at the time, Henry only 
tested the x86 part.I have setup an Arm platform with UEFI v2.70 (EDK 
II, 0x00010000) today, and this patch works well when boot Xen as an EFI 
application from UEFI shell.

But the binaries sizes are the same with/without this patch. Is it expected?
I have enabled:
CONFIG_DEBUG=y
CONFIG_DEBUG_INFO=y
Is there anything I should be aware to test this patch?

-rwxrwxr-x 1 weic weic 1081504 Jul  7 18:43 xen
-rwxrwxr-x 1 weic weic 1081504 Jul  7 19:43 xen

Tested-by (Arm only): Wei Chen <Wei.Chen@arm.com>

Thanks,
Wei Chen

> I also noticed that Julien is suggesting maybe we can have Anthony as
> the reviewer for this patch, so I also add him in the CC of this email.
> 
> Kind regards,
> Henry
> 
>>
>> Jan
> 

