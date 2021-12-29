Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006AA4815C4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 18:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252387.433432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2ccc-0004ol-R9; Wed, 29 Dec 2021 17:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252387.433432; Wed, 29 Dec 2021 17:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2ccc-0004jP-KL; Wed, 29 Dec 2021 17:20:18 +0000
Received: by outflank-mailman (input) for mailman id 252387;
 Wed, 29 Dec 2021 17:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsxB=RO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n2cca-0004ge-L0
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 17:20:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9616bd0e-68cb-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 18:20:15 +0100 (CET)
Received: from AS9PR06CA0404.eurprd06.prod.outlook.com (2603:10a6:20b:461::24)
 by HE1PR08MB2778.eurprd08.prod.outlook.com (2603:10a6:7:34::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 17:20:13 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::54) by AS9PR06CA0404.outlook.office365.com
 (2603:10a6:20b:461::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Wed, 29 Dec 2021 17:20:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Wed, 29 Dec 2021 17:20:12 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Wed, 29 Dec 2021 17:20:12 +0000
Received: from 9ce6ec32f649.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52F952DA-6D13-415E-B6C1-7A826AEE98FC.1; 
 Wed, 29 Dec 2021 17:20:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ce6ec32f649.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 17:20:05 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR0802MB2336.eurprd08.prod.outlook.com
 (2603:10a6:800:9c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 17:20:03 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4%3]) with mapi id 15.20.4823.024; Wed, 29 Dec 2021
 17:20:03 +0000
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
X-Inumbo-ID: 9616bd0e-68cb-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP0UbL67XX71k8RwTGfBw4XY9FE3938TDoiR++fX5bQ=;
 b=+C/jUP8h5NbVaH6g206H+O1QgtEafdbLpM17S+rkY8LtHgDDq0SZl/7Srlz0Br/SFGxx0un9BCLQejYWbX3aX6SK4bXRmSGfuvBTZrRk80hj1dsb/Sh2sRkBzCvptnEZnL1ou1N/B4JqPf07R4+cgsl3X1EUKBxFWsGwj1/M6As=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4abfa30bacb26158
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CotMeWHKuZbK+04Z2hd/O26rpzkdK0REXBMDHILVMVclhzWFV5Y7ASiRXzoDyTj02Pdzr7NiLzkldXmLXsHCvUBGVeixmhBp9x6cWCGcm7xmkUEHefiM3FtVKEpePm72fBAgeGClWwGAz705RggqgYvRRTs4D/I5I2gJGG03Xy1LwlaaaKYXLXXKVeN4N2negTSnpBpNOEXIUubZb3Pqg++SOKx3/92lqA/Pv95oK7lPA+STBJU1HEywnTylJ9m0ww7l/Pwztb6/GNnXfx98Q8AnJqkVEH8mmisIRRwHbsnrCQmtHJOEZbGW30w6xDB9VicLVVwflnm/OXBXN3y6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP0UbL67XX71k8RwTGfBw4XY9FE3938TDoiR++fX5bQ=;
 b=CRXnFNbFp7A0pD+Vrw63yTLycKkCSO4ew3qvpi3elRGE88ouumWv3gr1VYgoOtweoOcl/NRYlclvjaTq0esWH8IK3ZTzJMBgV0WZsl8jTM0IPAfPGKXV59T6/UbRvF2Yp4x5mDvYsq1tcfkxnhd9uO/WF6waG3WDwiGD9nPmHDYJOSg0o3pXqwL/XmXID7/oqLf1ZZulkCHGmplHdzVrMPmZF+JVJMBw4gAVOXzr6fSGBURhv4jzJFh33lvmktT4HMYLFJtZwph39M5jUC3nATBWdBlCMQB7X451fER8TYGs8+VZxZ4mmTYPmt1p8j28gfQXsJbhFzYXlWo9gdbM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP0UbL67XX71k8RwTGfBw4XY9FE3938TDoiR++fX5bQ=;
 b=+C/jUP8h5NbVaH6g206H+O1QgtEafdbLpM17S+rkY8LtHgDDq0SZl/7Srlz0Br/SFGxx0un9BCLQejYWbX3aX6SK4bXRmSGfuvBTZrRk80hj1dsb/Sh2sRkBzCvptnEZnL1ou1N/B4JqPf07R4+cgsl3X1EUKBxFWsGwj1/M6As=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 5/5] tools/xl: Fix potential deallocation bug
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <2d1335a4056558d172d9aa3e59982eb761647418.1640590794.git.ehem+xen@m5p.com>
Date: Wed, 29 Dec 2021 17:20:02 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: 7bit
Message-Id: <25ACC8F3-F6A8-4D07-9CCA-A48B8AE4B553@arm.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <2d1335a4056558d172d9aa3e59982eb761647418.1640590794.git.ehem+xen@m5p.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 96ed9754-57b0-4e9f-4f20-08d9caef7931
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2336:EE_|AM5EUR03FT010:EE_|HE1PR08MB2778:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB27787653133D6ABF34295D63E4449@HE1PR08MB2778.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WyaYK0f9cjcuBv0t3UBVMNS9gJiPBR9Dxt24a982g5yKHRBYydZX6QLvhcRxOrJWFqni3y+BW2AQfpbc7fQ8i7otrRCyAEoOfaVVHePgCCZ18pn8XQy5Ox2aQl2ypct/Xd6jaFzvuX/q7fpwlRxzEjgdhuNBvan5JHVVyGoe04hIPr3EwV70ANaL65wL+Seyko0NHjB9GyfZtAsdQkza9+cHPWj4W2+SuJMpxgjB5bYRMKFW2vC4nDDK6GjBw+eRTiSmJzQS8kT5y7tybfn/5b2PQnffRyPlQe4IvRri//7SxFD7pOaRyLMcTeX2Z5R+EBSl3jsMSfB0nbe/NBfPZMlk6dvYhVrPg+qaOMbfIeDSlrrgzLGnxNuxGLOz04vWUxYIiXa3CrtyMq2TTPfDpk+mvgKbp4oz3hEUEktfOnc0U9MfMAb5QWBApBQ22LO527KaJUbJh/ibCGuIhcVqFdxmm7YrAYOmoAtPuTRfnob9UtLnO+ES9lM5OpGQ0TRV5qcWVooRIEtSC3yVtUAbhqUgHzbV9hUFLhbW6DHfD6o5JPu3Ys0+lCh6rYLF1/i0pv7oYu2FofYqizCfzHnAS0dTnsIeMyY9hKFytYYls1foBBMXY3+BuysHtC2DrKNuPKi7v1wxCpO5VTewAa3es4A93XThP02nMtPHfGoJS1e9hIdfRnzhBax2l/6ohn9/cptgD2htIRbHl1qzVKOi5wg6qRAW//ZPDy5a+xlLPyg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(36756003)(6506007)(53546011)(66476007)(54906003)(5660300002)(186003)(66946007)(44832011)(66556008)(26005)(2616005)(33656002)(38350700002)(38100700002)(86362001)(316002)(8676002)(6512007)(83380400001)(52116002)(8936002)(2906002)(4744005)(4326008)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63f93e20-5836-46aa-7504-08d9caef7378
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5JTTdFIen7g25wn284eVx3JHN0ufqbfthb00eF02JXv2aNxN9hgpn3De+2tRTLJB9YSJpfClz2M1w2AYDMRgsXPUteKq5kbfElpVyARiyoOtkda8z1cuOKSnBakpTxDOMsluIZdyUAA2WLiqtSXL8xsGi8OO2Y3vs8NRc5Y7sjRz5GgKAZm5uhYKB10p35utTHiK0bX8ZS7gaUdw6RI6p39XjR2QxMtHoTamIDHdmC3TheHgA9m35ASQKDNkEbrnju6eCQV5yIQ4si5ucC8kxXsuhWTbfhuDW59FrPV6BHMHnMrPp4dKUkiLBob/aa3EaVsK7lciHBy1G+axVcyWUj3S8Ns9CuV6qJ5BYdcKPM9hJHxHJF4m9oGF0wTlDw9sdA4MdCz6+CVSQDAEgsLiK8bgVLBn99UanpnLlFT8XI5jRZ1Vtkg/6f/SwmS3eteFbP8igDEIzCN58UTwFIvqcoFDrzY5Q/O02s4dXvrCqAatt2JtpMteLI4qDcQGatE9Nnv0mg57FXfFv50VAQhIiRWlWaVV8tlmCQ1YsyGghUOCl1VAuv1npuyyO0l51WzANCl4teX78yLczQ9zsAybpftkzKcA3t4EryJahuskK7Mee05vOMqKH/8f4Cr0CLNrFLYV3dCtfDW/+6qWcCltQW05Q51B79h43XHrvHJcbkpAJXU4CTV0tluidmEUGVw5xQUKpZQDZWmAvzplLdgKpA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(81166007)(36860700001)(2906002)(33656002)(36756003)(8936002)(83380400001)(54906003)(107886003)(336012)(508600001)(26005)(186003)(6512007)(44832011)(4326008)(8676002)(356005)(4744005)(6506007)(6486002)(2616005)(5660300002)(53546011)(70586007)(82310400004)(47076005)(70206006)(86362001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 17:20:12.8296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ed9754-57b0-4e9f-4f20-08d9caef7931
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2778



> On 10 Dec 2020, at 23:09, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> 
> There is potential for the info and info_free variable's purposes to
> diverge.  If info was overwritten with a distinct value, yet info_free
> still needed deallocation a bug would occur on this line.  Preemptively
> address this issue (making use of divergent info/info_free values is
> under consideration).
> 

Looks ok to me
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> tools/xl/xl_info.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 3647468420..938f06f1a8 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -579,7 +579,7 @@ int main_list(int argc, char **argv)
>                      info, nb_domain);
> 
>     if (info_free)
> -        libxl_dominfo_list_free(info, nb_domain);
> +        libxl_dominfo_list_free(info_free, nb_domain);
> 
>     libxl_dominfo_dispose(&info_buf);
> 
> -- 
> 2.30.2
> 
> 


