Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA080A1CF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 12:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650578.1016264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBYg8-0005bM-HM; Fri, 08 Dec 2023 11:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650578.1016264; Fri, 08 Dec 2023 11:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBYg8-0005Y6-DQ; Fri, 08 Dec 2023 11:05:56 +0000
Received: by outflank-mailman (input) for mailman id 650578;
 Fri, 08 Dec 2023 11:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAoP=HT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1rBYg6-0005WK-PJ
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 11:05:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c09af5f5-95b9-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 12:05:53 +0100 (CET)
Received: from AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::44)
 by DU0PR08MB8836.eurprd08.prod.outlook.com (2603:10a6:10:47d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 11:05:22 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::a0) by AM0PR10CA0127.outlook.office365.com
 (2603:10a6:208:e6::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 11:05:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 11:05:22 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Fri, 08 Dec 2023 11:05:22 +0000
Received: from 0c5f0e229c2d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FAD80E73-CDF7-4AF5-AC9D-AD031C46D191.1; 
 Fri, 08 Dec 2023 11:04:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c5f0e229c2d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 11:04:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PA4PR08MB6222.eurprd08.prod.outlook.com (2603:10a6:102:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 11:04:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::52b2:83e5:f64a:ec3e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::52b2:83e5:f64a:ec3e%6]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 11:04:47 +0000
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
X-Inumbo-ID: c09af5f5-95b9-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JbPfvEa54RHIFbnLkrRf81p0hosPLGdZkZ2xAO43pDgNlt4yhDTll0kSy/uP/KzEcISP0L3NGiZ8N6UzSPhdfDUU8ZSCk2q4qoUkOPNpyyLs94xovoix6/zIIJfTxd+yurWjfA+EYoRUIwFwtaTOaLkr/l4T7eZkFEzyHl76aPrk0S+JTNrBcvoE0qivUm8vdUOzdYQslmiS6Etv55ghQIod7K96qlwPXhmFtFnNAHVotqvj9NNgniF6fYGNDu8V4Kxt/xHV3RADZy3dmVVGz4nQ11KNGPTYhkoAYO+4Z5vMCDcitVe6YqZyFB8Mcxd2vzDHGVwlNttydKR3/wY6OA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv3G05oWQ2fsI0ix8eIqZqDPPW84sseJLd8VR36/GFE=;
 b=A7k1KU3dyy8BgbwMyUA7x40LKL5EEPxmkIt+HCl8D+sVf9K2A9mx2YSq2zxnGwSGDTU+VTyhWANIYFhWvffrxxjodLS7PYHK1aXLEUCKbRWryuOFTzxka3tQbrv0144rZ87PC/YDXYwD2xixAuMzvDVYMbiSZFaFapUn8b3XzXrCUclCXt3/ozvFGSCw6LZiJwNCLpcCerzGWXJ0vm21x3HZ612ihJGIv3W2bO67t9WJv3Ln1LNqXPxo3V/dknVMwTJRkEsEDLvkxQ2PIXFV8ARINkRYVGyBnMZjPenRytXHm4oh24/AbZbLKxy4k1jvSdh3jAGa8UWb7xkAqqZ+Lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv3G05oWQ2fsI0ix8eIqZqDPPW84sseJLd8VR36/GFE=;
 b=OHD+BNj+aRuVEubFsKa3fr96ZjFOlsomq9zjXOrDVHH7+DIpKcjWrbTaOF14/BwFJ3rQVyLenHLLg5gw9ERE3/Wq0E7rHzUNyKjUJJ5qdTv5hOV++XbNIq7LMZv2muWEAHktBSpaAZyWNFXmlf+pj5Rfqzt/R9Gv2PNHMcdYx8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt71Ng/F8Rouyaf0tu3FyisncoBQzDxvS0CBoSm31+sm6MdpVuLeR5LOsNBmihJ5MOzoZPQ4MI+gORT7r/TW7yw8oQHrgIHpPOSBF4Yd4YtpH0eQr0xJq+RdCmnY/Q0VyGmaklfFdK0SOdq6ox9oL7BAYAUUtX4sz1N9eIl+2eFdJnWaQA9Pmjdd1CG6ZBByszGP13SBuXg7Z4vVy0dsBw/PFJbgOtqgr+WBV2NFC8liNeIW6nNdeLC4aBjqdYdTVmI3yA5BoYeMrqSHpt/GY6cBrP98dblmEpABVYN4h6QgyFdv6nO4QmVjPMCSzLpLTL9WMEKRma6azx6hNDV4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv3G05oWQ2fsI0ix8eIqZqDPPW84sseJLd8VR36/GFE=;
 b=Emh/b09PG0gwWzzSou7L3FdD0CnJkLFIysIAkbz9gBVki/wslEVCAVyU50SQhPpAj74hYOIFUF37Vdkdp0nvDCNXK9b8AjTe6sToy4AwTY1ixjxuhZ/5Z5sfZTw4qQ2/nUE3y1gcnMYkqwbrZ96qRsYaA4rCDhwxc+eBeagVPvG+tPK+VHcnHNnq5lov7XYDqG3tVaA+f5rXy0Anuj2oKaORQvtBd+Bw6FFXu/tJfxnRgNM93iJ2nrSHd7UMLbZVx6iD9X7t8FUvcxp6KCW/fW+SaJocn05e/QWt2WFctXZaWQM+0oHUD7IFTPZvmZhzzQQ/q4DWz+jlmFy3RWJWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv3G05oWQ2fsI0ix8eIqZqDPPW84sseJLd8VR36/GFE=;
 b=OHD+BNj+aRuVEubFsKa3fr96ZjFOlsomq9zjXOrDVHH7+DIpKcjWrbTaOF14/BwFJ3rQVyLenHLLg5gw9ERE3/Wq0E7rHzUNyKjUJJ5qdTv5hOV++XbNIq7LMZv2muWEAHktBSpaAZyWNFXmlf+pj5Rfqzt/R9Gv2PNHMcdYx8g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <f3c759bc-f101-4e29-b4ff-dbf53d997d15@arm.com>
Date: Fri, 8 Dec 2023 19:04:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
Content-Language: en-US
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20231207162036.1921323-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|PA4PR08MB6222:EE_|AM4PEPF00027A64:EE_|DU0PR08MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: fff47d25-4b0a-4f5e-5f53-08dbf7dd92bd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SW8fo+Y983BQ6EQCm1g/ZGLmZcbfCGnkAA56cnxv/qbHYDF6o36UksZmpJLXdFUGwZedyNxNvaLXG2Q3sGqwjczRWucWyD5sJmNxlUALDF1ZGeKmKErOghFUEKLYb3wgY3yRVakBGLb3guwzs3wB6W+9osYJ7PY4s8tqJu3279Xi349m7iJS+ZKEWyiWDnK2jevJHlJrl61e3HGMrUuQjhKpS/0QZ2vGlLgUOkr4CjrAagIcVh+wFxr5z9+BcOAg+heE54gqK3KCUXLxxBsWRwI6ChACoWNKdW9eoNgWCWm23GAMWhUA1rgkGdG8qP0tRl5g/VYfi3813OxtmBQOcRZbqGYbaxBIf62xN/BFN69aEkS3Z0foIgEer3dYKGmWhucoQabEVlWomwiEWD444kRfago6w5k6atjRB0teSMpd0gF/bvzRnug8rD3nT3WREjjApP/sRdtlvsvzIp5OcuTf9VDBb+8izveXYXmO4qvA7DxepJruYRiKXcGj77fJDFK6Wbd2jxYqrmq2627XRemo0qFGSe917Q8048yduf1WhLfZcW5E4XsOFrHIOAIu/SNJZjgOA+aUDKtaj1PwjDvFyc+HSTudowMzxxh/tepDf/NPeneR5eOlG8YJSTPIut/ihjzvLd1t7b84HbYAPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(4744005)(2906002)(36756003)(4326008)(8936002)(8676002)(5660300002)(41300700001)(26005)(2616005)(83380400001)(86362001)(31696002)(31686004)(38100700002)(478600001)(316002)(6506007)(66946007)(66556008)(66476007)(6486002)(54906003)(6512007)(6666004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6222
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0351661-4636-4e08-f378-08dbf7dd7dca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U+d6OLK5dEx48US6W05sb1/Q3ls51tBRUUfAQi+J2u94p/pN7Weyq/qST/vi5b0QSQVpZYBoWhM9RSCCOZEA7xYt2yX2DqoFEFNEM3lF+qp/XNQ1xYHtOs/RVGMjmSlPikxsSTG7V/YyA1RsRiqXdAUUnggFq/ZyG6wJZgAZ3R3jd7kbVgC0KAYHdTvUT6mycaEGsSzt6A04eSgbmXQQVwvtgQQsoSiRZy77reL7bwx//rmSQoGHwWDamyKIKyOr1fx0OEPgZ/D4AsxBTbVgtOZLa2b2ALd1WVhqdq8LPBXJxx7r1TQmQBzhKmEq8UkVbY0sxK1IrsCPNkvY3prR3XU39muWkr041MauwqNCLr6SKROBkBxrN3jDI84aPS9gJ76bt8Ts3pvsfH7069GDkRlWZKLkDMZGnl7iI2upGC5Kiwwq34UbvllD81LlYAO2fPQi1jm01ThhbfculPkhn0weSlzvuZArxvGhcfuoRNjBJDIj6ONuR3vzAlfQlBjYV2ArZj9sYMGU0xcSHG5/rttK/DtVCaBALEgosmVO6oKi4MuQ/E249c2BRrESy7IQDVSjPx97Z1+nB0xnADXvJI8R2A9u+EcOlw5CyI8UjstLp8sM8wdCls/EUYuwTBcZUSYwMRysj/Fxy6wxd5BSCRIzzwMViWNzYHmtg9XkczRUjYDq2E5HGPAM7rxF1ZVFo30duisTYNdUTlNAxQnoCi74ma91jJwLMtWF4uwgs2Bx8CMUOkpIqIUz//B92SSXFWyV/okXQjOUPSmi6fMxKw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799012)(186009)(46966006)(36840700001)(40470700004)(40480700001)(31686004)(40460700003)(36860700001)(41300700001)(4744005)(2906002)(5660300002)(36756003)(8676002)(4326008)(316002)(356005)(6512007)(6666004)(81166007)(478600001)(53546011)(6506007)(31696002)(2616005)(8936002)(70586007)(82740400003)(54906003)(26005)(70206006)(47076005)(86362001)(107886003)(83380400001)(336012)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 11:05:22.4305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff47d25-4b0a-4f5e-5f53-08dbf7dd92bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8836

Hi Henry,

On 2023/12/8 00:20, Henry Wang wrote:
> I've finished the opportunity to do two releases (4.17 and 4.18)
> and Oleksii Kurochko has volunteered to be the next release manager.
> Hand over the role to him by changing the maintainership of the
> CHANGELOG.md.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fcf5a6f36..702032cc12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -278,7 +278,7 @@ S:	Supported
>   F:	xen/drivers/passthrough/arm/smmu-v3.c
>   
>   Change Log
> -M:	Henry Wang <Henry.Wang@arm.com>
> +M:	Oleksii Kurochko <oleksii.kurochko@gmail.com>
>   R:	Community Manager <community.manager@xenproject.org>
>   S:	Maintained
>   F:	CHANGELOG.md

I'm proud of your work on the last two Xen releases.
Thanks for your works!

Cheers,
Wei Chen

