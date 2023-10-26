Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFDD7D7FA2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 11:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623627.971643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwlI-0004nv-Op; Thu, 26 Oct 2023 09:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623627.971643; Thu, 26 Oct 2023 09:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwlI-0004lL-LN; Thu, 26 Oct 2023 09:34:44 +0000
Received: by outflank-mailman (input) for mailman id 623627;
 Thu, 26 Oct 2023 09:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1qvwlH-0004lE-2l
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 09:34:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e28660e9-73e2-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 11:34:39 +0200 (CEST)
Received: from DUZP191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::18)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 09:34:32 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::7c) by DUZP191CA0040.outlook.office365.com
 (2603:10a6:10:4f8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22 via Frontend
 Transport; Thu, 26 Oct 2023 09:34:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 09:34:32 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Thu, 26 Oct 2023 09:34:32 +0000
Received: from f294a52ad51d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8508488-6B08-4F48-AD2C-A491E68C6983.1; 
 Thu, 26 Oct 2023 09:34:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f294a52ad51d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Oct 2023 09:34:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 09:34:17 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7076:8afd:7afd:f9e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7076:8afd:7afd:f9e%6]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 09:34:17 +0000
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
X-Inumbo-ID: e28660e9-73e2-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZzxiIkevTjNr1eEUUJ0U8z2mg9uPGP3Tnd8XkcGOLS9/At6HWAwzncSDiglhomEyJKsQejTEB3IvF+VpArovhOs6AErT/d3OHlpA3cudQ2mmX6+6W/Mx0vhdcRZqLDQGtFO5ZvWI//01booVIA2jYa2aI0al7hohIHlz2rQxbk7YWf1fuSQL9/bjhXE6SwzQ+GB25ZrQbsn19YUfLN7cYWU0Icd9C795xQAi7Y0iNG0fYUrlki0SnZUZ6IKrpvY+4xK6XNS8APwdbG6zsjyxRyZHHDhJ6lcC8Duev1m7INsBlhaMaUvy39ZEXxf/UGs0RVQMd1uS68qQ/w4zU+da4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B2RKwdWOC2yQLkR0u6LTr3JDGQskLhj91dMDBOs14I=;
 b=fiIrQB4ZFlOEZs7pdZpIr951EXSjnVy/WFhAi8sKAt6E8LzgdvfDYPXjB0wmkcN6Oanq4SwYnm1B3WzzIcsRMO45oDWYdKQTmagdbaorZidU8h3iw9FH9ROX7BXG2aSdoXK5HI0EafMCIno8UXl4U8APGc9bMzAHual2t8twgFykrfZDXX0GyaU2eau1+he3bgF6opJxKvCiHIkkbps7MawjBpJfJQZr1h2d8j9x+W6b5H9C7QDflkVnpnQXDruOQ37En+6Xx7WFz2RcAwcf5MuY6O5RmDhAqBRfKS+EbPjZudLHts86kVUtksqgmn0UuTGbC3mxUFszKtS9BoblRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B2RKwdWOC2yQLkR0u6LTr3JDGQskLhj91dMDBOs14I=;
 b=U6W0fSg9npL5L7hBCImaoTl/re/D2/n/S6INckIUBPkt6wkZqXhGzfe/vIguRrBJI6T0io4rDUsbVtLPkdBtgnZdtnSNTUOPKQnId6l5diFRmLXO32TO2kP+hjmzuv+VLAaF7Vd9Na0Yfg0+D+vwxQ3Dn3M5NHBjTtj15qtgGy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8da76a4ec092c157
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMcsCWgYB93e0OYCwL9P9XzaBf6S2nx1aEkwEuff3F23VHGkw1k55/Bh9Xp5dOU9faFDrrlEzuDEjJtYnOvPeVnOchDja4if6jlA4LaObMVhN3bUC87la022YHgPs8KknPQhM6izBvak9u5oDKzmOVcxe2Nn92PoZhvtAbG8W5K5FR2ZTsh6q/4zzvkZBD5FZFrL970YdYM7sHbGVxYFtyvZdm0u950ssALPvsVjtuiE7zupPvvzdPtpvM03R24LLD4MLGHEArQyZp45nkN70r/1as5XEWm3pii7VI+9y783iR2e6XVEecUvP8d5Kbo5+C+1+zZHjguWVxvDIej8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B2RKwdWOC2yQLkR0u6LTr3JDGQskLhj91dMDBOs14I=;
 b=RjlDSpnH00qCXX2pHqAG4jhymUa4fexYHL02inJEnCgCVfrFQkhBL41DqTDkFvfRC4REc3fBhBZoZl3e70KhBIKbO7+DoZmnymSo4nutmeGx0Phoi3g6o91ETfh7lBmYgxyjRMor3UX87NRHyS9mFL1a7MLkZnszdbss21tDOk9qr4z/E58ZhVid8p/YItX/JsisVlTsgGREm37JPxNgga9K3n5S2qTNau6iBwvmwJEHYFIWXqdhKtNgM3uldvFGkSF0wotn+YA9bqgQQUzf6dY4gQtX5YV6HuSL7jUeQCgG0CUKv+TLhUTjNY6Y34hly4Dj5JsI2iGO8aNVPJ0fgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B2RKwdWOC2yQLkR0u6LTr3JDGQskLhj91dMDBOs14I=;
 b=U6W0fSg9npL5L7hBCImaoTl/re/D2/n/S6INckIUBPkt6wkZqXhGzfe/vIguRrBJI6T0io4rDUsbVtLPkdBtgnZdtnSNTUOPKQnId6l5diFRmLXO32TO2kP+hjmzuv+VLAaF7Vd9Na0Yfg0+D+vwxQ3Dn3M5NHBjTtj15qtgGy8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <f875fbff-1b66-461d-9f44-e16ed2aa44bb@arm.com>
