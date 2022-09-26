Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A925E99B0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 08:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411400.654312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ochm7-0004l3-8s; Mon, 26 Sep 2022 06:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411400.654312; Mon, 26 Sep 2022 06:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ochm7-0004iU-5Z; Mon, 26 Sep 2022 06:39:31 +0000
Received: by outflank-mailman (input) for mailman id 411400;
 Mon, 26 Sep 2022 06:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bt7Y=Z5=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ochm5-0004iO-Qp
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 06:39:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f76de1b4-3d65-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 08:39:28 +0200 (CEST)
Received: from AM6P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::37)
 by GV1PR08MB8129.eurprd08.prod.outlook.com (2603:10a6:150:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:39:22 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::fa) by AM6P194CA0024.outlook.office365.com
 (2603:10a6:209:90::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 06:39:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:39:22 +0000
Received: ("Tessian outbound 88978e6d60db:v124");
 Mon, 26 Sep 2022 06:39:22 +0000
Received: from ebe73f583f05.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E7DAF9E-6226-449D-A9CE-99D1814166E6.1; 
 Mon, 26 Sep 2022 06:39:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebe73f583f05.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 06:39:15 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV2PR08MB8701.eurprd08.prod.outlook.com (2603:10a6:150:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 06:39:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f997:4dac:eff8:93d6]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f997:4dac:eff8:93d6%4]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 06:39:13 +0000
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
X-Inumbo-ID: f76de1b4-3d65-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IlHR22JijCCRq72yn3HyRwbEjE+5FOMTXOwOIb8NXnmurPnG6zfMfnZGP78IcLZC+vpB/z3/a4d3vV8/oijFMFTVQvAP/130OA9hOnZCuDLhQ6QB+vXykJ6uiMI+WY0BFiwaJk6hOa98EnbDM/FJJrTvjtGfHYaOjZLGdjZCgP6b4IIEK9ejn1fUtz5Hlk+rVrVOEENlWjFGG6cRrEJAJE5Us5qbILZ6bYmMPONcdSTRxKOezF+xnjWcVpGqITz2+uZWUDC8RXM83UIpeC7Hh6c5HLU+HD9t0pvSBdcEi9NUnkup0OPvqnjaZx0i7fOTtEcEU1imNEpade1dyHDmuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfiWPa+UevVocIUkK0nyGiHTHbfQeqneBMuaFytqSLY=;
 b=MVscca1HlomSRR8Ej6kehgXwNrin10bN6RneXSDZ1loU4sYoOmQ1TLRtODxv8C6eiYGUJpTiFqIXGGcFxIgoetFlA1Wv8VrcDHcWFqvwW+qL31+ys5samq96+fMstaVoLcpgC1GSyXp2Nx2lxcrWeLzWDweI6hAGNs3tY/hOh9lrJymtfz5KHRQWAgqpUlu+r5zsjXBsH+XmIJLqog0RGkkZS1crdb16MOA3NUDldAVQIGHQ+v6OIwp7pu8HCnyrY1dnQ2PFC2Bi0JZdh3yXStMkw7fC/xPaj5Kq0f6AMHRKbuevARPTH4DQlyUSrzE7Jy+FNJW7O8nwfYfyQ8auOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfiWPa+UevVocIUkK0nyGiHTHbfQeqneBMuaFytqSLY=;
 b=rI6do98pwQBoNNiMZSqi44vnRwh27jja4PEfQGySSKyHogfy2pSXnAishl9luSNUg0e3fLR1Zr1KhLI1Oo269NhHR3vFWobU29x9F6cisrJ8cnLAim8fPA1YKZkLqPvNW/tuzc45eiYgHWyEtrqEajKIQGuNot/KM4o4uVW/bz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1647a4f588a136d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZt0uxV+FV1KjgIzs9ZM+xmSFUu/qR7QHLfFmkNoC/WRAOZ/Pwr75MC2/cg/oltVatG5luMqNxvSsOKN6KUiDfaLXndCB1eVPHsNl9vyZKV9xIhuVZevEn071opdGA4RlAnQ+LzcTUQkcChD3jpKTo1xZbhBW990sg4VokicSU5kQ/Wdzj3t/7sO0/kJS4/onGwceTsdd97GNDpzRIQf/clJRp7zK3J2MkAAUxNrBKDh6wZt4VNJ5gv37AaeyVP2WjDgwTVa9DnvGAuEFrTpvah9py66ev9jc6HZRVAp9b5DADZSVvGZcFnRaJZm/zITRTDW4T6xFmC+APyPjwUrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfiWPa+UevVocIUkK0nyGiHTHbfQeqneBMuaFytqSLY=;
 b=bFvKCKWelGj/3DHLQCu/qGlm08afueT9oXsa8t+0bV/wyGazgY9bm3n/J35ZPwsoogvJ/phwZlGaFMN029keF0lD3EeQ7iVPrhycfwL2pC25eETbLE4PN54rjF+sdFGbBFbr9zqSCRAxsUXyfQ9PuU1m56imCIJujFHDOW1dWPz1sUnY0yyCCPHenY7hASf+NCbYQzzuBZXbwNeiriOrcu+4VZ10U9PblpRmKkHl8mW2WDYxKuuwJ6/RlX6N/UEK2IAMwZPTowOVQpXNmQo8ZWC5a9tBUzGv71YrpJVWaoUN8UnMr+w2TGGxzxFLSY0fHwtUgR2GNpuGQQYqF+Z+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfiWPa+UevVocIUkK0nyGiHTHbfQeqneBMuaFytqSLY=;
 b=rI6do98pwQBoNNiMZSqi44vnRwh27jja4PEfQGySSKyHogfy2pSXnAishl9luSNUg0e3fLR1Zr1KhLI1Oo269NhHR3vFWobU29x9F6cisrJ8cnLAim8fPA1YKZkLqPvNW/tuzc45eiYgHWyEtrqEajKIQGuNot/KM4o4uVW/bz4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <fe58de74-8bf5-50df-eb32-2d479758bfd8@arm.com>
