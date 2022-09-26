Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423F5E9966
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 08:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411391.654301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ochUR-00035O-K0; Mon, 26 Sep 2022 06:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411391.654301; Mon, 26 Sep 2022 06:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ochUR-000336-GC; Mon, 26 Sep 2022 06:21:15 +0000
Received: by outflank-mailman (input) for mailman id 411391;
 Mon, 26 Sep 2022 06:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bt7Y=Z5=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ochUP-000330-Vj
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 06:21:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 693d48ee-3d63-11ed-9647-05401a9f4f97;
 Mon, 26 Sep 2022 08:21:10 +0200 (CEST)
Received: from FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::22)
 by GV2PR08MB8320.eurprd08.prod.outlook.com (2603:10a6:150:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 06:21:05 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::e3) by FR0P281CA0039.outlook.office365.com
 (2603:10a6:d10:48::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14 via Frontend
 Transport; Mon, 26 Sep 2022 06:21:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:21:04 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124");
 Mon, 26 Sep 2022 06:21:03 +0000
Received: from b18c6d6e9b20.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9203547F-9024-4A9D-A552-28A72D28A0BB.1; 
 Mon, 26 Sep 2022 06:20:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b18c6d6e9b20.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 06:20:57 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB4PR08MB9312.eurprd08.prod.outlook.com (2603:10a6:10:3f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:20:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f997:4dac:eff8:93d6]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f997:4dac:eff8:93d6%4]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 06:20:54 +0000
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
X-Inumbo-ID: 693d48ee-3d63-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UK/Ia14reBIRtBP6VHiP2OMKXoJXniWR+x10wdyG3LvG7dSQVQNe2wVCUQy3mcJ/gsZIJ7iOrHq50Eaykd7kNo00CN8GesSObZ6UNzC9jWgihN5NF68ogtEUWvF5LjnEcJnahZn/QEEZZ8y4xOeL1+EYALKsLtTbMIS2w+8fwPJNHrSslPFS7aRyD0FqiBe7Y7x+qzs+1m/Zht+Wn/iWE0kQWYTOn8EC413SX4gUV5RcVFtNfwZ7IukzTy4XA81Dey3IVbBnt5Jd8KvPR1pkgpbOghEtOx+/9qUzCVJCwwT/u7VrHsXk7CrsknRD3bJcFgGN7r4T+TTxajvLsT+gkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j9g1eef5Mhx82JSWbsdv3g6wgmZV5MHnTvk0yfFkYs=;
 b=jCjXtGwazcWp+3D1XkhRKXtDvXl8Ioj988HWKhvEvIJPPe/BJ8bB8w4ObNxAkuuw/XJr4v7C2pYE8BGA4QIylvkxmRhkcG4flQav1nNbXWFVs9GDfPmWRk9Vr/DY8L/0kRBOhddxp32G6dvfVW25XttXrFGAMW2nwvK+N+Qa5I6Ui/Xt5dqLIitqnMUHMzI5BbGkdL+nc12no/2WvoSSm/sDIjbXo5S7lq1bagVcgSkTQ7Z1VvyafXAcEiYATUeoOMYQ6Bj4653xoncKstd0tEh+Sm6qK3A+AbxOqiit+XMyJXVd3mQI1aE+mahtQPaflEXEB7CPopN11UbtgLnNPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j9g1eef5Mhx82JSWbsdv3g6wgmZV5MHnTvk0yfFkYs=;
 b=9J8utZ6EdR+GmFF94xIsAJMQimVTATBMkdHSNfVr1CTMFyw8bXI90N9LxdzEhLhI7/y9nHB7j+3MAag4m0kSVTo5ETMzs2FhPhJzbnA/ASrpfQp6C/0hYpex1JbH44d5XD442u7vG9CwBj6dmMBRq5qXWFzMy6sVtR33PKpWZXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97a8715d04f7b124
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKlL+YtEB5lJBfyclcLH1pE6wEqZI9Q2lbTK7GNUahf/huZYcG7846/0I5kgGdphaX5KR5anA8b3KNLSCEIr7IZbndEMoM1wLQ4KbqpDYcPj+aPfaJ3xSGO+aIs6UOSZMDQAlpbWLo3qs+qjUil+qOKdOi/4vvlmhvRDqGdUZLrBkl3C7Q8be+Dk/WP6DZDeNoiwyTnqBdLMKeOfmMbBdYbrX1Db9jKXiULOpHkGpeErxak8rsdltWglS2avkAu6PIoUs6HBc4zobpGb8EJStQdTtTrWjfh58P0FUCbwK7/QvOsM24JKRM2H41H4I93DCMPB9Gm7Z4JxD1U6MKppgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j9g1eef5Mhx82JSWbsdv3g6wgmZV5MHnTvk0yfFkYs=;
 b=QxYoQAmvYSt++xTG8tmCcA0bba1oPlpZdTcS8UxZd1WiMPAJZlXHw3Jie6e2UHvPporq3P0vHeilbEcFmHGY32CVUzKfNncoFAyH0bwxc58MNunDN/twbenQ/iWsLLkxalquJ7LQ5W4bOANbkdeaCc/vHGYpWCLklQIkdLoKTcvDx0oQFI6XvhUshSD4s8kTPA6N+zZSRSCGV95XTQMlHTJ6H2KG7mooJKJ5VBztJLYFW0Isu0BQDH0u+IdlsH/uwMbwuMdCim9rx0iFlMNXD+vklcDZJHG7Bj8yDWehDQ71VMxgJOCRtEKqjVrqI5PfvGzbhV9ejBRX5/B8+51HJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j9g1eef5Mhx82JSWbsdv3g6wgmZV5MHnTvk0yfFkYs=;
 b=9J8utZ6EdR+GmFF94xIsAJMQimVTATBMkdHSNfVr1CTMFyw8bXI90N9LxdzEhLhI7/y9nHB7j+3MAag4m0kSVTo5ETMzs2FhPhJzbnA/ASrpfQp6C/0hYpex1JbH44d5XD442u7vG9CwBj6dmMBRq5qXWFzMy6sVtR33PKpWZXk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <1369a435-ad92-3bbd-60e4-27c1e49c1bc9@arm.com>
