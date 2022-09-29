Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780D5EF345
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413613.657371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqb1-0003ks-VY; Thu, 29 Sep 2022 10:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413613.657371; Thu, 29 Sep 2022 10:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqb1-0003hX-Rd; Thu, 29 Sep 2022 10:16:47 +0000
Received: by outflank-mailman (input) for mailman id 413613;
 Thu, 29 Sep 2022 10:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTqY=2A=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1odqb0-0003hO-7i
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:16:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2065.outbound.protection.outlook.com [40.107.249.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc924bd8-3fdf-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 12:16:37 +0200 (CEST)
Received: from FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::17)
 by AS8PR08MB6646.eurprd08.prod.outlook.com (2603:10a6:20b:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 10:16:41 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::d1) by FR0P281CA0099.outlook.office365.com
 (2603:10a6:d10:a9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 10:16:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 10:16:40 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 29 Sep 2022 10:16:40 +0000
Received: from ce2d016f213c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A6ED90B-257D-4A39-8A3F-5AED41A35E84.1; 
 Thu, 29 Sep 2022 10:16:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce2d016f213c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 10:16:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV2PR08MB9325.eurprd08.prod.outlook.com (2603:10a6:150:d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:16:30 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:16:30 +0000
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
X-Inumbo-ID: cc924bd8-3fdf-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gp2ha6BUKsQ9C0+K/WnSKTlliDYy82YqnDLbRbEakxBwucsS0JmoiF/0WIEWnGV0hghm2AJ/7fU11QOV4BcWo6+skUlzSSIwTScMPTKNFDnVBWCyvzd/NKVyrZNrKPwPK1cWHkvwjImyZNipUBIK0atvdwzufacMWcfitVEcQDPiPfLpnRUGq0OxP4WAtsuVuSQRsLmvvIiMhVel8614RsvhMFNfGBzdBGsDtxCLyqfmOC7ROUFH2xsxMmehUrq4VZv/pUQHIYTHCfFSrCg1pB3Hk+KmEFjjgYC3ICxeIKWdtqbNE+iAMpcFNSAO83uV6DF8sV6sUy0sW8/DBwNRfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkOnfQJNOiimrsmcpCV6O+uwz8ue26vjLsIXsPctdZ8=;
 b=RQnAIrk7xBHyauJgLLz0Olul2lVVaJ/BJ40dBTCLKVh+/BBBVlG9iv3tWF72uhuCSC0jYBvz4uHPBcwsxjqMFVwPNNelQ++lpOroiaSmte4XE48m9O3XoO0tLsmF3BP9rkRUws1GLtH01IPsvlEyEqoXwOU8R5xZVPOYYc8LK9SEiflczny2uaAllgy9xhlRyp49EXXPajz5r3yZS7HopNruDelv96zpZaH43UPdGqhEWQjeuHMIIM2qeyXKrgh0K2cw2tblJ6GkvG/jwMor8yhTFbkvjdrSMvf8knBZnNKhF2t6svUxHz8NI9nio1xBOWLh0SOhg0REKmbm2H8mZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkOnfQJNOiimrsmcpCV6O+uwz8ue26vjLsIXsPctdZ8=;
 b=tgKG9Sad8zc5qb6KUwS4SL7Jl+hGZ9qfVOq5Ew8cuZrWPqe3JwsoGw93i/gNL8Y1KM8fnF/qPawDYaxHTNRJ7R36MdQQUP4HB1p4HgdVAYC2g2uO/VW2h2iFoTyr/IWbjHLNn7Ky8wXG+sffpWOFHh0AjP39Kd0iNur/mx6XXsE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: af7643d1c2dac946
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFWcw2ucuDzCSJz7Gg78emEh0Aq6mVFB36W65pGBNK9ZIzicdGZyybKScWnB80VwxKomRlOIUWMIvBx0IHjXiOq7ozqWIuxz+2EO6wvphY5RbrGp01IoLoCBN5I7WnX9DrbQ5PhAZTg+IgUez5q7WC4NsuAHgHC0BI1zMmBqC0STHr8d3J0yJfB2m8qOiYMXwxRWvSCAca4eS3YSPI7a1lpGpN3tkbqKucyOl6j+1HpUesmdNcyU0pgIw0oWiCyEFUzYa6cGfhLudrfTjZaDzmC/faQhF4drxnPWo2lTIk8U2OkyD+vdD7vt6ZwPHtA2zq1sQDmv0OPWFu8zfglw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkOnfQJNOiimrsmcpCV6O+uwz8ue26vjLsIXsPctdZ8=;
 b=MIE8vnV8I52664Mic2wXrGO8KgPRlZu9fOvuH1xFqlEUVdFgGbxw1TV2+tmzIThDfBjZgNIUw+sLYKfcx324w/gNwffK4WyFvFvLwiz45N8Z3X8b39+mufr8Hrig/d+nClVuITkSQuDh0PoXc91AsQysU7FAo2/rW9pgrw0e8dtSLmtfSlkW59heX6zNpD3hYdzatBA2iu0d7iKDJGJdI7xrLVoc7Vl1EXe9ap52jUH19rodBChutQm7ezgPwtxxd2CBb6KmRZEAjvxBlxyHmiGrCVz7tNLh7uuVURdTrcB9lnLJvHgHtXIpqTXymtGzB2YTQNBtW8D+j3+pVczK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkOnfQJNOiimrsmcpCV6O+uwz8ue26vjLsIXsPctdZ8=;
 b=tgKG9Sad8zc5qb6KUwS4SL7Jl+hGZ9qfVOq5Ew8cuZrWPqe3JwsoGw93i/gNL8Y1KM8fnF/qPawDYaxHTNRJ7R36MdQQUP4HB1p4HgdVAYC2g2uO/VW2h2iFoTyr/IWbjHLNn7Ky8wXG+sffpWOFHh0AjP39Kd0iNur/mx6XXsE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <11496e1a-b6bc-f878-9bb7-766fcd505ac7@arm.com>
Date: Thu, 29 Sep 2022 18:16:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|GV2PR08MB9325:EE_|VE1EUR03FT022:EE_|AS8PR08MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b8ba2e-aa20-4c82-bf0a-08daa203b3b6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nitDpHFVG5pYcXAa+/YnfFsKxS36KbTsJ2Ed/svMg8TKBCGT3e4SfBU7LX9QAz4rWs33ifNfpQEFCMcDqsmo6632V4pUF9Fxi5UHa4lfebGgnYS2Dxdc5JeSaLW87AKsKgGKI7mLMzWE9kRCDi4qJC3TdXh3x4oNxrc3PhVffogvWSyVizHExHUPJgID/s1A0uazM8R8Hv7djF9prLtt52xal2URbGHHXA2Y66/7oaWnP3kHCluv5QUH0Op6buU5+O+B2bjt+ulfh6oU6vTkDBiZ8RF4DzCuiCo/OgOXzkAKkyhusJiq2HLpxHxcrpKPx2DBjpYI0llqamBkrtLvga3hVzp9tvWeUEnT1wEq/UkcBjg+gnDHAmZAzGtByv65JqdgZ8IPrmGt43aOI/c1OA4XRmdvh+1XZUsX3lbrQS0ITw0/ie10ZQc9lmy+rsJSCjtYBRI/Za3rBL2FXNoqjBXSeLdnT50eUG/1RRWBmNcHl/0rpkdKG2EdpRa0P9vyAMZNfi7t9YlFz+alFq8hpvRyfmh783Rs5JKMk7q11QzgQ2zxjVI73ROGDpIThJ8SK1bhLSejDVUyvwYp30RrCzyiLbfSZeZFz30QjxNdy5dHZQxGVynuCkaMP11C3d0uTEH8ZONxeU5nt3rrrzsEFgrsej2MLpZpBwwf7Go/lwpUGXdSsNPBGxa+JV/fRHLbdW7s+weTa3MPoWlMTbZR33RBI5JbSfJrUjetSbWk11HH68xlFt10yjuiWDMyVBTQHNiBiossndAZs6w1CtIWzd70Ed0XSNuy8utm8+ZM7ko=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(6486002)(6512007)(26005)(2616005)(6506007)(53546011)(31686004)(38100700002)(8676002)(110136005)(316002)(4326008)(86362001)(31696002)(36756003)(186003)(83380400001)(478600001)(6666004)(2906002)(5660300002)(66946007)(66556008)(66476007)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9325
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b93d55f6-c3d8-48d6-dc22-08daa203ad2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l8/8KN546srKX7C4f5ohKgKjDFQFgnuq2oPbwf9AAViWb7q5UCrD/EA2IIPTVsWy3y5wa25/H28fhxpbVJEfS7TQt8+JHkbTCByJRWkV4C91bEAbFKVV8FzqpZJlaF5k5KQ6kjSKkAgRXR/UCtTowiKf7k6l4k3oZ01foZUPL3OAxFpttRIzszG7bV8ck5hRW3lfjGxcKt21pXB79Jp5M558sUlZ+M25wJQA20HB/7Omkm1w1f8nXSczBuAdAWRzDNWwJl9yBSSz8ZoP0Ds1lZaI5cbbmJlT6WhOcsm/8MmIq73dbibVC8/liYLN/BeQtBAIMJbtCk7evk+G9zEuUgI8+Tw8TXfEaJeLTa7vTbRM3cDU1jHRDKXK1j6Pg0PuleZOPGJisRVSmxEhvqYlq71nuzJByTFFTT3SUG+LRS9NvrDtWqazLXASGu1YvCUm/ePSIvzMrI0alj+Gf2WHXluf5RvAHH7bG5D3mZH0FTpDjuoRwsmXHy6uAhibFoq0ZA6/yuWLSJNoozskJg+BDSqYJC82LIQFyi2RqSyae/2YE+vryscYZ0lLQ7NCXFk6+QNHIcCEPAvHp1n/HQV7mqRd/AWwRBbFNWUjTu7DFTa+SM4XPTs95kx7F/nYRuKKSrDYbxHWTmTAgkcmRXZajkS60qvxe8Pk5eTw/VK35JfuJeC06+bfKuELSWQcfwzxbumsTVettUytquzpHg5R+BmNgXNJwx/IFTv2wF7RMndGpHqi0ZhRQCHPCtCicgSLmL11SkUFpmawNNzK0jr4uxQQa3Y4V8TDDc9zcu3T2qGZYAFSud1oqFh8uWInQ7pT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(26005)(36860700001)(36756003)(356005)(81166007)(40480700001)(40460700003)(316002)(82740400003)(86362001)(31696002)(70586007)(6486002)(110136005)(70206006)(8936002)(2906002)(41300700001)(4326008)(8676002)(5660300002)(47076005)(2616005)(336012)(186003)(83380400001)(6666004)(6512007)(6506007)(478600001)(82310400005)(53546011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:16:40.8952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b8ba2e-aa20-4c82-bf0a-08daa203b3b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6646

Hi Juergen，

On 2022/9/28 21:03, Juergen Gross wrote:
> On 28.09.22 14:06, Jan Beulich wrote:
>> On 28.09.2022 12:58, Andrew Cooper wrote:
>>> On 28/09/2022 11:38, Jan Beulich wrote:

> 
> What about an alternative model allowing to use most of the current
> hypercalls unmodified?
> 
> We could add a new hypercall for registering hypercall buffers via
> virtual address, physical address, and size of the buffers (kind of a
> software TLB). The buffer table would want to be physically addressed
> by the hypercall, of course.
> 
> It might be interesting to have this table per vcpu (it should be
> allowed to use the same table for multiple vcpus) in order to speed
> up finding translation entries of percpu buffers.
> 
> Any hypercall buffer being addressed virtually could first tried to
> be found via the SW-TLB. This wouldn't require any changes for most
> of the hypercall interfaces. Only special cases with very large buffers
> might need indirect variants (like Jan said: via GFN lists, which could
> be passed in registered buffers).
> 
> Encrypted guests would probably want to use static percpu buffers in
> order to avoid switching the encryption state of the buffers all the
> time.
> 

I agree with this one. When we were working on Arm Realm, we were also 
concerned about how buffers in hypercalls were shared between Xen and 
realm VM. Dynamically switching between protected and unprotected (can 
be accessed by VM and Xen, could not execute code) states of memory can 
be very expensive. And these uncertainties are also very easy to cause 
security problems. We have thought about explicitly reserving a section 
of unprotected memory for the realm VM for hypercall buffers, but that 
means Xen drivers of Linux need to be modified. It's great to see the 
community starts to do design about this.


Cheers,
Wei Chen

> An unencrypted PVH/HVM domain (e.g. PVH dom0) could just define one
> giant buffer with the domain's memory size via the physical memory
> mapping of the kernel. All kmalloc() addresses would be in that region.
> 
> A buffer address not found would need to be translated like today (and
> fail for an encrypted guest).
> 
> Thoughts?
> 
> 
> Juergen