Date: Mon, 26 Sep 2022 14:39:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 julien@xen.org, stefano.stabellini@amd.com, wl@xen.org,
 marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220826125111.152261-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:3:18::23) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|GV2PR08MB8701:EE_|AM7EUR03FT054:EE_|GV1PR08MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f401ba9-a4ae-4e00-a8da-08da9f89d8dd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lN5MtFcbLJe9CeX0T2N75CrAd2eh2IBj+7EUE/1XlU6l39c+kRyTA5+3bxZpgBZ6HDALqo/dYIZzb5t8His4ocSPUllvl5JhQg1ocrqB8dmREDnWMQT5NYKM32e347XzyQ/ZNjNCFVHkg06iTRiYhPGtrVhsKUQdZXXVYljrC/e2yv1D23GfemKOzyK6OSGz4tHHImwtq6qWrjEIxHdpzvE6IS8UqW7FHNl1leQn3qOdvGWai8q/21URbfn2lf1yBuz5zTE0ZLeUuN1GW7WCMBk72TW3u0TylkP3d1hDKJpA2Exq3xg94LozwQdUC/vH8ywIEWbUIxy3tMJc3PcN0invhZ6QDbCbZwCFEOoYji2nNG+au/AfqWHT3sL4NVrc3P+MMdrPMffFex6/lxtm/72TAFOQX7yaegvnShyGZkPwsGBpAgAJhK0vKpZPgenTWutyLOZqR+24AGh7H5dGQ+buzNVoALmbAczADWduCVR2P0oBuF4PGwsndIhPAlYj5zal70v+9evCve+LNLavW66M+lW4son0iPjC2VEGhmMcbRfGa0fbERT3IJsv2sp70kqK5dPAR+/287xLrB8Njz957dxNMl9LwbjbVaoMaZ1+jN9sjZRtd9JCbRZMvScN/lvrA2hgrZUEEN/+2iY8fcgABmvCdPKsk7mOarv+XP782VfMG44hASg8QVexdnaOJHf2cFMaLHCid//cBDWdlpgBYfZKZxTey8vCxyJmOJXSXlTuI9526+dNh7R4sKBZjutUtnIcBilfDmTzU5DFKoovzJ73WovHTHeAjWjvBk/afrYvio61qu52MK+trFJ7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(186003)(2616005)(7416002)(5660300002)(8936002)(6486002)(31696002)(8676002)(66946007)(4326008)(66556008)(38100700002)(66476007)(316002)(6506007)(41300700001)(2906002)(86362001)(26005)(6512007)(53546011)(36756003)(31686004)(6666004)(83380400001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8701
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05a16cce-7f62-4dd7-8bde-08da9f89d2f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e0XLhzxZrg2n0nm5jq3V13abk/1RWnBivQF0bNi1eyJemHFry866XWEXmyh4PmovgKP7D/In5wCq9bXnb6mCFzCY9Rv58RApxujupr9NWQ+TSZElGyMIpr4WIFrn+DtLAmTcmUrken8DZVjTie+PhpcwXPoHGhowAlif6kf8IGnRaER/5VL5fl/uRGxJrR8wO8OyI4PAm8lqYvCA86LJv9cG983I0RQ1q98IfJM7s+hkYqDKbPdI//rc2QVpynbjBmfscLVgWFw8Xt5jNI8coaIBnbrIHa543vxZuP6ee3fc9XqAsljjJKE/JgZBhWOss28NIMxOOo5p97S2pds1LhnyMhfsv203n+y3us9k6D7vf8YcJ3+78ONFr5cQ67H0TqQyVL+NneghnB/6B90hltAOcRG7CgoQNT9U8k4eKo++UlxYjH+Diph3r1UpOdqYyKJl7J8ttReMFKLvubISqO0wddpTLbcANm2HJnPFVN6DtDSJLTqZtPwfOERjguAurv1518oEGtNXCX5TaZMm+cvAwWVie3jMh3/laJUgF/fOXN20uYHghBGXU+VwOOwKxvLeW0xO26MaOPYRT/qj4VK0XLewANxZFtWC4bc4n6Vqt9Lt0Hn/OhexAj/dcz0gLwdgxa/MPZX1RvRirxaes+o+mlmcNBsudO2Lx+ME5wGtvCMdqNawypdN3Hv7EFl2XBi0WIEIoUi3tjnM4yYd8nJyLUImW2vbfUjyLph0UidYg50IUgCXIWaTk12WGuG5H53ZpuwZ+cC/Odm/IGBnH++rwPD6fPTO+KJQ16JjKdUnuc4IJKy4a0OiWCC8oAy5oBdNnqHYSAvUKMGdeuutbg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(31686004)(31696002)(86362001)(356005)(36756003)(40460700003)(81166007)(82740400003)(4326008)(8676002)(70206006)(70586007)(2906002)(6512007)(8936002)(5660300002)(40480700001)(6506007)(47076005)(316002)(36860700001)(2616005)(186003)(336012)(26005)(53546011)(6486002)(478600001)(41300700001)(107886003)(6666004)(82310400005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:39:22.3306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f401ba9-a4ae-4e00-a8da-08da9f89d8dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8129



On 2022/8/26 20:51, Carlo Nonato wrote:
> This commit adds array pointers to domains as well as to the hypercall
> and configuration structure employed in domain creation. The latter is used
> both by the toolstack and by Xen itself to pass configuration data to the
> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
> able to access guest memory in the first case. This implies special care for
> the copy of the configuration data into the domain data, meaning that a
> discrimination variable for the two possible code paths (coming from Xen or
> from the toolstack) is needed.
> 
> The initialization and free functions for colored domains are also added.
> The former is responsible for allocating and populating the color array
> of the domain and it also checks for configuration issues. One of those
> issues is enabling both coloring and directmap for the domain because they
> contradicts one another. Since that, Dom0 must not be created with the
> directmap flag.
> The latter instead frees allocated memory.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   docs/misc/arm/cache-coloring.rst    |  7 ++--
>   xen/arch/arm/coloring.c             | 56 +++++++++++++++++++++++++++++
>   xen/arch/arm/domain.c               | 11 ++++++
>   xen/arch/arm/domain_build.c         | 13 +++++--
>   xen/arch/arm/include/asm/coloring.h |  7 ++++
>   xen/arch/arm/include/asm/domain.h   |  4 +++
>   xen/include/public/arch-arm.h       |  8 +++++
>   7 files changed, 102 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> index c7adcb0f1f..345d97cb56 100644
> --- a/docs/misc/arm/cache-coloring.rst
> +++ b/docs/misc/arm/cache-coloring.rst
> @@ -13,7 +13,7 @@ In order to enable and use it, few steps are needed.
>     (refer to menuconfig help for value meaning and when it should be changed).
>   
>           CONFIG_MAX_CACHE_COLORS=<n>
> -- Assign colors to Dom0 using the `Color selection format`_ (see
> +- Assign colors to domains using the `Color selection format`_ (see
>     `Coloring parameters`_ for more documentation pointers).
>   
>   Background
> @@ -109,4 +109,7 @@ Coloring parameters
>   
>   LLC way size (as previously discussed) and Dom0 colors can be set using the
>   appropriate command line parameters. See the relevant documentation in
> -"docs/misc/xen-command-line.pandoc".
> \ No newline at end of file
> +"docs/misc/xen-command-line.pandoc".
> +
> +Note that if no color configuration is provided for domains, they fallback to
> +the default one, which corresponds simply to all available colors.
> \ No newline at end of file
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index c010ebc01b..2b37cda067 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -22,6 +22,7 @@
>    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   #include <xen/errno.h>
> +#include <xen/guest_access.h>
>   #include <xen/keyhandler.h>
>   #include <xen/param.h>
>   #include <xen/types.h>
> @@ -211,6 +212,61 @@ bool __init coloring_init(void)
>       return true;
>   }
>   
> +int domain_coloring_init(struct domain *d,
> +                         const struct xen_arch_domainconfig *config)
> +{
> +    if ( is_domain_direct_mapped(d) )
> +    {
> +        printk(XENLOG_ERR
> +               "Can't enable coloring and directmap at the same time for %pd\n",
> +               d);
> +        return -EINVAL;
> +    }
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        d->arch.colors = dom0_colors;
> +        d->arch.num_colors = dom0_num_colors;
> +    }
> +    else if ( config->num_colors == 0 )
> +    {
> +        printk(XENLOG_WARNING
> +               "Color config not found for %pd. Using default\n", d);
> +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
> +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
> +    }
> +    else
> +    {
> +        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
> +        d->arch.num_colors = config->num_colors;
> +        if ( config->from_guest )
> +            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
> +        else
> +            memcpy(d->arch.colors, config->colors.p,
> +                   sizeof(unsigned int) * config->num_colors);
> +    }
> +
> +    if ( !d->arch.colors )
> +    {
> +        printk(XENLOG_ERR "Colors allocation failed for %pd\n", d);
> +        return -ENOMEM;
> +    }
> +
> +    if ( !check_colors(d->arch.colors, d->arch.num_colors) )
> +    {

If we add xfree(d->arch.colors) here for non-hw domains, is it possible 
to make this function have a complete fallback process? And I know 
currently, this is handled in domain_coloring_free.

Cheers,
Wei Chen

> +        printk(XENLOG_ERR "Bad color config for %pd\n", d);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +void domain_coloring_free(struct domain *d)
> +{
> +    if ( !is_hardware_domain(d) )
> +        xfree(d->arch.colors);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2d6253181a..c6fa8adc99 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -23,6 +23,9 @@
>   #include <xen/wait.h>
>   
>   #include <asm/alternative.h>
> +#ifdef CONFIG_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif
>   #include <asm/cpuerrata.h>
>   #include <asm/cpufeature.h>
>   #include <asm/current.h>
> @@ -712,6 +715,11 @@ int arch_domain_create(struct domain *d,
>       ioreq_domain_init(d);
>   #endif
>   
> +#ifdef CONFIG_CACHE_COLORING
> +    if ( (rc = domain_coloring_init(d, &config->arch)) )
> +        goto fail;
> +#endif
> +
>       /* p2m_init relies on some value initialized by the IOMMU subsystem */
>       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>           goto fail;
> @@ -807,6 +815,9 @@ void arch_domain_destroy(struct domain *d)
>                          get_order_from_bytes(d->arch.efi_acpi_len));
>   #endif
>       domain_io_free(d);
> +#ifdef CONFIG_CACHE_COLORING
> +    domain_coloring_free(d);
> +#endif
>   }
>   
>   void arch_domain_shutdown(struct domain *d)
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..4d4cb692fc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -33,6 +33,12 @@
>   #include <xen/grant_table.h>
>   #include <xen/serial.h>
>   
> +#ifdef CONFIG_CACHE_COLORING
> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged
> +#else
> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
> +#endif
> +
>   static unsigned int __initdata opt_dom0_max_vcpus;
>   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>   
> @@ -3399,7 +3405,10 @@ static int __init construct_dom0(struct domain *d)
>       /* type must be set before allocate_memory */
>       d->arch.type = kinfo.type;
>   #endif
> -    allocate_memory_11(d, &kinfo);
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +        allocate_memory(d, &kinfo);
> +    else
> +        allocate_memory_11(d, &kinfo);
>       find_gnttab_region(d, &kinfo);
>   
>       /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
> @@ -3455,7 +3464,7 @@ void __init create_dom0(void)
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> +    dom0 = domain_create(0, &dom0_cfg, XEN_DOM0_CREATE_FLAGS);
>       if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>           panic("Error creating domain 0\n");
>   
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index dd7eff5f07..60c8b1f079 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -25,7 +25,14 @@
>   #define __ASM_ARM_COLORING_H__
>   
>   #include <xen/init.h>
> +#include <xen/sched.h>
> +
> +#include <public/arch-arm.h>
>   
>   bool __init coloring_init(void);
>   
> +int domain_coloring_init(struct domain *d,
> +                         const struct xen_arch_domainconfig *config);
> +void domain_coloring_free(struct domain *d);
> +
>   #endif /* !__ASM_ARM_COLORING_H__ */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 26a8348eed..291f7c375d 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -58,6 +58,10 @@ struct arch_domain
>   #ifdef CONFIG_ARM_64
>       enum domain_type type;
>   #endif
> +#ifdef CONFIG_CACHE_COLORING
> +    unsigned int *colors;
> +    unsigned int num_colors;
> +#endif
>   
>       /* Virtual MMU */
>       struct p2m_domain p2m;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c8b6058d3a..adf843a7a1 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>   
> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
> +
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
>       uint8_t gic_version;
> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
>        *
>        */
>       uint32_t clock_frequency;
> +    /* IN */
> +    uint8_t from_guest;
> +    /* IN */
> +    uint16_t num_colors;
> +    /* IN */
> +    XEN_GUEST_HANDLE(color_t) colors;
>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */
>   