Date: Mon, 26 Sep 2022 14:20:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/12] xen/arm: add cache coloring initialization
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 julien@xen.org, stefano.stabellini@amd.com, wl@xen.org,
 marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-2-carlo.nonato@minervasys.tech>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220826125111.152261-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|DB4PR08MB9312:EE_|VE1EUR03FT062:EE_|GV2PR08MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 7851bdd8-e2b6-4b25-aa36-08da9f874a7a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3fTDWgm1lNmcgPJPjy/J4LnVJUpKB2zaue4NFFZG8USjlu1E6yIwIsFePJuDLEVJoV0D6VK4am9pI8DewRiOjYvX/aDHEBWwwSnei+nK9IGKA+p0SgmhqszDv0GOX3BbDSL2SEreWte5wTm+s6B56irAmm6lSODhXZ2vpTR7iYkj5XNZscSmu+NyZt4dDAbJe6T5OnuDFJ6zqSbjMpPKdIXD9dJ2ufk8H4JemEOyqLjphgHp/4ZXj8JSFiGFQiPCz0G11weM6DLX23/TdOmAMrtmL8+EyT8xRYaUdUzR6CFD0CGVlAVDwfZIF3Yx3jOl1kdkX8dxZv0epZSVyFXud1f5l4lrULijKxPl8UO9DiDjPxr2ff9o9MJVj+20Oem9cFX+kTqxemdaQCBxH2LmGLqjUx1MTpIhjK0gtgApit4pKhijMBVAyfbX6/wquT7Rt6/71oDYd+VuU2yrWMv+3HOmNBfNxgkbOWOm9b15j8hlmnlfc6KsH8kqAlJq8ZNcArgIw9utcEudPMLMgpkaJrRncN/AYit+HKIqqM6QoSBXS4Zhls5R17y23UYAaOo4J4F6UBzujvxdMqNm8u1HGW3tFkXay5CjhMIteh4MyGaOGwFK4Q1ILy5V8bM98abOeiL+gqQuwsvdrHc8B92SdHF4WwcYeuHNIr0Lz+ySdC7SxKqI4+y2C6cEybg5o6ltRJ4TukUZ5heDXoH76vIHYiPzEux/p/Yau2UVHF0iOc+Vv4QbIDj8xgum6bG1GlJQNQ8CHiVssVnBpiWjqCX6MROmYoR3KsoaWJVugZuyWp0pbw2s0CRIrAmMf5tHWCg3F0kIEeY+GPIZ8lL/P4B5sg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(451199015)(36756003)(31696002)(86362001)(66946007)(66476007)(66556008)(6486002)(316002)(478600001)(38100700002)(41300700001)(6666004)(8676002)(31686004)(4326008)(5660300002)(7416002)(6512007)(26005)(2616005)(2906002)(30864003)(186003)(83380400001)(8936002)(6506007)(53546011)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53089b39-be50-414d-8e81-08da9f8743d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6qn0t+i4TG5gLu+PV3frdtuZff7BxJAqbRMPT/HZGtXJl0VwxErhkUsIZU9t2o2xywH/kw+dQYzP1UdyYufhJO/2tFs2wMYasNvalJylgfK8Ugn2I+w5nS6ipt8r510itvCDFiike50xLVC5iR8pN2uODwVbFFG3Ijz/MBcuByMOlxqnPXFIMXgK0/46S09gW2/XR7n6C9Uk4BebRYfDAks+Hy4xbkwTSWZFGIDdXHc/dp44sQfjOSQXiiOC9hwN3rC+tgz6l1GuJGQ5Rzt3ilHfYwoqiW2UUy2peQTH7UAFFGXCSsxVHBEhcANh/jjemA3mqCOAyghNAMlKsccfDOjClRUqK7mYuw/bg9baO9UWCF1qUV9CHhQJZQWwoWo0BV5y2SFc8pmO41AcBlAT/MjM6WswdGVWMdy6y+6IXyHmHT2wVG3sS/MHaCnedZss9jgbF+vOV2w30hdHVxcLyk5IyIu/TWhT9GHsrBs5CNQdA5OYb2uqIFhOnwMInpSPc3EsbV+ntkMWCjlfyQReqPsyylsvvcJTd3pSS9LLA4xV14j8cdydJamC+Uz3WT/gi1+1JHgadFxLTyPSbSA2b5/r4EWJlMeiRrqL2a++KbvhUcRI5FEcuti5vkypkAJJpDYf8iR3oBq7EW4IA0yMkhlIWz3b1ScwB+EbVbfMeczAOT2vXCu0hmzzQCzNf3dOOJFXiPuyublxsDRl/wpPUPPkSRLHWYHD6NbzsKCcCbjDaIsZUZOTdueQF9UTjQNECHacqIg4UspkpJqr1dxuKAK+iZsuRbUafJRri7YFoMnQDbwbQ1V1gSHn0nic0j6hiKrL8R9c5iaJQoFRthynp+d/8+qXBfXJqk8Ak02Nauw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(30864003)(5660300002)(8936002)(40460700003)(31696002)(26005)(53546011)(6512007)(40480700001)(478600001)(82310400005)(6486002)(83380400001)(6506007)(41300700001)(107886003)(6666004)(316002)(70206006)(4326008)(36756003)(336012)(186003)(70586007)(2616005)(47076005)(8676002)(31686004)(86362001)(82740400003)(81166007)(2906002)(356005)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:21:04.3713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7851bdd8-e2b6-4b25-aa36-08da9f874a7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8320

Hi Carlo,

On 2022/8/26 20:51, Carlo Nonato wrote:
> This commit adds the cache coloring support initialization, Kconfig options,
> command line parameters and the initial documentation.
> The initialization consists of an auto probing of the cache layout
> necessary to retrieve the LLC way size which is used to compute the
> number of available colors. The Dom0 colors are then initialized with default
> colors (all available ones) if not provided from the command line, and
> they are checked for bad configuration.
> 
> It also adds a debug-key to dump general cache coloring info.
> This includes LLC way size, total available colors and the mask used to
> extract colors from physical addresses.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   docs/misc/arm/cache-coloring.rst     | 112 ++++++++++++++
>   docs/misc/xen-command-line.pandoc    |  22 +++
>   xen/arch/arm/Kconfig                 |  16 ++
>   xen/arch/arm/Makefile                |   1 +
>   xen/arch/arm/coloring.c              | 222 +++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/coloring.h  |  31 ++++
>   xen/arch/arm/include/asm/processor.h |  16 ++
>   xen/arch/arm/setup.c                 |   8 +
>   8 files changed, 428 insertions(+)
>   create mode 100644 docs/misc/arm/cache-coloring.rst
>   create mode 100644 xen/arch/arm/coloring.c
>   create mode 100644 xen/arch/arm/include/asm/coloring.h
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> new file mode 100644
> index 0000000000..c7adcb0f1f
> --- /dev/null
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -0,0 +1,112 @@
> +Xen cache coloring user guide
> +=============================
> +
> +The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
> +partition for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
> +
> +In order to enable and use it, few steps are needed.
> +
> +- Enable cache coloring in Xen configuration file.
> +
> +        CONFIG_CACHE_COLORING=y
> +- If needed, change the maximum number of colors in Xen configuration file
> +  (refer to menuconfig help for value meaning and when it should be changed).
> +
> +        CONFIG_MAX_CACHE_COLORS=<n>
> +- Assign colors to Dom0 using the `Color selection format`_ (see
> +  `Coloring parameters`_ for more documentation pointers).
> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g .hosting another DomU). Cache coloring allows eliminating this
> +mutual interference, and thus guaranteeing higher and more predictable
> +performances for memory accesses.
> +The key concept underlying cache coloring is a fragmentation of the memory
> +space into a set of sub-spaces called colors that are mapped to disjoint cache
> +partitions. Technically, the whole memory space is first divided into a number
> +of subsequent regions. Then each region is in turn divided into a number of
> +subsequent sub-colors. The generic i-th color is then obtained by all the
> +i-th sub-colors in each region.
> +
> +.. raw:: html
> +
> +    <pre>
> +                            Region j            Region j+1
> +                .....................   ............
> +                .                     . .
> +                .                       .
> +            _ _ _______________ _ _____________________ _ _
> +                |     |     |     |     |     |     |
> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> +                    :                       :
> +                    :                       :...         ... .
> +                    :                            color 0
> +                    :...........................         ... .
> +                                                :
> +          . . ..................................:
> +    </pre>
> +
> +There are two pragmatic lesson to be learnt.
> +
> +1. If one wants to avoid cache interference between two domains, different
> +   colors needs to be used for their memory.
> +
> +2. Color assignment must privilege contiguity in the partitioning. E.g.,
> +   assigning colors (0,1) to domain I  and (2,3) to domain  J is better than
> +   assigning colors (0,2) to I and (1,3) to J.
> +
> +How to compute the number of colors
> +***********************************
> +
> +To compute the number of available colors for a specific platform, the size of
> +a LLC way and the page size used by Xen must be known. The first parameter can
> +be found in the processor manual or can be also computed dividing the total
> +cache size by the number of its ways. The second parameter is the minimum amount
> +of memory that can be mapped by the hypervisor, thus dividing the way size by
> +the page size, the number of total cache partitions is found. So for example,
> +an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can isolate up to 16
> +colors when pages are 4 KiB in size.
> +
> +Cache layout is probed automatically by Xen itself, but a possibility to
> +manually set the way size it's left to the user to overcome failing situations
> +or for debugging/testing purposes. See `Coloring parameters`_ section for more
> +information on that.
> +
> +Colors selection format
> +***********************
> +
> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
> +the color selection can be expressed using the same syntax. In particular a
> +comma-separated list of colors or ranges of colors is used.
> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
> +sides.
> +
> +Note that:
> + - no spaces are allowed between values.
> + - no overlapping ranges or duplicated colors are allowed.
> + - values must be written in ascending order.
> +
> +Examples:
> +
> ++---------------------+-----------------------------------+
> +|**Configuration**    |**Actual selection**               |
> ++---------------------+-----------------------------------+
> +|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
> ++---------------------+-----------------------------------+
> +|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
> ++---------------------+-----------------------------------+
> +|  0                  | [0]                               |
> ++---------------------+-----------------------------------+
> +
> +Coloring parameters
> +*******************
> +
> +LLC way size (as previously discussed) and Dom0 colors can be set using the
> +appropriate command line parameters. See the relevant documentation in
> +"docs/misc/xen-command-line.pandoc".
> \ No newline at end of file
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 9a79385a37..910ebeb2eb 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -889,6 +889,14 @@ Controls for the dom0 IOMMU setup.
>   
>       Incorrect use of this option may result in a malfunctioning system.
>   
> +### dom0-colors (arm64)
> +> `= List of [ <integer> | <integer>-<integer> ]`
> +
> +> Default: `All available colors`
> +
> +Specify dom0 color configuration. If the parameter is not set, all available
> +colors are chosen and the user is warned on Xen's serial console.
> +
>   ### dom0_ioports_disable (x86)
>   > `= List of <hex>-<hex>`
>   
> @@ -1631,6 +1639,20 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>   in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>   record with other registers.
>   
> +### llc-way-size (arm64)
> +> `= <size>`
> +
> +> Default: `Obtained from the hardware`
> +
> +Specify the way size of the Last Level Cache. This parameter is only useful with
> +cache coloring support enabled. It is an optional, expert-only parameter and it
> +is used to calculate the number of available colors on the platform. It can be
> +obtained by dividing the total LLC size by the number of its associative ways.
> +By default, the value is automatically computed by probing the hardware, but in
> +case of specific needs, it can be manually set. Those include failing probing
> +and debugging/testing purposes so that it's possibile to emulate platforms with
> +different number of supported colors.
> +
>   ### loglvl
>   > `= <level>[/<rate-limited level>]` where level is `none | error | warning | info | debug | all`
>   
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 33e004d702..8acff9682c 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -131,6 +131,22 @@ config ARM64_BTI
>   	  Branch Target Identification support.
>   	  This feature is not supported in Xen.
>   
> +config CACHE_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	default n
> +	depends on ARM_64
> +
> +config MAX_CACHE_COLORS
> +	int "Maximum number of cache colors"
> +	default 128
> +	range 0 65536

