Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D3577D27
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369340.600697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLmb-0007i7-Co; Mon, 18 Jul 2022 08:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369340.600697; Mon, 18 Jul 2022 08:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLmb-0007fN-8U; Mon, 18 Jul 2022 08:07:13 +0000
Received: by outflank-mailman (input) for mailman id 369340;
 Mon, 18 Jul 2022 08:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnHU=XX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDLmZ-0007fH-N8
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:07:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50052.outbound.protection.outlook.com [40.107.5.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ea2b51e-0670-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 10:07:09 +0200 (CEST)
Received: from FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::10)
 by HE1PR0802MB2363.eurprd08.prod.outlook.com (2603:10a6:3:c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 08:07:04 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::9b) by FR3P281CA0047.outlook.office365.com
 (2603:10a6:d10:4a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.10 via Frontend
 Transport; Mon, 18 Jul 2022 08:07:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 08:07:03 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 18 Jul 2022 08:07:03 +0000
Received: from f2ad9da0c612.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C7E0122-8B8C-4601-8D89-F8E9CF8CEDD7.1; 
 Mon, 18 Jul 2022 08:06:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2ad9da0c612.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 08:06:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR0802MB2367.eurprd08.prod.outlook.com (2603:10a6:800:a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 08:06:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:06:54 +0000
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
X-Inumbo-ID: 9ea2b51e-0670-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=A+y0QDEL0lXX4i7fACShDLGiKJgmWyiJiL1rN0m4kryVbTiDFLixJrpmLw4jpkgXwBHLC0EEN2Ek6AiZI+bQBKrtT3RaDa2KHTCCNoZbn3rRYU4HnK/X8/NXEHjIX1zx0hRMpWNVhNyazc6ukYOWTQVWe3Oes4WgRAsEMY+ITzbW/In0Qbg8Tk5SVCvNd3xHF5R+sjKjZixTky1CKquPxZtVavY13R0DMTgTSv7d8IA70B9DhZdT86Sb8l4MHFMw+VxcUgNLR71Q7YfijtodwTEi5VqPRPd7aV2ZjgWm/uTpgw6yqWi+KSvfPGqIJMFiRpghqjbcstTKPjmn+L6AXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG8CVJ9twEL0jibBQYHZJdG7LC/Za2m6QYKX22a9tcc=;
 b=KTFH4Esw9VllXXQGNG/7rqOI4P7VsISJ+u6Y5V/pVjwvV/BkJ/PGa1wFoL4fTQnS4k1v9kzMrLKr0XMhCtX6f7Sl+/sEe/SPAGE5kmYIZ0sdMQFJzrzo1AzB6Cn5Q7h/lZmxzEKzxDj5vgjap03Ih2HB0AS432l5MVEOiHqDDpCuvyWUcb6TQQcye1Xn4djfkSEylbBy7sg+9G1iOafudmMx6c6Y5ImUOxc5OmJ+p2cl1A96notdpWUJnXAVrR2Jk5udL3IWGyOuw7u2UrLZay/9wy9y2PjjVFKbhxVJeOTBtVwO2bYlw9C4mBJSt8nlHb9BmU1mLMHD3U2JsXOe7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG8CVJ9twEL0jibBQYHZJdG7LC/Za2m6QYKX22a9tcc=;
 b=je611WXgoGGtPbesQ7XuX7OqTHgHfSeAfsgbibiEb2Ez0CWOXp7SsMxMVt1GyJ2UEBC1TYlLC/CloaBLvGxrz+9Lc8Xw0vWLM1mjQOOSS5vB+8lxg5veeKIbz/2SYFQFu/Lp2mcy8GAZbtVg+vhmpnvIzO0ntA0Yo/f5dS9vlV0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab111e52c8fb7c37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5tiM9DfloIyvhdU7+YsiG8gux+F+gN7Jvp16D3SVwAb1C6OPqXCS6xJuU4KHU6EKkfooDmzyXAxLcUvGRsIjykO6F6Sm89YgGWQcsz0wVyS4czbv5rDzdKhWySAiN5ea3YRFk9EaHpGGJIzTqdUqeW8G716BUQPZv3ZeEJ6QlLYrq5zPXZALu0Fc//QZrMr+YFbdOFrN0Eq7IIOtnVDh+O/62FFdjfZRW45j5xf8QlGD0uakohNb96idK/B0PytKp6dn4K2sUwe5NcNY5KQcV28foyYX/vmvczfEpzHUPs1l4qzlcCLAtIHToQAW+XGVyeeDvcxbogKzL1aSwxkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG8CVJ9twEL0jibBQYHZJdG7LC/Za2m6QYKX22a9tcc=;
 b=NyTIhJoYfBjqVLwDDIdTym0mFptY7ZyIVUo1pO7R+yLvZFSd/mmlTeCtX6zpS5h87eMyomLQZx3FgyCMyP/ScNg7/gbD0AC5mbJQ2cHPXsJq3MIAv74nLNm3I+8qbgLbXK83vaQcBBfQW0UEQvFhnn4coc05cNd95L5RwLAjA0qAetgPlvADzNJ3G87h5pn9t2la4U+HxxNe+/ld7iOFOd0jwLau/AiqpC2XHqnh+bi2k3F1JH3M+ntMGGfu5HzHZ1kfRmB7QsohrXcTGak788it/My8UBSZJ8p7CZc2G7+iyHBevU8uqMglCj43TYu15xeLVJdVV7Ve/0EGfZCD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG8CVJ9twEL0jibBQYHZJdG7LC/Za2m6QYKX22a9tcc=;
 b=je611WXgoGGtPbesQ7XuX7OqTHgHfSeAfsgbibiEb2Ez0CWOXp7SsMxMVt1GyJ2UEBC1TYlLC/CloaBLvGxrz+9Lc8Xw0vWLM1mjQOOSS5vB+8lxg5veeKIbz/2SYFQFu/Lp2mcy8GAZbtVg+vhmpnvIzO0ntA0Yo/f5dS9vlV0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <0ddf67ce-fd63-9331-2579-9257f08a8f88@arm.com>
Date: Mon, 18 Jul 2022 16:06:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] xen: page_alloc: Don't open-code IS_ALIGNED()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-2-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220715170312.13931-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c0f56255-b68d-472e-272a-08da6894800c
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2367:EE_|VE1EUR03FT013:EE_|HE1PR0802MB2363:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AQilLFVmbvf2kfYndEZhyCrD8raeXr/j6JMZsHytAf9EPKh7ji5wxgsi1CWo5Ago25KmTStEk/Evqq/3WdwRdyhS9XrX79PpeNw9alNV/UMUyNLyCPrO39T3saMMPJhaAhO0+JwhpDEF2TWdE3UzFMKN5HQM/TMcv3N+xmbWcvMI/geYDY6RBNSZI5I4thP4o9LbQCIkKA26rOWKNN94ly/sjpIkd7aLlUz2RrVnzzYaK/zXFongnAfLypAzN/MYVmB8eoyvGB4zORutUOCGOwIQFe0PH2HBfvkLm+tyf1oQZZIEftaygdT4Xgw0lVuf+lkAIkcL+oM6yQe0topAD5pNmEkSwGv5LQi4iWXF43CETQdKcRcvGDTx1ZZgEVV+AMg6l1tyIc7Uis2oHTWyP3W+6j0Po6+pgrSI1YgRV2w0/3KMETTTTg44ONSndiZPdq0UnD0fyJ3BfE7Rlr/g79o1/EkRL+SsAwYDmem5kOUOQOt1AU3tysi7LeGTS4hnqCUI1gba0DqJ+qdlWcRTOYZe2i6ME4YWmri27nX6mbaE8THtwq0TNCPcnSfJJI2yAkN9cXouoGxanCOsjY/ncoP5SGHIMKR4O9dQ+Cj6ZR6BNUw2qUzs782SLR2BPvNv+ALeusBKDWN2GkAN3koMRtytZxjL6CcZSRsDDccWf3M1U2/O8LkwiY2klzSVA1gXNxT94hs+QlhZPkSStOLA2sRrl1StksF5udOBeAlDJ7/RG30lLUlhdRLGFB2xFtkrLalGuAYScwhStoRHuJ+OEcPfygBfnYBkhPP4IgnQ9kVeAj9yNNc2VA4iyb0GCbKdAMkpmk+xN9A0o8QPuM4o3pCKK+ZOtarg8lOzGioYIp4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(8936002)(5660300002)(31686004)(2906002)(54906003)(86362001)(31696002)(8676002)(66556008)(4326008)(316002)(36756003)(53546011)(26005)(6506007)(6486002)(6666004)(41300700001)(2616005)(186003)(478600001)(6512007)(83380400001)(66946007)(38100700002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d978f912-3544-4ef3-1076-08da689479f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zfol/JmEmi316PQ20csRuEkAplTCBGR59ka0LRbJwJ+gtirP4c/6zwA+Qhete3+Gptb5R8tAOCmxPWkum2MUu7nd2SUCoHRJWzBDUaQlT++34AmNJ5Lw6tyMnM5EZVu30HxKhMQy+0L2MO2heytfyX6UCBjFA8b60HJu6H1gY+MpnpQgnq+02iptyfGp14QM38aRhgIfLjv0r0pP8HwuskHZR9C4iCw9OYaVwbdS2irwQmMv0QTjR3iq8r3ltFE+JLIrAp6X/5BuBnGKgyE4h9M+cMcsYIZRBp8UydV2VCbW3aEzqbBeET7X/1e1jrAYh5tbr7pNWIw+ybrHCBrK39b1hW+yGIFdIeVQxjAwJFh1nfffEgARshL9b45BdNx214geueGd5cASMXjjgpL1KdPbO8YZWHuOrMp+IYO5MEc9wkN+YsQGV3qTDnQCSAPnPDtlFFEgmW+slcmZIerKS2a9+UWeqUK+fn8cihtrAapcf5RJRxTyqeCtrXFz11aTC3uAM+aYrqAT0QH4P7d4HnZtV+B6ZyPi8OA7jrgY9hNHymLKEWSQiyE/BLet6CCwoOJurq3oGCGTrtTzIJ4gBWpanCp2yL8y6Z8iRyRC8nzc7zfZwk9ErB8HgxsSKhAYxBEyG9ShYvutl82ENpXFNE1oHSlef/XLCayId+DH2PJV7avyyzRq4f6aaQfQtAzGAcuDopp2LBBEKR55NYxQT+A4FjYPMr/h7tG3BgHU23zxKM6u7quAjsua4ZNFqYignWBCzVdcOGluOTKoL9yO0yRKI3UwuVFLcF2EvL0cY23ah30Y672KlVvCo+qBoeNCc0E3zoB0sfOsDV3hzKyebulIe70LfQFX+cUpxPJaV3Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(40470700004)(6506007)(6666004)(53546011)(41300700001)(6486002)(478600001)(186003)(83380400001)(336012)(47076005)(26005)(40480700001)(31696002)(5660300002)(82310400005)(40460700003)(2616005)(6512007)(316002)(54906003)(8676002)(70206006)(70586007)(4326008)(8936002)(31686004)(36860700001)(36756003)(81166007)(82740400003)(356005)(86362001)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:07:03.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f56255-b68d-472e-272a-08da6894800c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2363

Hi Julien,

On 2022/7/16 1:03, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> init_heap_pages() is using an open-code version of IS_ALIGNED(). Replace
> it to improve the readability of the code.
> 
> No functional change intended.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Changes in v2:
>      - Patch added
> ---
>   xen/common/page_alloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index fe0e15429af3..078c2990041d 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1823,7 +1823,7 @@ static void init_heap_pages(
>               unsigned long s = mfn_x(page_to_mfn(pg + i));
>               unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>               bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
> -                            !(s & ((1UL << MAX_ORDER) - 1)) &&
> +                            IS_ALIGNED(s, 1UL << MAX_ORDER) &&
>                               (find_first_set_bit(e) <= find_first_set_bit(s));
>               unsigned long n;
>   

LGTM.

Reviewed-by: Wei Chen <Wei.Chen@arm.com>

