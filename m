Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AB577CBE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369322.600675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLPr-0003di-OK; Mon, 18 Jul 2022 07:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369322.600675; Mon, 18 Jul 2022 07:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLPr-0003au-Km; Mon, 18 Jul 2022 07:43:43 +0000
Received: by outflank-mailman (input) for mailman id 369322;
 Mon, 18 Jul 2022 07:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnHU=XX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDLPp-0003ao-LA
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:43:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a1ad13-066d-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 09:43:39 +0200 (CEST)
Received: from AM5PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:206:1::46)
 by AS8PR08MB7920.eurprd08.prod.outlook.com (2603:10a6:20b:53b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 07:43:37 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::f1) by AM5PR04CA0033.outlook.office365.com
 (2603:10a6:206:1::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 18 Jul 2022 07:43:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 07:43:36 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 18 Jul 2022 07:43:36 +0000
Received: from 7b4b9f32162d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D77B9C93-39D7-4EB0-8EB2-B6D9DAF25473.1; 
 Mon, 18 Jul 2022 07:43:25 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b4b9f32162d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 07:43:25 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB7866.eurprd08.prod.outlook.com (2603:10a6:10:39d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 07:43:22 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 07:43:22 +0000
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
X-Inumbo-ID: 56a1ad13-066d-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iWFDq/6n8mTWKPCZEUkA3sgVgGj/XK66m9dI+Wxfp0mxuV64RSYN/3OsKwizs3yEQLgk8JpsOiZcz30iBTdVXpd6dWATtdWN8A3PkMGfpXEYstExAU+3az0HkCi0JN5oGnAmvPxGESl+9ifXeZvWs81t1fPxWzwre28AOrflglb33+RCdvaqdNDbIRCodFJqgnBGv+52OiHYtO7bed/27FJKmhFGZeSHsvdZnLd/UN6cGE6SQ8/+cdsOahSFJWqQfS50npGHZb1vPOKKnr726AgOgQRYY9V3eSG9E+TPHWodwti70kJiQ7lHU4lyUBpQBwzU5sfh4XOwzAuT4humbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkLTIi9YPTdoER/M+4E9T371U0Kg6Br5yqlWc3SukQw=;
 b=WkAQUrMlLxAOsyQk5Ly13BEcmySIgTitjedCR/qtBP07jDUNHJwsyfRljVaf2kmiddO4KFuOtEUOfmUUsxnw+HisHgGQ0pQV8R99rWXwnWWJGF1UwVHp+sbqhFM8cgtf5VTkSM5j3ZlyOvOtY88P6KrlYN8oL6lYNgAXKSDiVMITlPoiPFFx10vV/q6RbDgLtkdTTNj6xAEgeatoWBWXgqhB+tROAuXJUxBtFcqbfjZHcHd21iA97DpS6ysrfQEZI/XOdKQMBbWQTbl3PZFJSBqoZOaRgMAc2tXC3LksJyIJEP79e8WgC4EjjdlNmki9WOUdFlK3cLJ3MVqFVnzSBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkLTIi9YPTdoER/M+4E9T371U0Kg6Br5yqlWc3SukQw=;
 b=L2xG0ADs2SSEA5UOHJrDJvc5HHenVm7QvYjMUDiW/Ye9izVyA+pk7Sqh6YsqZTyQGSw2FzWyFx/fnq6mGVUDhXZLBeW+3Be7m8dan82du9sxx+B+zm1pD2ojAQjBhKWYgXjrSsZeT7+BxY6IdSycQ3FT7Wr/LwaPjsoHOgAgTww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a984f2f8e8e1fbf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGu6YSF+/U+LdVS3VTdjarNyiRCw8j7LMjjzRZZMoCK9ZtuRIMxaANgZGs1cToEx8hQMfR7wkrp5YSpDI2xsfEXhXJZ0pfj2CC3YTFXVmS5hnuufmMjGnjAcIJaHQJoj7+LV4oD7owPN83/XKDsPRJiX1BWViPV3zUu1iGnPqskDsFKF0t0wHftgkHTnReke+P2VyZQluqYr/GK4MTD5IL6tVA4aA1cDLtK9maAyeDltJQ7WlNxHerexBv5pGPYQG3tieqHZTvs1O01PH4RjaXZ8KIhT5h7JvXZWNX6ceioyyjqQoagqkRcCzCdswSJJs1ZiASOtVJ7nsJNJWYxsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkLTIi9YPTdoER/M+4E9T371U0Kg6Br5yqlWc3SukQw=;
 b=Dkfa9CsKNHGkDQL7XomXaqFGIwjuSpaPd8eOgoN4mV/2VS++YRQpdoHLppQOnxBxK8PqHMS94+3pbdXbJYKgh6BPPGEesaLVovtUX/WOSc8Z1FciM/dDKRtL4aDg4gMZnLRFIiqeK9upw+0NLnejXdIBKrJ6axffAREtmlQZ3sbep22ICubvg76FmXpwxaEvu6mP5AuGc38xdWxoBHst/M259urVNU/TAO/k1k/5w/89cM+ho9vBs43AyEnSFu4joxRLyVMWoSTNYOqnLipRXZ/kbqqVn//sbW1V1DZiUIsfSr2ubYePXKoHEptPCTzdtT+xDA5GEgaCrISmjkG7VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkLTIi9YPTdoER/M+4E9T371U0Kg6Br5yqlWc3SukQw=;
 b=L2xG0ADs2SSEA5UOHJrDJvc5HHenVm7QvYjMUDiW/Ye9izVyA+pk7Sqh6YsqZTyQGSw2FzWyFx/fnq6mGVUDhXZLBeW+3Be7m8dan82du9sxx+B+zm1pD2ojAQjBhKWYgXjrSsZeT7+BxY6IdSycQ3FT7Wr/LwaPjsoHOgAgTww=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <911597d8-4655-6963-853a-7088044a3e20@arm.com>
Date: Mon, 18 Jul 2022 15:43:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Arm64's xen.efi vs GNU binutils (and alike)
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <04b5e393-e7ad-956c-dbea-8203b6846726@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <04b5e393-e7ad-956c-dbea-8203b6846726@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a228d8b1-0ad1-47e9-2ece-08da68913959
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7866:EE_|AM5EUR03FT061:EE_|AS8PR08MB7920:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f3ZBe9qCm7LLJswV81TPbDTr+9oIv7N+v/Fq94rF8bNTdWCF3I7to+B2c8e8btPX4V8O+nCjAfCr4HQgFym2Eye6d649+YOlbvdrNq4AnnmoEBfFUteI8F5DbgOw5aS2JeV8LnYbPLYGtUWfFtLQSANMS04i7Tcgz9K+a3t77d5YDMWiqZsdmIhY07rc9csbA8sscxrHPn5KwNAO59ZaESB/Wb/9w64xQ4OkZxiXiTTziSMRAxw7M3msmc73udX/r4PrjjBf3P9cmwhrEE7mEMgtZ/CsIudrUm4Acz80V400R0rPvR5yTPUz3Lz336bWfDUAtIqWoAaQzNlbnI6/9y2pRfdiMmNrHJEsSTVsMQnmSz43bMijkLk2KiaNx4HWXK68hcLIJg3zwq4f5Q+1H7vDWzcfzl2ZZTJOnO+Ax0irTlwqnYoS420UDzZvW4sSbiljdWqIFwXBx59mMUdr6FBUgjIKu+7Yi35pKn9bAbJopgYfEtJJJkaj5dLIEF1GlQwCliw0LZOWZ6A6H1eAiwu3DiEjtLbvpMi2k7hFT6ILmH7dC+AY9kScyI/7MmJ4PrEEk9q0BBl+S3CopnUWwmko2dCmABA8zLtGEwhviv4k2KwXit159juGhIJ70nApTEsz/vtRCHq/Kym/esLdirA5dcXXOSZi2hF/4IQ6TpdBPD+KutvWdgCUkzBeodPTjGUFz7iP0+gbEwhteF4gFI2Oz6xAkviok1kE86UVTwfz3YD/C0cBgf3ejeW3x+5DHbLYmfEhEz4xFyxpBmtY3Voxt2rfcLVz1N8G7s8FRFkz17zuNnq+KvelBR+2F//AMMi8CK8CJAr+WcHfGsEPoONQmUICwSwnk6I23MkHOnw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(316002)(31686004)(110136005)(36756003)(54906003)(38100700002)(41300700001)(186003)(2616005)(4326008)(66476007)(66556008)(8676002)(66946007)(2906002)(6666004)(5660300002)(31696002)(6506007)(53546011)(26005)(86362001)(8936002)(6512007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7866
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bbdc4c8-7a63-456d-3d35-08da68913082
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ssETPKoUWghpC5eao0hbVOQL9WQqkPWVQLsKIRXvtafMRND9/3aDI4JxYC/2cI7auH/hgcUNfVEWqOBF9TLN3XQILEUXparitO//ZHaMgbeskfU8jYxf8CZXZiLS+ZWad7T4cA3lsVWwjdD4BDSJ1p0QFXJF+gdb/aaOG9HOleC9LSf9e6tx8rWOB/8W2fcC24mZpGeE/Zng0fXTtiIwdP+IG7ov1nsoR7GOD1WAY0JRr55kTadefwSMG1Tjg8I4VVyaszWVgkBk1T7hgGQQ9AqoNbOozeA05lcayYus/qbYz9WycMkKLa9okb+n0QjtWe/Lz4CEiXzXTq48Owd8wrasFosoO5ZJxuVH7++thqsaTDHYPmUEMzw0VUrjg74M3K1ToqwxO07TSAKlC82mhxz8Nhpd7D+jd9sNtctOrDetUeHHENskpDOGtCMwO9tFyEVIV+E/EgGsviCth3iEaAuAu0wUm+d/FRVWWEM8ZytWCiAP6nB4761jaPf68NhNHmccGT2065o9DjWDC+xh7CuP16pgDiIuP5ymhwDd83NpgLqBNZcY16qsiwa7/Wqf6dq/Z++BFOTsZMsE2V9CZW8eoodOohq523ZK34CMTEk0toUwoPja9rxOZArzTJrfy+5mtb57pJ4Os4ye9pJEdu55tNBo9LRnHnGVr0Fe7NOsfPBdWOg9Do7x1dZ8JbJqXzfwlzE1TAW1Caifpt7Y6boyovZOfhgcIOAxlOTg9+ofu4CdTymfGx3a+krIZfG7mqy0YTX4b4cyS9PnLokI4jgDiYSl1r+aMUD/B7T2JcIvw+dinYqxxoJSOZM4b9Ug7bCIg/xjaMW8eMGmt7JleRFNEDC9DmU0y2/M6WCCI64=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(40470700004)(36840700001)(46966006)(70586007)(36860700001)(110136005)(54906003)(4326008)(6486002)(8676002)(478600001)(36756003)(40460700003)(70206006)(31686004)(41300700001)(316002)(5660300002)(8936002)(2616005)(6666004)(53546011)(186003)(26005)(6506007)(47076005)(336012)(6512007)(2906002)(356005)(40480700001)(82310400005)(81166007)(82740400003)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 07:43:36.7414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a228d8b1-0ad1-47e9-2ece-08da68913959
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7920

Hi Jan,

On 2022/7/11 22:32, Jan Beulich wrote:
> Hello,
> 
> the other day I wanted to look at the basic structure of xen.efi. First
> I used my own dumping tool, which didn't work. Then I used objdump,
> which appeared to work. I decided that I should look into what they do
> different, and whether I could make mine work as well, or whether
> instead objdump is broken and shouldn't work on this sort of binary.
> While I'm not fully certain yet, I'm leaning to the latter. This is
> supported by GNU objcopy corrupting the binary (I assume this is known
> and considered okay-ish).
> 

Did you use x86's objcopy? AArch64 GNU objcopy does not support any
PE format file. So I'm curious about the version of objcopy you are using.

> Many problems boil down to the (ab)use of the DOS executable header
> fields, yielding an invalid header. The first 8 bytes are instructions,
> with the first carefully chosen to produce 'MZ' in its low half.
> (Oddly enough Xen and Linux use different insns there.) This doesn't
> play well with the meaning of the respective fields in the DOS header.

UEFI executables are regular PE32/PE32+ images, Arm64 EFI applications 
use a subsystem "0xAA64". PE32/PE32+ require images to have a DOS header
for option#1 backwards compatibility,or option#2 to prevent images to be 
run in DOS. I think Arm64 EFI applications select option#2. In this case
I don't understand why we need a valid DOS header? For my understanding,
we just need 'MZ' for file type identify and "offset to the PE header".
Other fields have be re-used by other purpose when load Xen image as
binary. And lots of bootloaders are following this header format to load 
Xen (Linux, or other Arm64 OS/VMM) images. Therefore, it is not 
currently possible to construct a valid DOS header.

> Subsequently there are a number of .quad-s, some of which again yield
> an invalid DOS header. I'm therefore inclined to submit a patch to
> make objdump properly fail on this binary. But of course with both

I have not used objdump to dump xen image successfully. I always use
xen-syms for objdump.Sorry, Maybe I didn't understand your question clearly.

> Xen and Linux (and who knows who else) using this hairy approach, it
> may end up necessary to continue to "support" this special case,
> which is why I'm seeking your input here first.
> 

Yes, like I said above, most OSs, VMMs and bootloaders currently follow 
this format and boot protocol. Therefore, it is difficult for us to 
completely remove it all at once.



> Furthermore the fake .reloc section overlaps the file header. The
> section is zero size (i.e. empty), but a reasonable PE loader might
> still object to its RVA being zero.
> 

I am not very clear about "overlaps". Is it because we are setting
PointerToRelocations to zero?

Cheers,
Wei Chen

> As to objcopy: It shrinks the binary significantly in size, removes
> the dummy .reloc section, re-writes fair parts of the DOS header,
> and extends the NT header resulting in the file position of .text
> changing. The size reduction and possibly the movement of .text may
> be okay as long as the resulting binary is to only be used with UEFI
> (as it's due to zapping of the embedded DTB and the unnecessary zero-
> filling of .bss, afaict), but my understanding is that the other
> adjustments are all fatal to the usability of the binary even on
> UEFI.
> 
> I may easily have forgotten further anomalies.
> 
> Jan
> 