Just curious. Why select 128 as default vaule here? Is it a classic 
implmenntation for Arm64 cache? And the same question for the upper 
bound 65536.

> +	depends on CACHE_COLORING
> +	help
> +	  This config value is an upper bound for the actual number of cache colors
> +	  supported by the architecture. Xen preallocates this amount of cache
> +	  colors at boot. Note that if, at any time, a color configuration with more
> +	  colors than the maximum will be employed an error will be produced.
> +
>   config TEE
>   	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>   	default n
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 4d076b278b..12940ba761 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>   obj-y += vsmc.o
>   obj-y += vpsci.o
>   obj-y += vuart.o
> +obj-$(CONFIG_CACHE_COLORING) += coloring.o
>   
>   extra-y += xen.lds
>   
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> new file mode 100644
> index 0000000000..c010ebc01b
> --- /dev/null
> +++ b/xen/arch/arm/coloring.c
> @@ -0,0 +1,222 @@
> +/*
> + * xen/arch/arm/coloring.c
> + *
> + * Coloring support for ARM
> + *
> + * Copyright (C) 2019 Xilinx Inc.
> + *
> + * Authors:
> + *    Luca Miccio <lucmiccio@gmail.com>
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <xen/errno.h>
> +#include <xen/keyhandler.h>
> +#include <xen/param.h>
> +#include <xen/types.h>
> +
> +#include <asm/coloring.h>
> +#include <asm/processor.h>
> +#include <asm/sysregs.h>
> +
> +/* Size of a LLC way */
> +static unsigned int llc_way_size;
> +/* Number of colors available in the LLC */
> +static unsigned int max_colors;
> +/* Mask to retrieve coloring relevant bits */
> +static uint64_t addr_col_mask;
> +