Date: Thu, 26 Oct 2023 17:34:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/4] arm/new vgic: Add GICv3 support for NEW VGIC
Content-Language: en-US
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
 <102d39655bec312490acd5abda966b66e6962da7.1698225630.git.mykyta_poturai@epam.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <102d39655bec312490acd5abda966b66e6962da7.1698225630.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|AM9PR08MB5873:EE_|DB1PEPF00039232:EE_|PAXPR08MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc641f7-e7a5-4006-020b-08dbd606c26f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +Y3FjEJ8VFXTTVo89vmoRRVwZ7Boa9hUHbX1p+1Qlm6DvUhysKJj7IzINnDVJ7IBLdv7ri4PtEFQaPwL7XMpHrl/ONyj1tVxvqE0jpfNWTAIEQn1bZxs8LzSGvePLqE7I0MKJ4UqjOLUF2eCIRpQXq/CIyeoQ02upjrZ+ka2SHwo7vkJa/75TzqGR+LKaZCPGjNgIbL4jKowaMJ9IgbbvTO0BWYY0oXfR3gCULjwHcSZeujmNY/3uXct/slk7OdYsaPgx2t1bmNuGtiTssEYWnINcLlaXqSv+CetRqJdVMyIB9s8wfSV1sTu84pAFg5EhZJ5BiM88DuM87fyUmS+cxrET3ye1v8TvP5YZ/8J+vuhIhBNNtuVVwCEFS27gJNGFKwEWe7ZQ8Trfc3cdTOQc2E+4ubu8EkuVpf21HI0iuBaI7qSSZ6hhtwcNNxPg3ARwDd8+NXfv8QUEfmXNR/U8x0a78NbtDgB1YJvrwP75Rj9eVf1YCOK/Yc9jF1LDdHnFNQFb7qhrdrlQ57Deo9fhtp43GzNe2Rb/WfbJzug5kbm7Mfac/s44Fpse84Is3pfYRK9zxY9/QUQqkliIzuEJZU4Lz+B9EtuHXrDy0xXmb9/lz3xlGqxdmr+XDMVzMhM9vYZ2LzabIho1FmswUzVP7cOsfwM1W3LLzvk/EPuFvh65XedJMzFFQqbS7SFjcX9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(41300700001)(66946007)(66556008)(38100700002)(66899024)(26005)(36756003)(2616005)(30864003)(8936002)(4326008)(8676002)(5660300002)(316002)(54906003)(110136005)(2906002)(6512007)(6506007)(53546011)(31696002)(6666004)(478600001)(86362001)(66476007)(6486002)(83380400001)(31686004)(2004002)(43740500002)(45980500001)(579004)(559001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb30414f-8f69-4b35-b719-08dbd606b95d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X+7AjD0AAwgGSYNmPB/diRhWmPSUYBLK0s+d6QD+GtsBUftZTUX1lozEm6mfbjYk/qGaqdk6a1izeF/4GdBaL1LEpdEGKMKM5eEFP6VdmgJWiZqqa5zlgWSbt3kSvYwLzb4k19H5+n6M0+Hck5ZkNEX4t2giJ8O6HSb86FyeM9TNIDnCph+swRoi6Tj2+80S9pkZtoLQDdK7+dZoWmUAlnBObXlplp1C4UkO5FA5mISCQQM7GfaoaQKZWCZ1lumjYdsSDc4d/oBv3jTS7QhBYJsdQWHkaWmg1vTz7r8WwMuvpnUZEnAFVXIkuj/rD2JPi4pCNyiBJq3M2nncZuvF+cnNzdzYpGh4C8R/GjeEGrZCn7jdk3v5Gfzl2mtDwEQ1nSALAjpami9yk6RXT4LD8OXFNp0Hr6Ir/SN/JfesH0QLSGOiujjxnuvmEzsVma1UuRx3WwubyQ6RL6ndj2DjoeFskHI9OYIyD/1YYdfvrHI7K46lVKVt45O3fFDyI7m43qLTxpyca4HluPXI17T1A2jMznzelDmxtybCMM+TRCx+WNDqV8zls1oj7MK/wype1P9VdjbPm4SLJ84yqwRLqKRKhh7RG/PUU8WWrxlbEewyoWBKjfpZwkd9sNduujxkx8u6uRt7wGfK1txVFofFIwe+Pz77X+60lz/jpiojSWpF4UrQduE0TR1EjcNULLZT8v0As5QO4ocwD4G71eUGz8JXzMGH1AJLwTpc6eN8mDDh1lF/3iTv+DVvrwyCc/YZBN1r3rtRaBluMfyl22Hdn/jI7wE7REJVdvxlmr1mu50G89kphZviuDzp25hnsyD5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(31686004)(40460700003)(83380400001)(66899024)(8936002)(30864003)(36860700001)(36756003)(26005)(2906002)(53546011)(8676002)(107886003)(82740400003)(47076005)(81166007)(336012)(356005)(2616005)(40480700001)(4326008)(31696002)(6506007)(478600001)(316002)(6666004)(5660300002)(70206006)(6486002)(110136005)(6512007)(41300700001)(54906003)(70586007)(86362001)(2004002)(43740500002)(579004)(559001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:34:32.3259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc641f7-e7a5-4006-020b-08dbd606c26f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382

Hi Mykyta,

On 2023/10/25 18:13, Mykyta Poturai wrote:
> Add support for basic GICv3 functionality to new vgic. The code is
> ported from Kernel version 6.0. The distributor, redistributor and
> CPU interface are ported and hooked up to the XEN interfaces.
> The code is adapted to Xen coding style and conventions.
> 
> Remove !NEW_VGIC dependency from GIC_V3 config.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/Kconfig                   |   1 -
>   xen/arch/arm/domain_build.c            |  23 +-
>   xen/arch/arm/gic-v3.c                  |   9 +
>   xen/arch/arm/include/asm/gic_v3_defs.h |  13 +-
>   xen/arch/arm/include/asm/new_vgic.h    |  32 +-
>   xen/arch/arm/vgic/Makefile             |   2 +
>   xen/arch/arm/vgic/vgic-init.c          |  12 +-
>   xen/arch/arm/vgic/vgic-mmio-v3.c       | 940 +++++++++++++++++++++++++
>   xen/arch/arm/vgic/vgic-mmio.c          |  18 +
>   xen/arch/arm/vgic/vgic-mmio.h          |  10 +
>   xen/arch/arm/vgic/vgic-v3.c            | 383 ++++++++++
>   xen/arch/arm/vgic/vgic.c               |  60 +-
>   xen/arch/arm/vgic/vgic.h               |  48 +-
>   13 files changed, 1523 insertions(+), 28 deletions(-)
>   create mode 100644 xen/arch/arm/vgic/vgic-mmio-v3.c
>   create mode 100644 xen/arch/arm/vgic/vgic-v3.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2939db429b..c91011bc15 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -82,7 +82,6 @@ config ARM_EFI
>   
>   config GICV3
>   	bool "GICv3 driver"
> -	depends on !NEW_VGIC
>   	default n if ARM_32
>   	default y if ARM_64
>   	---help---
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 49792dd590..a4c97aa0bf 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2549,7 +2549,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 *reg, *cells;
>       const struct domain *d = kinfo->d;
> -    unsigned int i, len = 0;
> +    unsigned int len = 0;
> +#ifdef CONFIG_NEW_VGIC
> +    struct vgic_redist_region *rdreg;
> +#else
> +    unsigned int i;
> +#endif
>   

I think introduce CONFIG_NEW_VGIC to generic Arm code might be not a 
good idea (here and elsewhere in the patch below). We may need a 
helper-like abstraction to hide these differences in vgic itself.

Cheers,
Wei Chen
>       res = domain_fdt_begin_node(fdt, "interrupt-controller",
>                                   vgic_dist_base(&d->arch.vgic));
> @@ -2572,9 +2577,14 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       if ( res )
>           return res;
>   
> -    /* reg specifies all re-distributors and Distributor. */
> +#ifdef CONFIG_NEW_VGIC
> +    len += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +            vgic_v3_max_rdist_count(d) * sizeof(__be32);
> +#else
>       len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
>             (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
> +#endif
> +    /* reg specifies all re-distributors and Distributor. */
>       reg = xmalloc_bytes(len);
>       if ( reg == NULL )
>           return -ENOMEM;
> @@ -2583,12 +2593,19 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>                          vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
>   
> +#ifdef CONFIG_NEW_VGIC
> +    list_for_each_entry(rdreg, &d->arch.vgic.rd_regions, list)
> +        dt_child_set_range(&cells,
> +                            GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                            rdreg->base,
> +                            rdreg->count * VGIC_V3_REDIST_SIZE);
> +#else
>       for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
>           dt_child_set_range(&cells,
>                              GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>                              d->arch.vgic.rdist_regions[i].base,
>                              d->arch.vgic.rdist_regions[i].size);
> -
> +#endif
>       res = fdt_property(fdt, "reg", reg, len);
>       xfree(reg);
>       if (res)
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 95e4f020fe..cab3f2d943 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1280,8 +1280,13 @@ static int gicv3_make_hwdom_dt_node(const struct domain *d,
>       if ( res )
>           return res;
>   
> +#ifdef CONFIG_NEW_VGIC
> +    res = fdt_property_cell(fdt, "#redistributor-regions",
> +                            vgic_v3_max_rdist_count(d));
> +#else
>       res = fdt_property_cell(fdt, "#redistributor-regions",
>                               d->arch.vgic.nr_regions);
> +#endif
>       if ( res )
>           return res;
>   
> @@ -1293,7 +1298,11 @@ static int gicv3_make_hwdom_dt_node(const struct domain *d,
>        * The hardware domain may not use all the regions. So only copy
>        * what is necessary.
>        */
> +#ifdef CONFIG_NEW_VGIC
> +    new_len = new_len * (vgic_v3_max_rdist_count(d) + 1);
> +#else
>       new_len = new_len * (d->arch.vgic.nr_regions + 1);
> +#endif
>   
>       hw_reg = dt_get_property(gic, "reg", &len);
>       if ( !hw_reg )
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 227533868f..e4e4696de3 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -25,6 +25,7 @@
>    * Common GICD registers are defined in gic.h
>    */
>   
> +#define GICD_TYPER2                  (0x00C)
>   #define GICD_STATUSR                 (0x010)
>   #define GICD_SETSPI_NSR              (0x040)
>   #define GICD_CLRSPI_NSR              (0x048)
> @@ -35,6 +36,7 @@
>   #define GICD_IROUTER                 (0x6000)
>   #define GICD_IROUTER32               (0x6100)
>   #define GICD_IROUTER1019             (0x7FD8)
> +#define GICD_IDREGS                  (0xFFD0)
>   #define GICD_PIDR2                   (0xFFE8)
>   
>   /* Common between GICD_PIDR2 and GICR_PIDR2 */
> @@ -56,6 +58,7 @@
>   #define GICD_TYPE_LPIS               (1U << 17)
>   
>   #define GICD_CTLR_RWP                (1UL << 31)
> +#define GICD_CTLR_DS                 (1U << 6)
>   #define GICD_CTLR_ARE_NS             (1U << 4)
>   #define GICD_CTLR_ENABLE_G1A         (1U << 1)
>   #define GICD_CTLR_ENABLE_G1          (1U << 0)
> @@ -89,6 +92,7 @@
>   #define GICR_INVLPIR                 (0x00A0)
>   #define GICR_INVALLR                 (0x00B0)
>   #define GICR_SYNCR                   (0x00C0)
> +#define GICR_IDREGS                  GICD_IDREGS
>   #define GICR_PIDR2                   GICD_PIDR2
>   
>   /* GICR for SGI's & PPI's */
> @@ -108,6 +112,9 @@
>   #define GICR_NSACR                   (0x0E00)
>   
>   #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
> +#define GICR_CTLR_CES                (1UL << 1)
> +#define GICR_CTLR_IR                 (1UL << 2)
> +#define GICR_CTLR_RWP                (1UL << 3)
>   
>   #define GICR_TYPER_PLPIS             (1U << 0)
>   #define GICR_TYPER_VLPIS             (1U << 1)
> @@ -131,7 +138,11 @@
>   #define GIC_BASER_NonShareable       0ULL
>   #define GIC_BASER_InnerShareable     1ULL
>   #define GIC_BASER_OuterShareable     2ULL
> +#define GIC_BASER_SHAREABILITY_MASK  3ULL
>   
> +#define GICR_PROPBASER_IDBITS_MASK   (0x1f)
> +#define GICR_PROPBASER_ADDRESS(x)    ((x) & GENMASK_ULL(51, 12))
> +#define GICR_PENDBASER_ADDRESS(x)    ((x) & GENMASK_ULL(51, 16))
>   #define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         56
>   #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK               \
>           (7ULL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
> @@ -200,7 +211,7 @@
>   #define ICH_SGI_IRQ_SHIFT            24
>   #define ICH_SGI_IRQ_MASK             0xf
>   #define ICH_SGI_TARGETLIST_MASK      0xffff
> -#define ICH_SGI_AFFx_MASK            0xff
> +#define ICH_SGI_AFFx_MASK            0xffULL
>   #define ICH_SGI_AFFINITY_LEVEL(x)    (16 * (x))
>   
>   struct rdist_region {
> diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
> index 1e76213893..ed728652de 100644
> --- a/xen/arch/arm/include/asm/new_vgic.h
> +++ b/xen/arch/arm/include/asm/new_vgic.h
> @@ -21,6 +21,9 @@
>   #include <xen/list.h>
>   #include <xen/mm.h>
>   #include <xen/spinlock.h>
> +#define INTERRUPT_ID_BITS_SPIS  10
> +#define INTERRUPT_ID_BITS_ITS   16
> +#define VGIC_PRI_BITS           5
>   
>   #define VGIC_V3_MAX_CPUS        255
>   #define VGIC_V2_MAX_CPUS        8
> @@ -31,6 +34,8 @@
>   #define VGIC_MAX_SPI            1019
>   #define VGIC_MAX_RESERVED       1023
>   #define VGIC_MIN_LPI            8192
> +#define VGIC_V3_DIST_SIZE       SZ_64K
> +#define VGIC_V3_REDIST_SIZE     (2 * SZ_64K)
>   
>   #define irq_is_ppi(irq) ((irq) >= VGIC_NR_SGIS && (irq) < VGIC_NR_PRIVATE_IRQS)
>   #define irq_is_spi(irq) ((irq) >= VGIC_NR_PRIVATE_IRQS && \
> @@ -94,6 +99,14 @@ enum iodev_type {
>       IODEV_REDIST,
>   };
>   
> +struct vgic_redist_region {
> +    uint32_t index;
> +    paddr_t base;
> +    uint32_t count; /* number of redistributors or 0 if single region */
> +    uint32_t free_index; /* index of the next free redistributor */
> +    struct list_head list;
> +};
> +
>   struct vgic_io_device {
>       gfn_t base_fn;
>       struct vcpu *redist_vcpu;
> @@ -121,11 +134,7 @@ struct vgic_dist {
>           /* either a GICv2 CPU interface */
>           paddr_t         cbase;
>           /* or a number of GICv3 redistributor regions */
> -        struct
> -        {
> -            paddr_t     vgic_redist_base;
> -            paddr_t     vgic_redist_free_offset;
> -        };
> +        struct list_head rd_regions;
>       };
>       paddr_t             csize; /* CPU interface size */
>       paddr_t             vbase; /* virtual CPU interface base address */
> @@ -174,6 +183,9 @@ struct vgic_cpu {
>        * parts of the redistributor.
>        */
>       struct vgic_io_device   rd_iodev;
> +    struct vgic_redist_region *rdreg;
> +    uint32_t rdreg_index;
> +    atomic_t syncr_busy;
>       struct vgic_io_device   sgi_iodev;
>   
>       /* Contains the attributes and gpa of the LPI pending tables. */
> @@ -186,6 +198,9 @@ struct vgic_cpu {
>   
>       /* Cache guest interrupt ID bits */
>       uint32_t num_id_bits;
> +
> +    /* GICR_CTLR.{ENABLE_LPIS,RWP} */
> +    atomic_t ctlr;
>   };
>   
>   static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
> @@ -198,6 +213,13 @@ static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
>       return vgic->dbase;
>   }
>   
> +#ifdef CONFIG_GICV3
> +struct vgic_redist_region *vgic_v3_rdist_free_slot(struct list_head *rd_regions);
> +int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 count);
> +unsigned int vgic_v3_max_rdist_count(const struct domain *d);
> +void vgic_flush_pending_lpis(struct vcpu *vcpu);
> +#endif
> +
>   #endif /* __ASM_ARM_NEW_VGIC_H */
>   
>   /*
> diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
> index 806826948e..019bfe3d07 100644
> --- a/xen/arch/arm/vgic/Makefile
> +++ b/xen/arch/arm/vgic/Makefile
> @@ -2,4 +2,6 @@ obj-y += vgic.o
>   obj-y += vgic-v2.o
>   obj-y += vgic-mmio.o
>   obj-y += vgic-mmio-v2.o
> +obj-$(CONFIG_GICV3) += vgic-v3.o
> +obj-$(CONFIG_GICV3) += vgic-mmio-v3.o
>   obj-y += vgic-init.o
> diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
> index f8d7d3a226..be35cc33ec 100644
> --- a/xen/arch/arm/vgic/vgic-init.c
> +++ b/xen/arch/arm/vgic/vgic-init.c
> @@ -107,14 +107,18 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
>       {
>       case GIC_V2:
>           *mmio_count = 1;
> +        d->arch.vgic.cbase = VGIC_ADDR_UNDEF;
>           break;
> +    case GIC_V3:
> +        *mmio_count = 2;
> +        INIT_LIST_HEAD(&d->arch.vgic.rd_regions);
> +        break;
> +
>       default:
>           BUG();
>       }
>   
>       d->arch.vgic.dbase = VGIC_ADDR_UNDEF;
> -    d->arch.vgic.cbase = VGIC_ADDR_UNDEF;
> -    d->arch.vgic.vgic_redist_base = VGIC_ADDR_UNDEF;
>   
>       return 0;
>   }
> @@ -174,7 +178,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>       if ( dist->version == GIC_V2 )
>           ret = vgic_v2_map_resources(d);
>       else
> -        ret = -ENXIO;
> +        ret = vgic_v3_map_resources(d);
>   
>       if ( ret )
>           return ret;
> @@ -207,7 +211,7 @@ int vcpu_vgic_init(struct vcpu *v)
>       if ( gic_hw_version() == GIC_V2 )
>           vgic_v2_enable(v);
>       else
> -        ret = -ENXIO;
> +        vgic_v3_enable(v);
>   
>       return ret;
>   }
> diff --git a/xen/arch/arm/vgic/vgic-mmio-v3.c b/xen/arch/arm/vgic/vgic-mmio-v3.c
> new file mode 100644
> index 0000000000..4ec6d910af
> --- /dev/null
> +++ b/xen/arch/arm/vgic/vgic-mmio-v3.c
> @@ -0,0 +1,940 @@
> +/*
> + * VGICv3 MMIO handling functions
> + * Imported from Linux ("new" KVM VGIC) and heavily adapted to Xen.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <asm/new_vgic.h>
> +#include <asm/gic_v3_defs.h>
> +#include <asm/gic_v3_its.h>
> +#include <asm/vreg.h>
> +
> +#include "asm/domain.h"
> +#include "asm/types.h"
> +#include "vgic.h"
> +#include "vgic-mmio.h"
> +
> +bool vgic_has_its(struct domain *d)
> +{
> +    struct vgic_dist *dist = &d->arch.vgic;
> +
> +    if ( dist->version != GIC_V3 )
> +        return false;
> +
> +    return dist->has_its;
> +}
> +
> +struct vcpu *mpidr_to_vcpu(struct domain *d, unsigned long mpidr)
> +{
> +    struct vcpu *vcpu;
> +
> +    mpidr &= MPIDR_HWID_MASK;
> +    for_each_vcpu(d, vcpu)
> +    {
> +        if ( mpidr == vcpuid_to_vaffinity(vcpu->vcpu_id) )
> +            return vcpu;
> +    }
> +    return NULL;
> +}
> +
> +/* extract @num bytes at @offset bytes offset in data */
> +unsigned long extract_bytes(uint64_t data, unsigned int offset,
> +                            unsigned int num)
> +{
> +    return (data >> (offset * 8)) & GENMASK_ULL(num * 8 - 1, 0);
> +}
> +
> +uint64_t update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
> +                          unsigned long val)
> +{
> +    int lower = (offset & 4) * 8;
> +    int upper = lower + 8 * len - 1;
> +
> +    reg &= ~GENMASK_ULL(upper, lower);
> +    val &= GENMASK_ULL(len * 8 - 1, 0);
> +
> +    return reg | ((u64)val << lower);
> +}
> +
> +static int match_mpidr(u64 sgi_aff, u16 sgi_cpu_mask, struct vcpu *vcpu)
> +{
> +    unsigned long affinity;
> +    int level0;
> +
> +    /*
> +     * Split the current VCPU's MPIDR into affinity level 0 and the
> +     * rest as this is what we have to compare against.
> +     */
> +    affinity = vcpuid_to_vaffinity(vcpu->vcpu_id);
> +    level0   = MPIDR_AFFINITY_LEVEL(affinity, 0);
> +    affinity &= ~MPIDR_LEVEL_MASK;
> +
> +    /* bail out if the upper three levels don't match */
> +    if ( sgi_aff != affinity )
> +        return -1;
> +
> +    /* Is this VCPU's bit set in the mask ? */
> +    if ( !(sgi_cpu_mask & BIT(level0, ULL)) )
> +        return -1;
> +
> +    return level0;
> +}
> +
> +#define SGI_AFFINITY_LEVEL(reg, level)                                         \
> +    ((((reg) & (ICH_SGI_AFFx_MASK << ICH_SGI_AFFINITY_LEVEL(level))) >>        \
> +      ICH_SGI_AFFINITY_LEVEL(level))                                           \
> +     << MPIDR_LEVEL_SHIFT(level))
> +
> +static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
> +                                  bool read)
> +{
> +    struct domain *d  = current->domain;
> +    struct vcpu *vcpu = current;
> +    struct vcpu *c_vcpu;
> +    u16 target_cpus;
> +    u64 mpidr;
> +    int sgi;
> +    int vcpu_id = vcpu->vcpu_id;
> +    bool broadcast;
> +    unsigned long flags;
> +
> +    if ( read )
> +    {
> +        gdprintk(XENLOG_WARNING, "Reading SGI1R_EL1 - WO register\n");
> +        return false;
> +    }
> +
> +    sgi         = (*r >> ICH_SGI_IRQ_SHIFT) & ICH_SGI_IRQ_MASK;
> +    broadcast   = *r & BIT(ICH_SGI_IRQMODE_SHIFT, ULL);
> +    target_cpus = (*r & ICH_SGI_TARGETLIST_MASK);
> +
> +    mpidr       = SGI_AFFINITY_LEVEL(*r, 3);
> +    mpidr |= SGI_AFFINITY_LEVEL(*r, 2);
> +    mpidr |= SGI_AFFINITY_LEVEL(*r, 1);
> +
> +    /*
> +     * We iterate over all VCPUs to find the MPIDRs matching the request.
> +     * If we have handled one CPU, we clear its bit to detect early
> +     * if we are already finished. This avoids iterating through all
> +     * VCPUs when most of the times we just signal a single VCPU.
> +     */
> +    for_each_vcpu(d, c_vcpu)
> +    {
> +        struct vgic_irq *irq;
> +
> +        /* Exit early if we have dealt with all requested CPUs */
> +        if ( !broadcast && target_cpus == 0 )
> +            break;
> +
> +        /* Don't signal the calling VCPU */
> +        if ( broadcast && c_vcpu->vcpu_id == vcpu_id )
> +            continue;
> +
> +        if ( !broadcast )
> +        {
> +            int level0;
> +
> +            level0 = match_mpidr(mpidr, target_cpus, c_vcpu);
> +            if ( level0 == -1 )
> +                continue;
> +
> +            /* remove this matching VCPU from the mask */
> +            target_cpus &= ~BIT(level0, UL);
> +        }
> +
> +        irq = vgic_get_irq(vcpu->domain, c_vcpu, sgi);
> +
> +        spin_lock_irqsave(&irq->irq_lock, flags);
> +
> +        if ( !irq->hw )
> +        {
> +            irq->pending_latch = true;
> +            vgic_queue_irq_unlock(vcpu->domain, irq, flags);
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR "HW SGIs are not implemented\n");
> +            BUG();
> +            spin_unlock_irqrestore(&irq->irq_lock, flags);
> +        }
> +
> +        vgic_put_irq(vcpu->domain, irq);
> +    }
> +
> +    return true;
> +}
> +
> +static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
> +{
> +    struct hsr_sysreg sysreg = hsr.sysreg;
> +
> +    ASSERT(hsr.ec == HSR_EC_SYSREG);
> +
> +    if ( sysreg.read )
> +        perfc_incr(vgic_sysreg_reads);
> +    else
> +        perfc_incr(vgic_sysreg_writes);
> +
> +    switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
> +    {
> +    case HSR_SYSREG_ICC_SGI1R_EL1:
> +        return vreg_emulate_sysreg(regs, hsr, vgic_v3_emulate_sgi1r);
> +
> +    default:
> +        return false;
> +    }
> +}
> +
> +bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
> +{
> +    switch ( hsr.ec )
> +    {
> +#ifdef CONFIG_ARM_64
> +    case HSR_EC_SYSREG:
> +        return vgic_v3_emulate_sysreg(regs, hsr);
> +#endif
> +    case HSR_EC_CP15_64:
> +        printk(XENLOG_ERR
> +               "vgic_v3_emulate_reg: HSR_EC_CP15_64 not implemented");
> +        BUG();
> +        break;
> +    default:
> +        return false;
> +    }
> +}
> +
> +/*
> + * The Revision field in the IIDR have the following meanings:
> + *
> + * Revision 2: Interrupt groups are guest-configurable and signaled using
> + *            their configured groups.
> + */
> +
> +static unsigned long vgic_mmio_read_v3_misc(struct vcpu *vcpu, paddr_t addr,
> +                                            unsigned int len)
> +{
> +    struct vgic_dist *vgic = &vcpu->domain->arch.vgic;
> +    uint32_t value         = 0;
> +
> +    switch ( addr & 0x0c )
> +    {
> +    case GICD_CTLR:
> +        if ( vgic->enabled )
> +            value |= GICD_CTLR_ENABLE_G1A;
> +        value |= GICD_CTLR_ARE_NS | GICD_CTLR_DS;
> +        break;
> +    case GICD_TYPER:
> +        value = vgic->nr_spis + VGIC_NR_PRIVATE_IRQS;
> +        value = (value >> 5) - 1;
> +        if ( vgic_has_its(vcpu->domain) )
> +        {
> +            value |= (INTERRUPT_ID_BITS_ITS - 1) << 19;
> +            value |= GICD_TYPE_LPIS;
> +        }
> +        else
> +        {
> +            value |= (INTERRUPT_ID_BITS_SPIS - 1) << 19;
> +        }
> +        break;
> +    case GICD_TYPER2:
> +        break;
> +    case GICD_IIDR:
> +        value = (PRODUCT_ID_KVM << 24) | (VARIANT_ID_XEN << 16) |
> +                (IMPLEMENTER_ARM << 0);
> +        break;
> +    default:
> +        return 0;
> +    }
> +
> +    return value;
> +}
> +
> +static void vgic_mmio_write_v3_misc(struct vcpu *vcpu, paddr_t addr,
> +                                    unsigned int len, unsigned long val)
> +{
> +    struct vgic_dist *dist = &vcpu->domain->arch.vgic;
> +
> +    switch ( addr & 0x0c )
> +    {
> +    case GICD_CTLR:
> +    {
> +        bool was_enabled;
> +
> +        domain_lock(vcpu->domain);
> +
> +        was_enabled   = dist->enabled;
> +
> +        dist->enabled = val & GICD_CTLR_ENABLE_G1A;
> +
> +        if ( dist->enabled )
> +            vgic_kick_vcpus(vcpu->domain);
> +
> +        domain_unlock(vcpu->domain);
> +        break;
> +    }
> +    case GICD_TYPER:
> +    case GICD_TYPER2:
> +    case GICD_IIDR:
> +        /* This is at best for documentation purposes... */
> +        return;
> +    }
> +}
> +
> +static unsigned long vgic_mmio_read_irouter(struct vcpu *vcpu, paddr_t addr,
> +                                            unsigned int len)
> +{
> +    int intid            = VGIC_ADDR_TO_INTID(addr, 64);
> +    struct vgic_irq *irq = vgic_get_irq(vcpu->domain, NULL, intid);
> +    unsigned long ret    = 0;
> +
> +    if ( !irq )
> +        return 0;
> +
> +    /* The upper word is RAZ for us. */
> +    if ( !(addr & 4) )
> +        ret = extract_bytes(irq->mpidr, addr & 7, len);
> +
> +    vgic_put_irq(vcpu->domain, irq);
> +    return ret;
> +}
> +
> +static void vgic_mmio_write_irouter(struct vcpu *vcpu, paddr_t addr,
> +                                    unsigned int len, unsigned long val)
> +{
> +    int intid = VGIC_ADDR_TO_INTID(addr, 64);
> +    struct vgic_irq *irq;
> +    unsigned long flags;
> +
> +    /* The upper word is WI for us since we don't implement Aff3. */
> +    if ( addr & 4 )
> +        return;
> +
> +    irq = vgic_get_irq(vcpu->domain, NULL, intid);
> +
> +    if ( !irq )
> +        return;
> +
> +    spin_lock_irqsave(&irq->irq_lock, flags);
> +
> +    /* We only care about and preserve Aff0, Aff1 and Aff2. */
> +    irq->mpidr       = val & GENMASK(23, 0);
> +    irq->target_vcpu = mpidr_to_vcpu(vcpu->domain, irq->mpidr);
> +
> +    spin_unlock_irqrestore(&irq->irq_lock, flags);
> +    vgic_put_irq(vcpu->domain, irq);
> +}
> +
> +static bool vgic_mmio_vcpu_rdist_is_last(struct vcpu *vcpu)
> +{
> +    struct vgic_dist *vgic    = &vcpu->domain->arch.vgic;
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +    struct vgic_redist_region *iter, *rdreg = vgic_cpu->rdreg;
> +
> +    if ( !rdreg )
> +        return false;
> +
> +    if ( vgic_cpu->rdreg_index < rdreg->free_index - 1 )
> +    {
> +        return false;
> +    }
> +    else if ( rdreg->count && vgic_cpu->rdreg_index == (rdreg->count - 1) )
> +    {
> +        struct list_head *rd_regions = &vgic->rd_regions;
> +        paddr_t end = rdreg->base + rdreg->count * VGIC_V3_REDIST_SIZE;
> +
> +        /*
> +         * the rdist is the last one of the redist region,
> +         * check whether there is no other contiguous rdist region
> +         */
> +        list_for_each_entry(iter, rd_regions, list)
> +        {
> +            if ( iter->base == end && iter->free_index > 0 )
> +                return false;
> +        }
> +    }
> +    return true;
> +}
> +
> +static unsigned long vgic_mmio_read_v3r_typer(struct vcpu *vcpu, paddr_t addr,
> +                                              unsigned int len)
> +{
> +    unsigned long mpidr = vcpuid_to_vaffinity(vcpu->vcpu_id);
> +    int target_vcpu_id  = vcpu->vcpu_id;
> +    u64 value;
> +
> +    value = (u64)(mpidr & GENMASK(23, 0)) << 32;
> +    value |= ((target_vcpu_id & 0xffff) << 8);
> +
> +    if ( vgic_has_its(vcpu->domain) )
> +        value |= GICR_TYPER_PLPIS;
> +
> +    if ( vgic_mmio_vcpu_rdist_is_last(vcpu) )
> +        value |= GICR_TYPER_LAST;
> +
> +    return extract_bytes(value, addr & 7, len);
> +}
> +
> +static unsigned long vgic_mmio_read_v3r_iidr(struct vcpu *vcpu, paddr_t addr,
> +                                             unsigned int len)
> +{
> +    return (PRODUCT_ID_KVM << 24) | (VARIANT_ID_XEN << 16) |
> +           (IMPLEMENTER_ARM << 0);
> +}
> +
> +static unsigned long vgic_mmio_read_v3_idregs(struct vcpu *vcpu, paddr_t addr,
> +                                              unsigned int len)
> +{
> +    switch ( addr & 0xfff )
> +    {
> +    case GICD_ICPIDR2:
> +        /* report a GICv3 compliant implementation */
> +        return 0x3b;
> +    }
> +
> +    return 0;
> +}
> +
> +static unsigned long vgic_mmio_read_v3r_ctlr(struct vcpu *vcpu, paddr_t addr,
> +                                             unsigned int len)
> +{
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +    unsigned long val;
> +
> +    val = atomic_read(&vgic_cpu->ctlr);
> +    val |= GICR_CTLR_IR | GICR_CTLR_CES;
> +
> +    return val;
> +}
> +
> +bool vgic_lpis_enabled(struct vcpu *vcpu)
> +{
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +
> +    return atomic_read(&vgic_cpu->ctlr) == GICR_CTLR_ENABLE_LPIS;
> +}
> +
> +/* We want to avoid outer shareable. */
> +u64 vgic_sanitise_shareability(u64 field)
> +{
> +    switch ( field )
> +    {
> +    case GIC_BASER_OuterShareable:
> +        return GIC_BASER_InnerShareable;
> +    default:
> +        return field;
> +    }
> +}
> +
> +/* Avoid any inner non-cacheable mapping. */
> +u64 vgic_sanitise_inner_cacheability(u64 field)
> +{
> +    switch ( field )
> +    {
> +    case GIC_BASER_CACHE_nCnB:
> +    case GIC_BASER_CACHE_nC:
> +        return GIC_BASER_CACHE_RaWb;
> +    default:
> +        return field;
> +    }
> +}
> +
> +/* Non-cacheable or same-as-inner are OK. */
> +u64 vgic_sanitise_outer_cacheability(u64 field)
> +{
> +    switch ( field )
> +    {
> +    case GIC_BASER_CACHE_SameAsInner:
> +    case GIC_BASER_CACHE_nC:
> +        return field;
> +    default:
> +        return GIC_BASER_CACHE_SameAsInner;
> +    }
> +}
> +
> +u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
> +                        u64 (*sanitise_fn)(u64))
> +{
> +    u64 field = (reg & field_mask) >> field_shift;
> +
> +    field     = sanitise_fn(field) << field_shift;
> +    return (reg & ~field_mask) | field;
> +}
> +
> +#define PROPBASER_RES0_MASK                                                    \
> +    (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
> +#define PENDBASER_RES0_MASK                                                    \
> +    (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |                \
> +     GENMASK_ULL(15, 12) | GENMASK_ULL(6, 0))
> +
> +static u64 vgic_sanitise_pendbaser(u64 reg)
> +{
> +    reg = vgic_sanitise_field(reg, GICR_PENDBASER_SHAREABILITY_MASK,
> +                              GICR_PENDBASER_SHAREABILITY_SHIFT,
> +                              vgic_sanitise_shareability);
> +    reg = vgic_sanitise_field(reg, GICR_PENDBASER_INNER_CACHEABILITY_MASK,
> +                              GICR_PENDBASER_INNER_CACHEABILITY_SHIFT,
> +                              vgic_sanitise_inner_cacheability);
> +    reg = vgic_sanitise_field(reg, GICR_PENDBASER_OUTER_CACHEABILITY_MASK,
> +                              GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT,
> +                              vgic_sanitise_outer_cacheability);
> +
> +    reg &= ~PENDBASER_RES0_MASK;
> +
> +    return reg;
> +}
> +
> +static u64 vgic_sanitise_propbaser(u64 reg)
> +{
> +    reg = vgic_sanitise_field(reg, GICR_PROPBASER_SHAREABILITY_MASK,
> +                              GICR_PROPBASER_SHAREABILITY_SHIFT,
> +                              vgic_sanitise_shareability);
> +    reg = vgic_sanitise_field(reg, GICR_PROPBASER_INNER_CACHEABILITY_MASK,
> +                              GICR_PROPBASER_INNER_CACHEABILITY_SHIFT,
> +                              vgic_sanitise_inner_cacheability);
> +    reg = vgic_sanitise_field(reg, GICR_PROPBASER_OUTER_CACHEABILITY_MASK,
> +                              GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT,
> +                              vgic_sanitise_outer_cacheability);
> +
> +    reg &= ~PROPBASER_RES0_MASK;
> +    return reg;
> +}
> +
> +static unsigned long vgic_mmio_read_propbase(struct vcpu *vcpu, paddr_t addr,
> +                                             unsigned int len)
> +{
> +    struct vgic_dist *dist = &vcpu->domain->arch.vgic;
> +
> +    return extract_bytes(dist->propbaser, addr & 7, len);
> +}
> +
> +static void vgic_mmio_write_propbase(struct vcpu *vcpu, paddr_t addr,
> +                                     unsigned int len, unsigned long val)
> +{
> +    struct vgic_dist *dist = &vcpu->domain->arch.vgic;
> +    u64 old_propbaser, propbaser;
> +
> +    /* Storing a value with LPIs already enabled is undefined */
> +    if ( vgic_lpis_enabled(vcpu) )
> +        return;
> +
> +    do
> +    {
> +        old_propbaser = dist->propbaser;
> +        propbaser     = old_propbaser;
> +        propbaser     = update_64bit_reg(propbaser, addr & 4, len, val);
> +        propbaser     = vgic_sanitise_propbaser(propbaser);
> +    } while ( cmpxchg64(&dist->propbaser, old_propbaser, propbaser) !=
> +              old_propbaser );
> +}
> +
> +static unsigned long vgic_mmio_read_pendbase(struct vcpu *vcpu, paddr_t addr,
> +                                             unsigned int len)
> +{
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +    u64 value                 = vgic_cpu->pendbaser;
> +
> +    value &= ~GICR_PENDBASER_PTZ;
> +
> +    return extract_bytes(value, addr & 7, len);
> +}
> +
> +static void vgic_mmio_write_pendbase(struct vcpu *vcpu, paddr_t addr,
> +                                     unsigned int len, unsigned long val)
> +{
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +    u64 old_pendbaser, pendbaser;
> +
> +    /* Storing a value with LPIs already enabled is undefined */
> +    if ( vgic_lpis_enabled(vcpu) )
> +        return;
> +
> +    do
> +    {
> +        old_pendbaser = vgic_cpu->pendbaser;
> +        pendbaser     = old_pendbaser;
> +        pendbaser     = update_64bit_reg(pendbaser, addr & 4, len, val);
> +        pendbaser     = vgic_sanitise_pendbaser(pendbaser);
> +    } while ( cmpxchg64(&vgic_cpu->pendbaser, old_pendbaser, pendbaser) !=
> +              old_pendbaser );
> +}
> +
> +static unsigned long vgic_mmio_read_sync(struct vcpu *vcpu, paddr_t addr,
> +                                         unsigned int len)
> +{
> +    return !!atomic_read(&vcpu->arch.vgic.syncr_busy);
> +}
> +
> +static const struct vgic_register_region vgic_v3_dist_registers[] = {
> +    REGISTER_DESC_WITH_LENGTH(GICD_CTLR,
> +        vgic_mmio_read_v3_misc, vgic_mmio_write_v3_misc,
> +        16, VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICD_STATUSR,
> +        vgic_mmio_read_rao, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IGROUPR,
> +        vgic_mmio_read_rao, vgic_mmio_write_wi, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISENABLER,
> +        vgic_mmio_read_enable, vgic_mmio_write_senable, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICENABLER,
> +        vgic_mmio_read_enable, vgic_mmio_write_cenable, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISPENDR,
> +        vgic_mmio_read_pending, vgic_mmio_write_spending, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICPENDR,
> +        vgic_mmio_read_pending, vgic_mmio_write_cpending, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISACTIVER,
> +        vgic_mmio_read_active, vgic_mmio_write_sactive, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICACTIVER,
> +        vgic_mmio_read_active, vgic_mmio_write_cactive,
> +        1, VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IPRIORITYR,
> +        vgic_mmio_read_priority, vgic_mmio_write_priority,
> +        8, VGIC_ACCESS_32bit | VGIC_ACCESS_8bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ITARGETSR,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
> +        VGIC_ACCESS_32bit | VGIC_ACCESS_8bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICFGR,
> +        vgic_mmio_read_config, vgic_mmio_write_config, 2,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IGRPMODR,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 1,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_IROUTER,
> +        vgic_mmio_read_irouter, vgic_mmio_write_irouter, 64,
> +        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICD_IDREGS,
> +        vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
> +        VGIC_ACCESS_32bit),
> +};
> +
> +static const struct vgic_register_region vgic_v3_rd_registers[] = {
> +    /* RD_base registers */
> +    REGISTER_DESC_WITH_LENGTH(GICR_CTLR,
> +        vgic_mmio_read_v3r_ctlr, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_STATUSR,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_IIDR,
> +        vgic_mmio_read_v3r_iidr, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_TYPER,
> +        vgic_mmio_read_v3r_typer, vgic_mmio_write_wi, 8,
> +        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_WAKER,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_PROPBASER,
> +        vgic_mmio_read_propbase, vgic_mmio_write_propbase, 8,
> +        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_PENDBASER,
> +        vgic_mmio_read_pendbase, vgic_mmio_write_pendbase, 8,
> +        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_INVLPIR,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
> +        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_INVALLR,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
> +        VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_SYNCR,
> +        vgic_mmio_read_sync, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(GICR_IDREGS,
> +        vgic_mmio_read_v3_idregs, vgic_mmio_write_wi, 48,
> +        VGIC_ACCESS_32bit),
> +    /* SGI_base registers */
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IGROUPR0,
> +        vgic_mmio_read_rao, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ISENABLER0,
> +        vgic_mmio_read_enable, vgic_mmio_write_senable, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICENABLER0,
> +        vgic_mmio_read_enable, vgic_mmio_write_cenable, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ISPENDR0,
> +        vgic_mmio_read_pending, vgic_mmio_write_spending, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICPENDR0,
> +        vgic_mmio_read_pending, vgic_mmio_write_cpending,4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ISACTIVER0,
> +        vgic_mmio_read_active, vgic_mmio_write_sactive, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICACTIVER0,
> +        vgic_mmio_read_active, vgic_mmio_write_cactive, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IPRIORITYR0,
> +        vgic_mmio_read_priority, vgic_mmio_write_priority, 32,
> +        VGIC_ACCESS_32bit | VGIC_ACCESS_8bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_ICFGR0,
> +        vgic_mmio_read_config, vgic_mmio_write_config, 8,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_IGRPMODR0,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +    REGISTER_DESC_WITH_LENGTH(SZ_64K + GICR_NSACR,
> +        vgic_mmio_read_raz, vgic_mmio_write_wi, 4,
> +        VGIC_ACCESS_32bit),
> +};
> +
> +unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
> +{
> +    dev->regions    = vgic_v3_dist_registers;
> +    dev->nr_regions = ARRAY_SIZE(vgic_v3_dist_registers);
> +
> +    return SZ_64K;
> +}
> +
> +/**
> + * vgic_register_redist_iodev - register a single redist iodev
> + * @vcpu:    The VCPU to which the redistributor belongs
> + *
> + * Register a KVM iodev for this VCPU's redistributor using the address
> + * provided.
> + *
> + * Return 0 on success, -ERRNO otherwise.
> + */
> +int vgic_register_redist_iodev(struct vcpu *vcpu)
> +{
> +    struct domain *d              = vcpu->domain;
> +    struct vgic_dist *vgic        = &d->arch.vgic;
> +    struct vgic_cpu *vgic_cpu     = &vcpu->arch.vgic;
> +    struct vgic_io_device *rd_dev = &vcpu->arch.vgic.rd_iodev;
> +    struct vgic_redist_region *rdreg;
> +    paddr_t rd_base;
> +
> +    /*
> +     * We may be creating VCPUs before having set the base address for the
> +     * redistributor region, in which case we will come back to this
> +     * function for all VCPUs when the base address is set.  Just return
> +     * without doing any work for now.
> +     */
> +    rdreg = vgic_v3_rdist_free_slot(&vgic->rd_regions);
> +    if ( !rdreg )
> +        return 0;
> +
> +    vgic_cpu->rdreg       = rdreg;
> +    vgic_cpu->rdreg_index = rdreg->free_index;
> +
> +    rd_base             = rdreg->base + rdreg->free_index * VGIC_V3_REDIST_SIZE;
> +
> +    rd_dev->base_fn     = gaddr_to_gfn(rd_base);
> +    rd_dev->iodev_type  = IODEV_REDIST;
> +    rd_dev->regions     = vgic_v3_rd_registers;
> +    rd_dev->nr_regions  = ARRAY_SIZE(vgic_v3_rd_registers);
> +    rd_dev->redist_vcpu = vcpu;
> +
> +    register_mmio_handler(d, &vgic_io_ops, rd_base, VGIC_V3_REDIST_SIZE,
> +                          rd_dev);
> +
> +    rdreg->free_index++;
> +    return 0;
> +}
> +
> +static int vgic_register_all_redist_iodevs(struct domain *d)
> +{
> +    struct vcpu *vcpu;
> +    int ret = 0;
> +
> +    for_each_vcpu(d, vcpu)
> +    {
> +        ret = vgic_register_redist_iodev(vcpu);
> +        if ( ret )
> +            break;
> +    }
> +
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Failed to register redistributor iodev\n");
> +    }
> +
> +    return ret;
> +}
> +
> +static inline size_t vgic_v3_rd_region_size(struct domain *d,
> +                                            struct vgic_redist_region *rdreg)
> +{
> +    if ( !rdreg->count )
> +        return d->max_vcpus * VGIC_V3_REDIST_SIZE;
> +    else
> +        return rdreg->count * VGIC_V3_REDIST_SIZE;
> +}
> +
> +/**
> + * vgic_v3_rdist_overlap - check if a region overlaps with any
> + * existing redistributor region
> + *
> + * @kvm: kvm handle
> + * @base: base of the region
> + * @size: size of region
> + *
> + * Return: true if there is an overlap
> + */
> +bool vgic_v3_rdist_overlap(struct domain *domain, paddr_t base, size_t size)
> +{
> +    struct vgic_dist *d = &domain->arch.vgic;
> +    struct vgic_redist_region *rdreg;
> +
> +    list_for_each_entry(rdreg, &d->rd_regions, list)
> +    {
> +        if ( (base + size > rdreg->base) &&
> +             (base < rdreg->base + vgic_v3_rd_region_size(domain, rdreg)) )
> +            return true;
> +    }
> +    return false;
> +}
> +
> +static inline bool vgic_dist_overlap(struct domain *domain, paddr_t base,
> +                                     size_t size)
> +{
> +    struct vgic_dist *d = &domain->arch.vgic;
> +
> +    return (base + size > d->dbase) && (base < d->dbase + VGIC_V3_DIST_SIZE);
> +}
> +
> +struct vgic_redist_region *vgic_v3_rdist_region_from_index(struct domain *d,
> +                                                           u32 index)
> +{
> +    struct list_head *rd_regions = &d->arch.vgic.rd_regions;
> +    struct vgic_redist_region *rdreg;
> +
> +    list_for_each_entry(rdreg, rd_regions, list)
> +    {
> +        if ( rdreg->index == index )
> +            return rdreg;
> +    }
> +    return NULL;
> +}
> +
> +/**
> + * vgic_v3_alloc_redist_region - Allocate a new redistributor region
> + *
> + * Performs various checks before inserting the rdist region in the list.
> + * Those tests depend on whether the size of the rdist region is known
> + * (ie. count != 0). The list is sorted by rdist region index.
> + *
> + * @kvm: kvm handle
> + * @index: redist region index
> + * @base: base of the new rdist region
> + * @count: number of redistributors the region is made of (0 in the old style
> + * single region, whose size is induced from the number of vcpus)
> + *
> + * Return 0 on success, < 0 otherwise
> + */
> +static int vgic_v3_alloc_redist_region(struct domain *domain, uint32_t index,
> +                                       paddr_t base, uint32_t count)
> +{
> +    struct vgic_dist *d = &domain->arch.vgic;
> +    struct vgic_redist_region *rdreg;
> +    struct list_head *rd_regions = &d->rd_regions;
> +    int nr_vcpus                 = domain->max_vcpus;
> +    size_t size                  = count ? count * VGIC_V3_REDIST_SIZE
> +                                         : nr_vcpus * VGIC_V3_REDIST_SIZE;
> +    int ret;
> +
> +    /* cross the end of memory ? */
> +    if ( base + size < base )
> +        return -EINVAL;
> +
> +    if ( list_empty(rd_regions) )
> +    {
> +        if ( index != 0 )
> +            return -EINVAL;
> +    }
> +    else
> +    {
> +        rdreg = list_last_entry(rd_regions, struct vgic_redist_region, list);
> +
> +        /* Don't mix single region and discrete redist regions */
> +        if ( !count && rdreg->count )
> +            return -EINVAL;
> +
> +        if ( !count )
> +            return -EEXIST;
> +
> +        if ( index != rdreg->index + 1 )
> +            return -EINVAL;
> +    }
> +
> +    /*
> +     * For legacy single-region redistributor regions (!count),
> +     * check that the redistributor region does not overlap with the
> +     * distributor's address space.
> +     */
> +    if ( !count && !IS_VGIC_ADDR_UNDEF(d->dbase) &&
> +         vgic_dist_overlap(domain, base, size) )
> +        return -EINVAL;
> +
> +    /* collision with any other rdist region? */
> +    if ( vgic_v3_rdist_overlap(domain, base, size) )
> +        return -EINVAL;
> +
> +    rdreg = xzalloc(struct vgic_redist_region);
> +    if ( !rdreg )
> +        return -ENOMEM;
> +
> +    rdreg->base = VGIC_ADDR_UNDEF;
> +
> +    ret         = vgic_check_iorange(rdreg->base, base, SZ_64K, size);
> +    if ( ret )
> +        goto free;
> +
> +    rdreg->base       = base;
> +    rdreg->count      = count;
> +    rdreg->free_index = 0;
> +    rdreg->index      = index;
> +
> +    list_add_tail(&rdreg->list, rd_regions);
> +    return 0;
> +free:
> +    xfree(rdreg);
> +    return ret;
> +}
> +
> +void vgic_v3_free_redist_region(struct vgic_redist_region *rdreg)
> +{
> +    list_del(&rdreg->list);
> +    xfree(rdreg);
> +}
> +
> +int vgic_v3_set_redist_base(struct domain *d, u32 index, u64 addr, u32 count)
> +{
> +    int ret;
> +
> +    ret = vgic_v3_alloc_redist_region(d, index, addr, count);
> +    if ( ret )
> +        return ret;
> +
> +    /*
> +     * Register iodevs for each existing VCPU.  Adding more VCPUs
> +     * afterwards will register the iodevs when needed.
> +     */
> +    ret = vgic_register_all_redist_iodevs(d);
> +    if ( ret )
> +    {
> +        struct vgic_redist_region *rdreg;
> +
> +        rdreg = vgic_v3_rdist_region_from_index(d, index);
> +        vgic_v3_free_redist_region(rdreg);
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
> index 5d935a7301..a96a7f8d96 100644
> --- a/xen/arch/arm/vgic/vgic-mmio.c
> +++ b/xen/arch/arm/vgic/vgic-mmio.c
> @@ -477,6 +477,21 @@ void vgic_mmio_write_config(struct vcpu *vcpu,
>       }
>   }
>   
> +int vgic_check_iorange(paddr_t ioaddr, paddr_t addr, paddr_t alignment,
> +                       paddr_t size)
> +{
> +    if ( !IS_VGIC_ADDR_UNDEF(ioaddr) )
> +        return -EEXIST;
> +
> +    if ( !IS_ALIGNED(addr, alignment) || !IS_ALIGNED(size, alignment) )
> +        return -EINVAL;
> +
> +    if ( addr + size < addr )
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +
>   static int match_region(const void *key, const void *elt)
>   {
>       const unsigned int offset = (unsigned long)key;
> @@ -619,6 +634,9 @@ int vgic_register_dist_iodev(struct domain *d, gfn_t dist_base_fn,
>       case VGIC_V2:
>           len = vgic_v2_init_dist_iodev(io_device);
>           break;
> +    case VGIC_V3:
> +        len = vgic_v3_init_dist_iodev(io_device);
> +        break;
>       default:
>           BUG();
>       }
> diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
> index 3566cf237c..c38ef51e6b 100644
> --- a/xen/arch/arm/vgic/vgic-mmio.h
> +++ b/xen/arch/arm/vgic/vgic-mmio.h
> @@ -135,4 +135,14 @@ void vgic_mmio_write_config(struct vcpu *vcpu,
>   
>   unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device *dev);
>   
> +/* extract @num bytes at @offset bytes offset in data */
> +unsigned long extract_bytes(uint64_t data, unsigned int offset,
> +			    unsigned int num);
> +
> +uint64_t update_64bit_reg(u64 reg, unsigned int offset, unsigned int len,
> +		     unsigned long val);
> +
> +int vgic_check_iorange(paddr_t ioaddr, paddr_t addr, paddr_t alignment,
> +		       paddr_t size);
> +
>   #endif
> diff --git a/xen/arch/arm/vgic/vgic-v3.c b/xen/arch/arm/vgic/vgic-v3.c
> new file mode 100644
> index 0000000000..12963d877e
> --- /dev/null
> +++ b/xen/arch/arm/vgic/vgic-v3.c
> @@ -0,0 +1,383 @@
> +/*
> + * Imported from Linux ("new" KVM VGIC) and heavily adapted to Xen.
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
> +
> +#include <asm/new_vgic.h>
> +#include <xen/guest_access.h>
> +#include <asm/gic_v3_defs.h>
> +#include <asm/gic_v3_its.h>
> +#include <asm/gic.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> +
> +#include "vgic.h"
> +
> +static struct {
> +    bool enabled;
> +    /* Distributor interface address */
> +    paddr_t dbase;
> +    /* Re-distributor regions */
> +    unsigned int nr_rdist_regions;
> +    const struct rdist_region *regions;
> +    unsigned int intid_bits; /* Number of interrupt ID bits */
> +} vgic_v3_hw_data;
> +
> +void vgic_v3_setup_hw(paddr_t dbase, unsigned int nr_rdist_regions,
> +                      const struct rdist_region *regions,
> +                      unsigned int intid_bits)
> +{
> +    vgic_v3_hw_data.enabled          = true;
> +    vgic_v3_hw_data.dbase            = dbase;
> +    vgic_v3_hw_data.nr_rdist_regions = nr_rdist_regions;
> +    vgic_v3_hw_data.regions          = regions;
> +    vgic_v3_hw_data.intid_bits       = intid_bits;
> +}
> +
> +/*
> + * transfer the content of the LRs back into the corresponding ap_list:
> + * - active bit is transferred as is
> + * - pending bit is
> + *   - transferred as is in case of edge sensitive IRQs
> + *   - set to the line-level (resample time) for level sensitive IRQs
> + */
> +void vgic_v3_fold_lr_state(struct vcpu *vcpu)
> +{
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +    unsigned int used_lrs     = vcpu->arch.vgic.used_lrs;
> +    unsigned long flags;
> +    unsigned int lr;
> +
> +    if ( !used_lrs ) /* No LRs used, so nothing to sync back here. */
> +        return;
> +
> +    gic_hw_ops->update_hcr_status(GICH_HCR_UIE, false);
> +
> +    for ( lr = 0; lr < used_lrs; lr++ )
> +    {
> +        struct gic_lr lr_val;
> +        uint32_t intid;
> +        struct vgic_irq *irq;
> +        struct irq_desc *desc = NULL;
> +
> +        gic_hw_ops->read_lr(lr, &lr_val);
> +
> +        /*
> +         * TODO: Possible optimization to avoid reading LRs:
> +         * Read the ELRSR to find out which of our LRs have been cleared
> +         * by the guest. We just need to know the IRQ number for those, which
> +         * we could save in an array when populating the LRs.
> +         * This trades one MMIO access (ELRSR) for possibly more than one (LRs),
> +         * but requires some more code to save the IRQ number and to handle
> +         * those finished IRQs according to the algorithm below.
> +         * We need some numbers to justify this: chances are that we don't
> +         * have many LRs in use most of the time, so we might not save much.
> +         */
> +        gic_hw_ops->clear_lr(lr);
> +
> +        intid = lr_val.virq;
> +        irq   = vgic_get_irq(vcpu->domain, vcpu, intid);
> +
> +        local_irq_save(flags);
> +
> +        /*
> +         * We check this here without taking the lock, because the locking
> +         * order forces us to do so. irq->hw is a "write-once" member, so
> +         * whenever we read true, the associated hardware IRQ will not go
> +         * away anymore.
> +         * TODO: rework this if possible, either by using the desc pointer
> +         * directly in struct vgic_irq or by changing the locking order.
> +         * Especially if we ever drop the assumption above.
> +         */
> +        if ( irq->hw )
> +        {
> +            desc = irq_to_desc(irq->hwintid);
> +            spin_lock(&desc->lock);
> +        }
> +
> +        spin_lock(&irq->irq_lock);
> +
> +        /*
> +         * If a hardware mapped IRQ has been handled for good, we need to
> +         * clear the _IRQ_INPROGRESS bit to allow handling of new IRQs.
> +         *
> +         * TODO: This is probably racy, but is so already in the existing
> +         * VGIC. A fix does not seem to be trivial.
> +         */
> +        if ( irq->hw && !lr_val.active && !lr_val.pending )
> +            clear_bit(_IRQ_INPROGRESS, &desc->status);
> +
> +        /* Always preserve the active bit */
> +        irq->active = lr_val.active;
> +
> +        /* Edge is the only case where we preserve the pending bit */
> +        if ( irq->config == VGIC_CONFIG_EDGE && lr_val.pending )
> +        {
> +            irq->pending_latch = true;
> +
> +            if ( vgic_irq_is_sgi(intid) )
> +                irq->source |= (1U << lr_val.virt.source);
> +        }
> +
> +        /* Clear soft pending state when level irqs have been acked. */
> +        if ( irq->config == VGIC_CONFIG_LEVEL && !lr_val.pending )
> +            irq->pending_latch = false;
> +
> +        /*
> +         * Level-triggered mapped IRQs are special because we only
> +         * observe rising edges as input to the VGIC.
> +         *
> +         * If the guest never acked the interrupt we have to sample
> +         * the physical line and set the line level, because the
> +         * device state could have changed or we simply need to
> +         * process the still pending interrupt later.
> +         *
> +         * If this causes us to lower the level, we have to also clear
> +         * the physical active state, since we will otherwise never be
> +         * told when the interrupt becomes asserted again.
> +         */
> +        if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
> +        {
> +            ASSERT(irq->hwintid >= VGIC_NR_PRIVATE_IRQS);
> +
> +            irq->line_level = gic_read_pending_state(desc);
> +
> +            if ( !irq->line_level )
> +                gic_set_active_state(desc, false);
> +        }
> +
> +        spin_unlock(&irq->irq_lock);
> +        if ( desc )
> +            spin_unlock(&desc->lock);
> +        local_irq_restore(flags);
> +
> +        vgic_put_irq(vcpu->domain, irq);
> +    }
> +
> +    gic_hw_ops->update_hcr_status(GICH_HCR_EN, false);
> +    vgic_cpu->used_lrs = 0;
> +}
> +
> +/* Requires the irq to be locked already */
> +void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr)
> +{
> +    struct gic_lr lr_val = { 0 };
> +
> +    lr_val.virq          = irq->intid;
> +
> +    if ( irq_is_pending(irq) )
> +    {
> +        lr_val.pending = true;
> +
> +        if ( irq->config == VGIC_CONFIG_EDGE )
> +            irq->pending_latch = false;
> +
> +        if ( vgic_irq_is_sgi(irq->intid) &&
> +             vcpu->domain->arch.vgic.version == VGIC_V2 )
> +        {
> +            uint32_t src = ffs(irq->source);
> +
> +            BUG_ON(!src);
> +            lr_val.virt.source = (src - 1);
> +            irq->source &= ~(1 << (src - 1));
> +            if ( irq->source )
> +                irq->pending_latch = true;
> +        }
> +    }
> +
> +    lr_val.active = irq->active;
> +
> +    if ( irq->hw )
> +    {
> +        lr_val.hw_status = true;
> +        lr_val.hw.pirq   = irq->hwintid;
> +        /*
> +         * Never set pending+active on a HW interrupt, as the
> +         * pending state is kept at the physical distributor
> +         * level.
> +         */
> +        if ( irq->active && irq_is_pending(irq) )
> +            lr_val.pending = false;
> +    }
> +    else
> +    {
> +        if ( irq->config == VGIC_CONFIG_LEVEL )
> +            lr_val.virt.eoi = true;
> +    }
> +
> +    /*
> +     * Level-triggered mapped IRQs are special because we only observe
> +     * rising edges as input to the VGIC.  We therefore lower the line
> +     * level here, so that we can take new virtual IRQs.  See
> +     * vgic_v2_fold_lr_state for more info.
> +     */
> +    if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
> +        irq->line_level = false;
> +
> +    /* The GICv2 LR only holds five bits of priority. */
> +    lr_val.priority = irq->priority >> 3;
> +
> +    gic_hw_ops->write_lr(lr, &lr_val);
> +}
> +
> +static bool vgic_v3_redist_region_full(struct vgic_redist_region *region)
> +{
> +    if ( !region->count )
> +        return false;
> +
> +    return (region->free_index >= region->count);
> +}
> +
> +/**
> + * vgic_v3_rdist_free_slot - Look up registered rdist regions and identify one
> + * which has free space to put a new rdist region.
> + *
> + * @rd_regions: redistributor region list head
> + *
> + * A redistributor regions maps n redistributors, n = region size / (2 x 64kB).
> + * Stride between redistributors is 0 and regions are filled in the index order.
> + *
> + * Return: the redist region handle, if any, that has space to map a new rdist
> + * region.
> + */
> +struct vgic_redist_region *vgic_v3_rdist_free_slot(struct list_head *rd_regions)
> +{
> +    struct vgic_redist_region *rdreg;
> +
> +    list_for_each_entry(rdreg, rd_regions, list)
> +    {
> +        if ( !vgic_v3_redist_region_full(rdreg) )
> +            return rdreg;
> +    }
> +    return NULL;
> +}
> +
> +unsigned int vgic_v3_max_rdist_count(const struct domain *d)
> +{
> +    /*
> +     * Normally there is only one GICv3 redistributor region.
> +     * The GICv3 DT binding provisions for multiple regions, since there are
> +     * platforms out there which need those (multi-socket systems).
> +     * For domain using the host memory layout, we have to live with the MMIO
> +     * layout the hardware provides, so we have to copy the multiple regions
> +     * - as the first region may not provide enough space to hold all
> +     * redistributors we need.
> +     * All the other domains will get a constructed memory map, so we can go
> +     * with the architected single redistributor region.
> +     */
> +    return domain_use_host_layout(d) ? vgic_v3_hw_data.nr_rdist_regions
> +                                     : GUEST_GICV3_RDIST_REGIONS;
> +}
> +
> +int vgic_register_redist_iodev(struct vcpu *vcpu);
> +
> +void vgic_v3_enable(struct vcpu *vcpu)
> +{
> +    /* Get the show on the road... */
> +    vgic_register_redist_iodev(vcpu);
> +    gic_hw_ops->update_hcr_status(GICH_HCR_EN, true);
> +}
> +
> +int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_irq *irq)
> +{
> +    struct vcpu *vcpu;
> +    int byte_offset, bit_nr;
> +    paddr_t pendbase, ptr;
> +    bool status;
> +    u8 val;
> +    int ret;
> +    unsigned long flags;
> +
> +retry:
> +    vcpu = irq->target_vcpu;
> +    if ( !vcpu )
> +        return 0;
> +
> +    pendbase    = GICR_PENDBASER_ADDRESS(vcpu->arch.vgic.pendbaser);
> +
> +    byte_offset = irq->intid / BITS_PER_BYTE;
> +    bit_nr      = irq->intid % BITS_PER_BYTE;
> +    ptr         = pendbase + byte_offset;
> +
> +    ret         = access_guest_memory_by_gpa(d, ptr, &val, 1, false);
> +    if ( ret )
> +        return ret;
> +
> +    status = val & (1 << bit_nr);
> +
> +    spin_lock_irqsave(&irq->irq_lock, flags);
> +    if ( irq->target_vcpu != vcpu )
> +    {
> +        spin_unlock_irqrestore(&irq->irq_lock, flags);
> +        goto retry;
> +    }
> +    irq->pending_latch = status;
> +    vgic_queue_irq_unlock(vcpu->domain, irq, flags);
> +
> +    if ( status )
> +    {
> +        /* clear consumed data */
> +        val &= ~(1 << bit_nr);
> +        ret = access_guest_memory_by_gpa(d, ptr, &val, 1, true);
> +        if ( ret )
> +            return ret;
> +    }
> +    return 0;
> +}
> +
> +int vgic_v3_map_resources(struct domain *d)
> +{
> +    int rdist_count, i, ret;
> +
> +    /* Allocate memory for Re-distributor regions */
> +    rdist_count = vgic_v3_max_rdist_count(d);
> +
> +    /*
> +     * For domain using the host memory layout, it gets the hardware
> +     * address.
> +     * Other domains get the virtual platform layout.
> +     */
> +    if ( domain_use_host_layout(d) )
> +    {
> +        d->arch.vgic.dbase = vgic_v3_hw_data.dbase;
> +
> +        for ( i = 0; i < vgic_v3_hw_data.nr_rdist_regions; i++ )
> +        {
> +            vgic_v3_set_redist_base(d, i, vgic_v3_hw_data.regions[i].base,
> +                                    vgic_v3_hw_data.regions[i].size /
> +                                        GICV3_GICR_SIZE);
> +        }
> +    }
> +    else
> +    {
> +        d->arch.vgic.dbase = GUEST_GICV3_GICD_BASE;
> +
> +        /* A single Re-distributor region is mapped for the guest. */
> +        BUILD_BUG_ON(GUEST_GICV3_RDIST_REGIONS != 1);
> +
> +        /* The first redistributor should contain enough space for all CPUs */
> +        BUILD_BUG_ON((GUEST_GICV3_GICR0_SIZE / GICV3_GICR_SIZE) <
> +                     MAX_VIRT_CPUS);
> +        vgic_v3_set_redist_base(d, 0, GUEST_GICV3_GICR0_BASE,
> +                                GUEST_GICV3_GICR0_SIZE / GICV3_GICR_SIZE);
> +    }
> +
> +    /* Register mmio handle for the Distributor */
> +    ret =
> +        vgic_register_dist_iodev(d, gaddr_to_gfn(d->arch.vgic.dbase), VGIC_V3);
> +
> +    d->arch.vgic.ready = true;
> +
> +    return 0;
> +}
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index b9463a5f27..05e6af4384 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -151,6 +151,28 @@ void vgic_put_irq(struct domain *d, struct vgic_irq *irq)
>       xfree(irq);
>   }
>   
> +void vgic_flush_pending_lpis(struct vcpu *vcpu)
> +{
> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> +    struct vgic_irq *irq, *tmp;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&vgic_cpu->ap_list_lock, flags);
> +
> +    list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list)
> +    {
> +        if ( irq->intid >= VGIC_MIN_LPI )
> +        {
> +            spin_lock(&irq->irq_lock);
> +            list_del(&irq->ap_list);
> +            irq->vcpu = NULL;
> +            spin_unlock(&irq->irq_lock);
> +            vgic_put_irq(vcpu->domain, irq);
> +        }
> +    }
> +
> +    spin_unlock_irqrestore(&vgic_cpu->ap_list_lock, flags);
> +}
>   /**
>    * vgic_target_oracle() - compute the target vcpu for an irq
>    * @irq:    The irq to route. Must be already locked.
> @@ -520,7 +542,14 @@ retry:
>   
>   static void vgic_fold_lr_state(struct vcpu *vcpu)
>   {
> -    vgic_v2_fold_lr_state(vcpu);
> +    if ( vcpu->domain->arch.vgic.version == GIC_V2 )
> +    {
> +        vgic_v2_fold_lr_state(vcpu);
> +    }
> +    else
> +    {
> +        vgic_v3_fold_lr_state(vcpu);
> +    }
>   }
>   
>   /* Requires the irq_lock to be held. */
> @@ -529,7 +558,14 @@ static void vgic_populate_lr(struct vcpu *vcpu,
>   {
>       ASSERT(spin_is_locked(&irq->irq_lock));
>   
> -    vgic_v2_populate_lr(vcpu, irq, lr);
> +    if ( vcpu->domain->arch.vgic.version == GIC_V2 )
> +    {
> +        vgic_v2_populate_lr(vcpu, irq, lr);
> +    }
> +    else
> +    {
> +        vgic_v3_populate_lr(vcpu, irq, lr);
> +    }
>   }
>   
>   static void vgic_set_underflow(struct vcpu *vcpu)
> @@ -851,9 +887,13 @@ struct irq_desc *vgic_get_hw_irq_desc(struct domain *d, struct vcpu *v,
>   
>   bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
>   {
> -    ASSERT(current->domain->arch.vgic.version == GIC_V3);
> -
> -    return false;
> +    switch ( current->domain->arch.vgic.version )
> +    {
> +    case GIC_V3:
> +        return vgic_v3_emulate_reg(regs, hsr);
> +    default:
> +        return false;
> +    }
>   }
>   
>   /*
> @@ -950,6 +990,8 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
>       {
>       case XEN_DOMCTL_CONFIG_GIC_V2:
>           return VGIC_V2_MAX_CPUS;
> +    case XEN_DOMCTL_CONFIG_GIC_V3:
> +        return VGIC_V3_MAX_CPUS;
>   
>       default:
>           return 0;
> @@ -957,14 +999,6 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
>   }
>   
>   #ifdef CONFIG_GICV3
> -/* Dummy implementation to allow building without actual vGICv3 support. */
> -void vgic_v3_setup_hw(paddr_t dbase,
> -                      unsigned int nr_rdist_regions,
> -                      const struct rdist_region *regions,
> -                      unsigned int intid_bits)
> -{
> -    panic("New VGIC implementation does not yet support GICv3\n");
> -}
>   #endif
>   
>   /*
> diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
> index c6bc3509a5..aca977a5c9 100644
> --- a/xen/arch/arm/vgic/vgic.h
> +++ b/xen/arch/arm/vgic/vgic.h
> @@ -68,7 +68,53 @@ int vgic_v2_map_resources(struct domain *d);
>   int vgic_register_dist_iodev(struct domain *d, gfn_t dist_base_fn,
>                                enum vgic_type);
>   
> -#endif
> +#ifdef CONFIG_GICV3
> +void vgic_v3_fold_lr_state(struct vcpu *vcpu);
> +void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr);
> +void vgic_v3_enable(struct vcpu *vcpu);
> +int vgic_v3_map_resources(struct domain *d);
> +bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr);
> +int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_irq *irq);
> +bool vgic_lpis_enabled(struct vcpu *vcpu);
> +u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
> +			u64 (*sanitise_fn)(u64));
> +u64 vgic_sanitise_shareability(u64 field);
> +u64 vgic_sanitise_inner_cacheability(u64 field);
> +u64 vgic_sanitise_outer_cacheability(u64 field);
> +unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
> +#else
> +static inline void vgic_v3_fold_lr_state(struct vcpu *vcpu)
> +{
> +}
> +static inline void vgic_v3_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int lr)
> +{
> +}
> +static inline void vgic_v3_enable(struct vcpu *vcpu)
> +{
> +}
> +static inline int vgic_v3_map_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +static inline bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
> +{
> +    return false;
> +}
> +static inline int vgic_v3_lpi_sync_pending_status(struct domain *d, struct vgic_irq *irq)
> +{
> +    return 0;
> +}
> +static inline bool vgic_lpis_enabled(struct vcpu *vcpu)
> +{
> +    return false;
> +}
> +static inline unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
> +{
> +    return 0;
> +}
> +#endif /* CONFIG_GICV3 */
> +
> +#endif /* __XEN_ARM_VGIC_VGIC_H__ */
>   
>   /*
>    * Local variables:

