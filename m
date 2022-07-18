Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2488577DA6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369378.600762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMHX-00065k-CQ; Mon, 18 Jul 2022 08:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369378.600762; Mon, 18 Jul 2022 08:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMHX-00062v-9C; Mon, 18 Jul 2022 08:39:11 +0000
Received: by outflank-mailman (input) for mailman id 369378;
 Mon, 18 Jul 2022 08:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnHU=XX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDMHW-00062n-2h
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:39:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10056.outbound.protection.outlook.com [40.107.1.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f8e22e-0675-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 10:39:08 +0200 (CEST)
Received: from AM7PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:130::24)
 by AM9PR08MB6722.eurprd08.prod.outlook.com (2603:10a6:20b:302::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 08:39:07 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::57) by AM7PR03CA0014.outlook.office365.com
 (2603:10a6:20b:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 18 Jul 2022 08:39:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 08:39:06 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 18 Jul 2022 08:39:06 +0000
Received: from 335e4c3ae968.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8A7AECC-1FDF-48FA-9518-4B23895CEA61.1; 
 Mon, 18 Jul 2022 08:38:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 335e4c3ae968.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 08:38:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5058.eurprd08.prod.outlook.com (2603:10a6:208:160::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 08:38:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:38:56 +0000
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
X-Inumbo-ID: 16f8e22e-0675-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gfuIO1/8/Da4JfFlGsu3YLUA8aOE7cxH9sC9h6wxuG+L+/OE8I/30vJiEocjK5aFXD19Ns59vyzGDhGY2nxpgcFxOCXyAZRok4KtMH5O4AkkAtTlKK71IkxD/+DMlz3QobC+k7L8hj4NufwJD4OFzNlOAyrFpdu0sFum8fHlImwluTnJIFA9/i8xmZ7Fa5iezLl2ZK1tI72NC0LVLvzOwpaau6ve7c+jNraDdeLqS6xKOwIL1KUL0fufG7StRRXLz+dxCIZgwbVp5frOaplkqah/sFyl5bp8/vrXy4QEzYnyjlbph+Qci+pJONUK1MXiV91JMZC1HTckCD07kCinPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSMW2xPomPgsPEXkhoXTJ54KGnxk4Wc+qdpif4iCmrc=;
 b=Imi1gYfbGRXnKJoKH8CyMCBup9Bkv5i/QzSaPEWVmEfiCo8xPacEN1MAhcI9VxoPIK8nBByv2fQvxDZB87i+GBLJ7Gmjop7BHCqEwAmN7srvHM1AMXpPjaJTq7nGqQdipsqTTvbCgfM2afmN9bmlJ2V5ZGcvxS2QVlNQ3JuIGI4SPG75vOocFAk+AlkTtF36eBvJhmP0AEE5gUS3qXR6ZDuKsr4M/+yQO9aqhOsP5v+ZwlYrV4XvO9QrN16oRIXZ9K9KSEkm26f3QSC4jDbIa3Tfu9W6JVHS+tfuJn1Dj/aCqSBDVVn8YUvxnFgFE/TuxFCRFsBIXSTKzKRwDdKihA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSMW2xPomPgsPEXkhoXTJ54KGnxk4Wc+qdpif4iCmrc=;
 b=t03P1t+j3E141tPBKv6+1GhW7mrT1663l9peEbVZS+EON2pnfTp0FAppmDRgWRIf86dvzVXdtvkwvkNzp+C3bzZfk2cTNIHYyzRmSkk6OCugiDC+bptLdMHJud9uZVI9USkK8QML+ClBtvmcIxAQz8ivDNXyzxLVqambFF7/xOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e64e0e2b5116f203
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbEOs+gJeK9zAM5KkvJVNLjxEc78Mfleh6eGFEE5czLd1uuzkF+OBihJjHMWZhR6QBuLTIRGunQ/LTRZkmYZAT1pOF/FmYs6AfrVX2O37kV15jovGpIL5iYObwMuRUePmhecBLg6oxr9q4eCy4TlbWspxfLvuD1DJ2MsMTf2A4dprfp7WtJKBImDy4andcqjdV+1rO49MQxoPGHRIyy1b4JUlYb/4Ish0UaHhU74nvxRkIs7mgcX33/F9GF2gNuc8DjqUDXny7MxNDhoc58m6vScugZWP85ILak18XYb+Dg23dhN/bCgAb3gcp22vz+j3/ej7LOYI9WcWrEyRGh5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSMW2xPomPgsPEXkhoXTJ54KGnxk4Wc+qdpif4iCmrc=;
 b=LaIw9six9hjanUQVki+Y4EM4F+9xUA6btdPj4qoRMeKMUZo9uo6dSxznad8T8kWeknuUmJEf/PS6IkR3cwPO9CJstdIMP/8bF866VdF3HWZrzfb1EyEeEiJq5+zKdMQPSQNLtHJqKVyUBk64pqBXPP6dDo9zFlTLefIgtqMAYbYk9XbYio7EzMSOViVHMApl3U3kcm/4LyZHSEnstouROXwbVsRlUZ+RzMRfv/knF0xRW9KHSUhwqgjCauEtH+rGytg/0eCRsxYbTNKTwikTat6dKU2hgKVHfRlehs23KJAr2af/BzNnKUNGFbxpcJnu7TOIBoP5ocuEwIB9gUzNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSMW2xPomPgsPEXkhoXTJ54KGnxk4Wc+qdpif4iCmrc=;
 b=t03P1t+j3E141tPBKv6+1GhW7mrT1663l9peEbVZS+EON2pnfTp0FAppmDRgWRIf86dvzVXdtvkwvkNzp+C3bzZfk2cTNIHYyzRmSkk6OCugiDC+bptLdMHJud9uZVI9USkK8QML+ClBtvmcIxAQz8ivDNXyzxLVqambFF7/xOk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <6dbab639-8749-1120-2006-92171897a700@arm.com>
Date: Mon, 18 Jul 2022 16:38:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220715170312.13931-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 54500ceb-dea3-4995-88d2-08da6898fa32
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB5058:EE_|VE1EUR03FT058:EE_|AM9PR08MB6722:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ya5NIUMSUK+MgJIcEa/alfEfpPdo8pQwOllnvW/L9a5oNEtY4Hg4diIdceydFjFw9hdyX23M0j9d2xVL5jxPwily04v32EBJ2PuKUeUIIrVDojzavuBs7aeSwc7tQm0QxyqE/hGxQPQwyhgLHtyiWVdK0TAylKOWwWegk+mBe0s6MfOCLLxZ4Z47Kx3hTr7yiQAE5glBcgXbAG9RAkiivWX3F7joouzAO0Qj+1/FtCdqAdS6Pz/qG0+Jm0cxMTTokNoHKheW946MOer4muHhpM9pjCFq8TSf/rHE28UgAR+BFBC6isS5FGhtPByTjSczXMksBWZV/Uzd+3DIxSTrJiftyPN1+tTzQTuXHQNMLpLYbiKGq/1qqmqkhRN/E2Sjb1Yb+Ff86AAZk46uPRCc0hRkQEAal5R9M+ynN/NqQAjmQ94MtLsscSGOoUCseGF9L4z7BGXJBZuHVT3Wk5xm1rnW8AiPkOfqe8Zc9zg5HY59CwRW4P1n4ZQ07tRtP605imcceK+GMdxQQgCfibIMm1HD84UJd/FvRJb4OlLZeTp0Zly7maqpKj6uDRXWX12lghZ368xS6L6sSEAfgNIq46TC7EHaSPtPgSowtTne9lhB8ustN2jGtZD1lLefPAc9BKN++enecfCDq9ITk+Vth6TKuPv5BbcyWVPqYb9TwmjSGiFUvgf8T5ZnMwDLLKrJDmWUeNe/ltfXQDbuIThzCYn3Q4aLc3qvhlceH0HGLUzSj1hmQgWTdE1T6Y/8UV9xSpHgYgRrycO0usBIbBr3+OBB4L/y2++DfxsxFzVvav+md7uYngC1Y3X9lUQPtuPXUGXpHTLUVrG0goshYwQ0JJRBvraaRyIaUznK1L9eyJM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(8676002)(66946007)(4326008)(66556008)(66476007)(8936002)(316002)(54906003)(36756003)(86362001)(2906002)(31686004)(38100700002)(83380400001)(26005)(186003)(6486002)(478600001)(53546011)(41300700001)(6666004)(6506007)(2616005)(6512007)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5058
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	932048ef-5659-4624-384b-08da6898f389
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	864yz7hF5fLy6GPnG8cMu0e9I7x5S5aOIM7/eHlal6k5cvYdyPJnbDihHhgYXOT3JGNVYiPdYtehxJa6MdGpzfxGeTcxHCZ6RgfdmO6Nz0ky3hgk96seMpxWTanaN6/JlbvorS63kThDfWXBbVIe4quwVhO42StykJRgLoQtmNK1sHO9hyZH3HKfqkmbMx8hlhihiHxTldfsjYXhSQQ1xMEyH2oBPT53SMOd8SIdgaYMDbgDLbrarAlRXu/xfElBxvv5TL9f1YpXPRnzkA9b8RJ7zNTj+TJlsLqx4mr1ipWKO3EDtUu7t8EX4K097D9s2Jh+lIHY8HL1I5MsBxgJvATyEi1ZOHMcHaXybPS0FiOxKG3Pgqp+o9fTQSQqjGtYGX7C6jLVEX7qxcWum4PAsoA890hy9Ytaeh9xhGrEcJFDQDTO8cHzNzEBWxlJCt7eXFGOKU/6a7Btpyi4l1AXwVpP9VCf7a5WFFD8wbCWf5LAv+vA02WT/zqAWn3s430KLmpPxuQBYJrKPWGC3TbaX4r+uE3T7vltKwkeu1o86oZ3dxSI+tGOetdGyWTENQw1IOFw8Ehslp/6soRVh+OwotHwNLRRB9TsuUcnnb8utEG8LMRRZoGZT6PsYqU1uRaWTA9D3lcH93Xao5lVE02+4IB66S+buJZBsr0n9KUqnqlSm/0lC/02AmX8A1gf6NpXbosBQQwVpKkjObWDmPx6GOmY5cBtQVwwGDzzhbEgtlmbB0GuifkdV0nbpoN6LhCPlOXV56kG5quhF2NSiv6p9pdtkhKbERFGvKunAbr1vu2VqQIk6r2hPUEsXsu6OJaAcFLrTM/bOwJWhunNbhVh0OXoJGoae1vT/QW69TTZ6cQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(40470700004)(36840700001)(83380400001)(6512007)(186003)(26005)(41300700001)(6666004)(2906002)(40460700003)(6506007)(53546011)(478600001)(36860700001)(6486002)(5660300002)(2616005)(107886003)(8936002)(31696002)(86362001)(316002)(82310400005)(356005)(82740400003)(81166007)(4326008)(8676002)(54906003)(40480700001)(70586007)(36756003)(70206006)(31686004)(336012)(47076005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:39:06.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54500ceb-dea3-4995-88d2-08da6898fa32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6722

Hi Julien,

On 2022/7/16 1:03, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> The idea is to split the range into multiple aligned power-of-2 regions
> which only needs to call free_heap_pages() once each. We check the least
> significant set bit of the start address and use its bit index as the
> order of this increment. This makes sure that each increment is both
> power-of-2 and properly aligned, which can be safely passed to
> free_heap_pages(). Of course, the order also needs to be sanity checked
> against the upper bound and MAX_ORDER.
> 
> Tested on a nested environment on c5.metal with various amount
> of RAM and CONFIG_DEBUG=n. Time for end_boot_allocator() to complete:
>              Before         After
>      - 90GB: 1445 ms         96 ms
>      -  8GB:  126 ms          8 ms
>      -  4GB:   62 ms          4 ms
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Changes in v2:
>      - Update comment
>      - Update the numbers. They are slightly better as is_contig_page()
>        has been folded in init_heap_pages().
> ---
>   xen/common/page_alloc.c | 35 ++++++++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index eedb2fed77c3..2b99801d2ea3 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1779,7 +1779,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>   
>   /*
>    * This function should only be called with valid pages from the same NUMA
> - * node.
> + * node and zone.
>    */
>   static void _init_heap_pages(const struct page_info *pg,
>                                unsigned long nr_pages,
> @@ -1806,8 +1806,22 @@ static void _init_heap_pages(const struct page_info *pg,
>   
>       while ( s < e )
>       {
> -        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
> -        s += 1UL;
> +        /*
> +         * For s == 0, we simply use the largest increment by checking the
> +         * MSB of the region size. For s != 0, we also need to ensure that the
> +         * chunk is properly sized to end at power-of-two alignment. We do this
> +         * by checking the LSB of the start address and use its index as
> +         * the increment. Both cases need to be guarded by MAX_ORDER.
> +         *
> +         * Note that the value of ffsl() and flsl() starts from 1 so we need
> +         * to decrement it by 1.
> +         */
> +        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
> +
> +        if ( s )
> +            inc_order = min(inc_order, ffsl(s) - 1);
> +        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
> +        s += (1UL << inc_order);
>       }
>   }
>   
> @@ -1844,6 +1858,9 @@ static void init_heap_pages(
>   
>       for ( i = 0; i < nr_pages; )
>       {
> +#ifdef CONFIG_SEPARATE_XENHEAP
> +        unsigned int zone = page_to_zone(pg);
> +#endif
>           unsigned int nid = phys_to_nid(page_to_maddr(pg));
>           unsigned long left = nr_pages - i;
>           unsigned long contig_pages;
> @@ -1856,6 +1873,18 @@ static void init_heap_pages(
>            */
>           for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>           {
> +            /*
> +             * No need to check for the zone when !CONFIG_SEPARATE_XENHEAP
> +             * because free_heap_pages() can only take power-of-two ranges
> +             * which never cross zone boundaries. But for separate xenheap
> +             * which is manually defined, it is possible for power-of-two
> +             * range to cross zones.
> +             */
> +#ifdef CONFIG_SEPARATE_XENHEAP
> +            if ( zone != page_to_zone(pg) )
> +                break;
> +#endif
> +
>               if ( nid != (phys_to_nid(page_to_maddr(pg))) )
>                   break;
>           }

Reviewed-by: Wei Chen <Wei.Chen@arm.com>