Maybe above variables can use __ro_after_init?

> +#define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)
> +#define addr_set_color(addr, color) (((addr) & ~addr_col_mask) \
> +                                     | ((color) << PAGE_SHIFT))
> +
> +static unsigned int dom0_colors[CONFIG_MAX_CACHE_COLORS];
> +static unsigned int dom0_num_colors;
> +
> +/*
> + * Parse the coloring configuration given in the buf string, following the
> + * syntax below.
> + *
> + * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> + * RANGE               ::= COLOR-COLOR
> + *
> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
> + */
> +static int parse_color_config(const char *buf, unsigned int *colors,
> +                              unsigned int *num_colors)
> +{
> +    const char *s = buf;
> +
> +    if ( !colors || !num_colors )
> +        return -EINVAL;
> +
> +    while ( *s != '\0' )
> +    {
> +        if ( *s != ',' )
> +        {
> +            unsigned int color, start, end;
> +
> +            start = simple_strtoul(s, &s, 0);
> +
> +            if ( *s == '-' )    /* Range */
> +            {
> +                s++;
> +                end = simple_strtoul(s, &s, 0);
> +            }
> +            else                /* Single value */
> +                end = start;
> +
> +            if ( start > end ||
> +                 *num_colors + end - start >= CONFIG_MAX_CACHE_COLORS )
> +                return -EINVAL;
> +            for ( color = start; color <= end; color++ )
> +                colors[(*num_colors)++] = color;
> +        }
> +        else
> +            s++;
> +    }
> +
> +    return *s ? -EINVAL : 0;
> +}
> +
> +size_param("llc-way-size", llc_way_size);
> +
> +static int __init parse_dom0_colors(const char *s)
> +{
> +    return parse_color_config(s, dom0_colors, &dom0_num_colors);
> +}
> +custom_param("dom0-colors", parse_dom0_colors);
> +
> +/* Return the LLC way size by probing the hardware */
> +static unsigned int get_llc_way_size(void)
> +{
> +    register_t ccsidr_el1;
> +    register_t clidr_el1 = READ_SYSREG(CLIDR_EL1);
> +    register_t csselr_el1 = READ_SYSREG(CSSELR_EL1);
> +    register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
> +    uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
> +    uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
> +    unsigned int n, line_size, num_sets;
> +
> +    for ( n = CLIDR_CTYPEn_LEVELS;
> +          n != 0 && !((clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) & CLIDR_CTYPEn_MASK);
> +          n-- );
> +
> +    if ( n == 0 )
> +        return 0;
> +
> +    WRITE_SYSREG(((n - 1) & CCSELR_LEVEL_MASK) << CCSELR_LEVEL_SHIFT,
> +                 CSSELR_EL1);
> +    isb();
> +
> +    ccsidr_el1 = READ_SYSREG(CCSIDR_EL1);
> +
> +    /* Arm ARM: (Log2(Number of bytes in cache line)) - 4 */
> +    line_size = 1 << ((ccsidr_el1 & CCSIDR_LINESIZE_MASK) + 4);
> +
> +    /* If FEAT_CCIDX is enabled, CCSIDR_EL1 has a different bit layout */
> +    if ( (id_aa64mmfr2_el1 >> ID_AA64MMFR2_CCIDX_SHIFT) & 0x7 )
> +    {
> +        ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX;
> +        ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK_FEAT_CCIDX;
> +    }
> +    /* Arm ARM: (Number of sets in cache) - 1 */
> +    num_sets = ((ccsidr_el1 >> ccsidr_numsets_shift) & ccsidr_numsets_mask) + 1;
> +
> +    printk(XENLOG_INFO "LLC found: L%u (line size: %u bytes, sets num: %u)\n",
> +           n, line_size, num_sets);
> +
> +    /* Restore value in CSSELR_EL1 */
> +    WRITE_SYSREG(csselr_el1, CSSELR_EL1);
> +    isb();
> +
> +    return line_size * num_sets;
> +}
> +
> +static bool check_colors(unsigned int *colors, unsigned int num_colors)
> +{
> +    int i;

Can this one be unsigned int? just as you have done in 
set_default_domain_colors.

> +
> +    if ( num_colors > max_colors )
> +        return false;
> +
> +    for ( i = 0; i < num_colors; i++ )
> +        if ( colors[i] >= max_colors )
> +            return false;
> +
> +    return true;
> +}
> +
> +static unsigned int set_default_domain_colors(unsigned int *colors)
> +{
> +    unsigned int i;
> +
> +    if ( !colors )
> +        return 0;
> +
> +    for ( i = 0; i < max_colors; i++ )
> +        colors[i] = i;
> +    return max_colors;
> +}
> +
> +static void dump_coloring_info(unsigned char key)
> +{
> +    printk("'%c' pressed -> dumping coloring general info\n", key);
> +    printk("LLC way size: %u KiB\n", llc_way_size >> 10);
> +    printk("Number of LLC colors supported: %u\n", max_colors);
> +    printk("Address color mask: 0x%lx\n", addr_col_mask);
> +}
> +
> +bool __init coloring_init(void)
> +{
> +    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
> +    {
> +        printk(XENLOG_ERR
> +               "Probed LLC way size is 0 and no custom value provided\n");
> +        return false;
> +    }
> +
> +    max_colors = llc_way_size / PAGE_SIZE;
> +    /* The maximum number of colors must be a power of 2 in order to correctly
> +       map colors to bits of an address. */

The style of this comment might need to be adjusted.

> +    ASSERT((max_colors & (max_colors - 1)) == 0);
> +    addr_col_mask = (max_colors - 1) << PAGE_SHIFT;
> +
> +    if ( !dom0_num_colors )
> +    {
> +        printk(XENLOG_WARNING
> +               "Dom0 color config not found. Using default (all colors)\n");
> +        dom0_num_colors = set_default_domain_colors(dom0_colors);
> +    }
> +
> +    if ( !check_colors(dom0_colors, dom0_num_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad color config for Dom0\n");
> +        return false;
> +    }
> +
> +    register_keyhandler('K', dump_coloring_info, "dump coloring info", 1);
> +
> +    return true;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> new file mode 100644
> index 0000000000..dd7eff5f07
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -0,0 +1,31 @@
> +/*
> + * xen/arm/include/asm/coloring.h
> + *
> + * Coloring support for ARM
> + *
> + * Copyright (C) 2019 Xilinx Inc.
> + *
> + * Authors:
> + *    Luca Miccio <lucmiccio@gmail.com>
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef __ASM_ARM_COLORING_H__
> +#define __ASM_ARM_COLORING_H__
> +
> +#include <xen/init.h>
> +
> +bool __init coloring_init(void);
> +
> +#endif /* !__ASM_ARM_COLORING_H__ */
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 1dd81d7d52..85ff0caf1e 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -18,6 +18,22 @@
>   #define CTR_IDC_SHIFT       28
>   #define CTR_DIC_SHIFT       29
>   
> +/* CCSIDR Current Cache Size ID Register */
> +#define CCSIDR_LINESIZE_MASK            0x7
> +#define CCSIDR_NUMSETS_SHIFT            13
> +#define CCSIDR_NUMSETS_MASK             0x3FFF
> +#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
> +#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  0xFFFFFF
> +
> +/* CCSELR Cache Size Selection Register */
> +#define CCSELR_LEVEL_MASK  0x7
> +#define CCSELR_LEVEL_SHIFT 1
> +
> +/* CLIDR Cache Level ID Register */
> +#define CLIDR_CTYPEn_SHIFT(n) (3 * (n - 1))
> +#define CLIDR_CTYPEn_MASK     0x7
> +#define CLIDR_CTYPEn_LEVELS   7
> +
>   #define ICACHE_POLICY_VPIPT  0
>   #define ICACHE_POLICY_AIVIVT 1
>   #define ICACHE_POLICY_VIPT   2
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 500307edc0..c02f21c0e6 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -53,6 +53,9 @@
>   #include <asm/setup.h>
>   #include <xsm/xsm.h>
>   #include <asm/acpi.h>
> +#ifdef CONFIG_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif
>   
>   struct bootinfo __initdata bootinfo;
>   
> @@ -930,6 +933,11 @@ void __init start_xen(unsigned long boot_phys_offset,
>       printk("Command line: %s\n", cmdline);
>       cmdline_parse(cmdline);
>   
> +#ifdef CONFIG_CACHE_COLORING
> +    if ( !coloring_init() )
> +        panic("Xen Coloring support: setup failed\n");
> +#endif
> +
>       setup_mm();
>   
>       /* Parse the ACPI tables for possible boot-time configuration */

