Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718314E4280
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293529.498646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWg5q-0001qb-Uf; Tue, 22 Mar 2022 15:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293529.498646; Tue, 22 Mar 2022 15:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWg5q-0001nj-RA; Tue, 22 Mar 2022 15:06:42 +0000
Received: by outflank-mailman (input) for mailman id 293529;
 Tue, 22 Mar 2022 15:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RlTh=UB=arm.com=Teo.CouprieDiaz@srs-se1.protection.inumbo.net>)
 id 1nWg5p-0001nd-SM
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:06:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad6eba91-a9f1-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 16:06:40 +0100 (CET)
Received: from AM6P192CA0089.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::30)
 by PA4PR08MB6125.eurprd08.prod.outlook.com (2603:10a6:102:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 15:06:33 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::2a) by AM6P192CA0089.outlook.office365.com
 (2603:10a6:209:8d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Tue, 22 Mar 2022 15:06:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 15:06:31 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Tue, 22 Mar 2022 15:06:31 +0000
Received: from ff921e109d43.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A5EF8FA-5081-4A38-90B3-B9524AE3FA9D.1; 
 Tue, 22 Mar 2022 15:06:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff921e109d43.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 15:06:24 +0000
Received: from AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 by PR2PR08MB4796.eurprd08.prod.outlook.com (2603:10a6:101:21::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 15:06:21 +0000
Received: from AS8PR08MB6134.eurprd08.prod.outlook.com
 ([fe80::2d2d:b7f2:90ae:f9d2]) by AS8PR08MB6134.eurprd08.prod.outlook.com
 ([fe80::2d2d:b7f2:90ae:f9d2%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 15:06:20 +0000
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
X-Inumbo-ID: ad6eba91-a9f1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrGbsiuzqX10hQiVT+FeX24FrHwvPIT5gGTXeauTccA=;
 b=VUTsV+PXVnmktmx1TD13L/NKjUj4+hOT8uhMm7Dyxdb5DAqxTJgMmeK4LUImlYCHn+0v9TpM5BjKIwiJIZVJSlOUuhl2smQ6f9l2C1BJM8ivm75L3bLqstVK+hiowow6PBbebAYFM8CQjjorZhVmoZPcU7Qe2f81XIRaa3EU55Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6bfdfe40e9970aa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve8tVnxN3YB+c7LthSAuSt8K/K+XGn2y9c8Qvtjx++5IKASnAmGkEHsorEb6dcX+kLPeDhDZwlHdbp31we5N6T7ad5uUKrYF+bzZkOwm8v9e6Wl1MxBZc+0MEh4dO19OUJyXHL6erb7fxuYpwwV+SQfLddh0tUEnqSygE93ZCnJAFqHlA/gMmRezn/D5GCAx2IXpjw4exZg2LeM6BqbN7Z9GidBqCEJhZnJ8Y3rkV/f4riGWJ63a3VKaAfs3X9++oDot2jlHCiRCuyzHjczsOxu9YKiflQjtJ0GaClM88Cy2G7wCI5PD3praA53JIZx2gUxD8HP6+2+dIuoAmy3TYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrGbsiuzqX10hQiVT+FeX24FrHwvPIT5gGTXeauTccA=;
 b=Z+TFBxtsCvBje03xgpCQNLNh2vXY8JhGJwSolGlOeoN6G+vmLEfIpX0dMCO4BwUTlDtSlzDvW7K0Nu5/ZluS8QwNMb4oE1S0TSSsCvc7DOqmE0TgnLeXRZ4luMSvYSq9EFBey9lXmyGBurewspHN9idf4evJoHufjfd9YzIjhZmfO6eMLwqXfy1+GALbqTrooNqE5TAj0QBWAwTnRZKfXOEs4wKwXIt8J7wS8NiYXfhpLcGXy7v0kuoQyzFpnMmN1vl9pTbxtt/brWWea5sWUuNEIvsbDGAIxFQweEBjxlhXMmVSecdGkLifwwIU/8KuFBYKW35nBmj0L1hDMvMxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrGbsiuzqX10hQiVT+FeX24FrHwvPIT5gGTXeauTccA=;
 b=VUTsV+PXVnmktmx1TD13L/NKjUj4+hOT8uhMm7Dyxdb5DAqxTJgMmeK4LUImlYCHn+0v9TpM5BjKIwiJIZVJSlOUuhl2smQ6f9l2C1BJM8ivm75L3bLqstVK+hiowow6PBbebAYFM8CQjjorZhVmoZPcU7Qe2f81XIRaa3EU55Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <81b87e05-215a-2d75-6fe7-641d5be11686@arm.com>
Date: Tue, 22 Mar 2022 15:06:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: jgross@suse.com
Cc: andrew.cooper3@citrix.com, christopher.w.clark@gmail.com,
 dfaggioli@suse.com, dgdegra@tycho.nsa.gov, dpsmith@apertussolutions.com,
 george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20220310073420.15622-12-jgross@suse.com>
Subject: Re: [PATCH v4 11/11] xen/x86: remove cf_check attribute from
 hypercall handlers
Content-Language: en-US
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
In-Reply-To: <20220310073420.15622-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To AS8PR08MB6134.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::22)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 7e839cdc-0a70-441b-73d6-08da0c158cb3
X-MS-TrafficTypeDiagnostic:
	PR2PR08MB4796:EE_|VE1EUR03FT059:EE_|PA4PR08MB6125:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB61259A2D02A2B1E7F6937212FA179@PA4PR08MB6125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BBFMMYBeKR3StCnpeSn8LIVYnA0DcLUQtRhobK8T4q6dxIBbDohee23y/RTubgAuD3ekfxqc+7KfUbP9tjykg3C6SSXg6cWoS3MWdR0J7W3SvaI4ghlz7npn7+ZzOPW+9GE6bGbo8qyLoMPwCCRety33KzILmcG9U4Srh4xYuCrdinRy07gfwB8EkDuj+bN+RUU9g2E81ZFROa0JIQajOehakoqJEfQCjCww5eHsKY1ofHD95pl3b20QY/mEKAVrUUFz3YJJ5s7IwutqkI7HmyjAE/MABr7bF/RCuks05bct4tVu+z23JlruzHUJJaotvtiHqfTKu/Q+bFoj2aoaG4/t6CnnLyIREA3wM/rJUNZfxiElihNLOyCmnXn4hutlaiqp6s7cQZSSC/03Ol7AC4pscW+sjtlue9lyVPCvqskSdPgeDzL4DznznSg0PDnh2FHbgthp3eNr8qpaYm8dN/s3GGpSyXIEtf/imAnNVq3BzcJnkqSwbvglXHRzb/92SvjauaeBqDRgYMq+vKQZ3WQ51YX41YE05ZVf4F7sfHEX5j7Yiy6NFIkh09Dtl337qRS1D6jZlnYAbHATYZ/dtVP4rbQxPaQJSnx3iVvLtxZx7lQvytPJVd+uJmD+yF211ZceWrMVCIySbQwVGWlCj8FfLh8jGOY30d+dGP4PGDdNIX/2R2FyaOtwdoowdhDHzIV/kIVMa7if4CFy8owpmMbuht9jJoWXiHibgXQWWkM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6134.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(86362001)(66946007)(7416002)(8936002)(4326008)(5660300002)(36756003)(4744005)(31686004)(186003)(2616005)(26005)(508600001)(31696002)(316002)(6916009)(66556008)(66476007)(53546011)(6666004)(6506007)(38100700002)(6486002)(6512007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4796
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a94fc516-fdaa-4052-c921-08da0c15855f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NW5XJdHLP6D4zCmRtyRXHva2/8BFpoU6yARORkhDRMsKjKHcLCigENGv3QNU2JiNvowggf8wImS565X2ns20bx8j5Gn2x0BohMnk+2U2MWbP8OSZRB29TdjUBcs/shr2WACpHMQV1BkKP2ektcZ6sgjuxsGW1glatmamTQRhGphMjq7Wto5OdYE8c8v3xq7NE7Twz1f9RZ7iWXBMHJoDYqHsxoNL6Swu1rp1qzji5DTqKMUm+gHM0Bf8/4vkyLhwAZZ9s70vI5hQBOO2SAbSMe9+4E6cLxMkDsxLtT3d+k+rg/CQugqIjjqeZcAVJud9tX6ViCKWCUwNOgGFlvY71PxlW//pSWdc2Nkd8KC86z9atFaEZu8bFrlV1RMgpEhJbeiiBHVWBLpKKaXl+z8pvOlRKdf8J2N30oQ3CVod5Akrp6PjsL8tOQYKyvkTt2HSpTpQa0M8odzJC8ttKgUetNvf6HywQy5kGK6zY+ymjyE5gPJkOakLh6pwelnc1Z0cgPgRQyNU4AR9C0mrNKmTl4pbgtBcGch5gcP+FVNdhGq48+VYwd4TbB6aLcqD+z3OSFNIcH4hIuC5vBmmRBYnRMkz6bGQoH24zGR3kEAEjEKc2renwixw/cc4+dcR7LiUaV55sapG/f9zRMzBt+HRy4PB1tnydyhBT8icFy2Q6VhwT8v4skzJhFx5e0KiBkI+WRLDtND9JSQr5N5+TmTFqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(336012)(26005)(5660300002)(508600001)(6486002)(186003)(31686004)(2906002)(356005)(81166007)(4744005)(8936002)(36756003)(40460700003)(6666004)(34206002)(70206006)(70586007)(4326008)(8676002)(2616005)(6506007)(316002)(36860700001)(47076005)(86362001)(31696002)(82310400004)(6512007)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:06:31.9705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e839cdc-0a70-441b-73d6-08da0c158cb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6125

Hello,

On 3/10/22 02:34, Juergen Gross wrote:
> Now that the hypercall handlers are all being called directly instead
> through a function vector, the "cf_check" attribute can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Tested-by: Téo Couprie Diaz <teo.coupriediaz@arm.com>

I tested the latest patch series on Armv8 on the FVP and N1SDP platforms. Dom0 and guests are booting, no issues with networking between guests and dom0: everything looks good.
Regards,
Téo


