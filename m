Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B054EEE8D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297411.506633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHiN-0006D4-PZ; Fri, 01 Apr 2022 13:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297411.506633; Fri, 01 Apr 2022 13:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHiN-00069y-LX; Fri, 01 Apr 2022 13:53:23 +0000
Received: by outflank-mailman (input) for mailman id 297411;
 Fri, 01 Apr 2022 13:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkNZ=UL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1naHiL-00062m-Qv
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:53:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 163ef985-b1c3-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 15:53:19 +0200 (CEST)
Received: from AS9PR06CA0089.eurprd06.prod.outlook.com (2603:10a6:20b:464::14)
 by AM6PR08MB3125.eurprd08.prod.outlook.com (2603:10a6:209:46::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 13:53:10 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::ab) by AS9PR06CA0089.outlook.office365.com
 (2603:10a6:20b:464::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26 via Frontend
 Transport; Fri, 1 Apr 2022 13:53:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 13:53:10 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Fri, 01 Apr 2022 13:53:10 +0000
Received: from ccc12a6a6123.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D80A576D-CF4C-4335-B852-6649A657AFA8.1; 
 Fri, 01 Apr 2022 13:52:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ccc12a6a6123.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Apr 2022 13:52:59 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM5PR0801MB1730.eurprd08.prod.outlook.com (2603:10a6:203:38::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 13:52:55 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.021; Fri, 1 Apr 2022
 13:52:54 +0000
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
X-Inumbo-ID: 163ef985-b1c3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RX0zrkWaF+G96cV0dhi+/BlSlqMy1i6xCHXOJTnBmA=;
 b=W+26dz6b/iC4rtRYkbwFuM/XGGNYJzv3IjsPz/B0NllBtqK40oSsW0vtzrItjpKOLLeGpWGNJJziOSte+XQ6byMrjAC75R8ODI669Y4Fn7naOyu0l3mH44+FfJ8sBYahvPsHU3c5YKvsux+7GaSXAl3d+J5xev9IXf5YhX2OQwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 038d63446095fc2e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeUOeCOck69er0yfigKo/uMQiAAlyKZanNphCO9JNNW79r7G+ubQ+kT6kjBFR/MXgFyIA0Czw5LIjfUiSL+8o9nb1JJhl99D+ToryXWttBJmcwIY8+osMWu0ovGxpU5EBv9lsZlFwzkV0Q3YeYagI/Wh4WkZRdOxnEVanre/44b/FCfvshx/GPpPSvkmDcy6AhJXNg3CA1/SAUGoXspYtZHiRFUzfvLAHvV9Q3RL9NTydQXWJt3I221ZdiLh3WlQSGHdrpzuik9WafBzroTKs9RLQquiFNL3LXVC1srnbFFrl/niBnXYc0eDNrbKtkiZOMrUAwkwx/6A6dURaXV7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RX0zrkWaF+G96cV0dhi+/BlSlqMy1i6xCHXOJTnBmA=;
 b=PX4Rwz8I+vAw1MTyVnV8HHxKduaR/cqR6lVQTBu4MiwEr8YAhjUVTupEPwS+M0zWzo0bxilt/lfYnHbCsEM8gRiZO8D5iME74qCUkhDANZQ3BPWW1n6aBmGExuY52pbzCFG1Cal303UdwnYtcCgsW3dh1LmephjpzNPcBGjbwAUY6vMOabo8pV/FcJvZIua9gS2YasYlk+w/DAWMVTI8a0bNxhhTVuBpJezLUNZqxVza6nX2yGcd5/SxuwGAmK4dxIF5puVfvdqxJRefQmPKcURmAScgFgNLPt1HVEqK9rodQMjSNLj4mcjeRIbALuyesWm+oQBchVu7EhyOCRW6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RX0zrkWaF+G96cV0dhi+/BlSlqMy1i6xCHXOJTnBmA=;
 b=W+26dz6b/iC4rtRYkbwFuM/XGGNYJzv3IjsPz/B0NllBtqK40oSsW0vtzrItjpKOLLeGpWGNJJziOSte+XQ6byMrjAC75R8ODI669Y4Fn7naOyu0l3mH44+FfJ8sBYahvPsHU3c5YKvsux+7GaSXAl3d+J5xev9IXf5YhX2OQwY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v4 2/9] xen/arm: implement domU extended regions
Thread-Topic: [PATCH v4 2/9] xen/arm: implement domU extended regions
Thread-Index: AQHYRWDx0w9vetaSnE2EriQcgkUblqzbFM0A
Date: Fri, 1 Apr 2022 13:52:54 +0000
Message-ID: <A5DD6DA0-A77C-4916-8FD5-DE5462739599@arm.com>
References:
 <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-2-sstabellini@kernel.org>
In-Reply-To: <20220401003847.38393-2-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ceabb37a-44f3-466a-9c37-08da13e6f553
x-ms-traffictypediagnostic:
	AM5PR0801MB1730:EE_|AM5EUR03FT030:EE_|AM6PR08MB3125:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB31258F0D8F7FB51EC7C5C3B2E4E09@AM6PR08MB3125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JPBLhpx6GlQmaCb7f/GwjaBPwVmy3rgh7LTB3UHF87BRaUbllq6QuMxujykR7TFPp8JEoyY5pKEto6lbXhlqgkDbfc21Av+dpjzJySTAVzZ2bWqo/T6UwOaM2m/AdVDSfNOkcTAUG9xUOd6WdKvwOQJLW5GllK+j0Zh21oip4fIKBu+C4oeT88evsheyxsWMUSskp8kF4WdD68opw6MJfIh/oLpG/6gt1oY0CB3Tfdu0shmmJedhyM3Aa1HXrA+OAjeHsa5RjaaS32rZYYsLKJIWA336WVo8t1heJxr80K7YfhGxmb3HL3snSFfpPbDhNPc41BThKolsm7LQ0ZaU3P6t6a6x+qVXDBy5VE1L/9UqQk0QOFr5S3dm9hQZBfFvK/HqdRnluXVG4wu+q9cLH2els5SMGaM9Tjed0zvjHlr+C+7hB0hy35Vu0dT/yxzgOJpTlozdYtbC2zlC7X3HEqIY3SnKw+EsUiJvbE8FbyWikYypGEvnpSdUl4E8QzwDI8XOZBDZ1LtCDrjk/lcn2h8sJS66QzKXp2PvPbJ1PnY4aWkPUufBTus21oKBSHVFzLMydCQEQq/IMyPCyxcQLoKpmrB35v3uAwrLxn2nszuH6ofztjP35fM9xGErfEbK9V3aa2q4QpTEaijNGQ9XMduoQX+iMoIbtBYE7B5/fAFuvtG2rDEWvfib0FhOJ2NdYxyABKRt7EhtZyFhh82JL0EE73lKnUikAtkgxTyx+9AG893/RweXXZiDXlFcpBf7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(66476007)(4326008)(83380400001)(8676002)(316002)(64756008)(33656002)(86362001)(36756003)(6506007)(66556008)(66946007)(76116006)(91956017)(2906002)(4744005)(8936002)(38070700005)(5660300002)(38100700002)(122000001)(508600001)(71200400001)(6486002)(6512007)(2616005)(6916009)(54906003)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <52E7B0E9A497CC41ACD99E585FC1BA6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1730
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca6b21af-8fe1-4e47-72ff-08da13e6ebfd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8rY+TmnZRu5vOSuG7FQXDJwKZlWv+FCBtDLC9MUwXQhMUZSRpaABlHZvsfeUfrzXCFXgyIzqdc2MjV55o+roRMBUb9CjvB928I+TttKLb2sYN8B5ESYYxlq1k2bqEO4PlvvLw3LmZlIm1usKBXcDp2huwKT1aarNtzaFnkTxJij9vJUE2H0AegVN4qOnh3Y5Cot0h91649R6ATxm5wBE4msnVwX3MfIvesGk/ZJ6ufu91U70j3xQ0pY6p1zoIu07C4Jrtpob71Z5fsJ/9g/ahehzkv89T5yOt6tJfCFe8JbLET6pZRY1Zo+1VpkW5Wc6GMCG+KJV/ULZfbMpsU2z9s1AtZcLLX1uRjM9S6/BdmkzfY/ghOmj0U5goGtjnb2t+9XP4+xA8xZQjBCS17pr6JSPcHsJFSyfuPGMO0W0xQYNs53UutbUrHV3FRZyfEE3rCSpJmzSBpxO7G8Fycm1Jm8nrAxJ4UQLIeBoy2+BHz3vClJCozGyZLXih7CET0zL9Y62LiaLMrH/b5eWOvLUVSny0tLryvbCq4QBOTRwPq/ISm4QVvS7USakiHI1VweR1LSxlyMlaabxy7RJLr1zL87aYLPIDDJ4bXuvVt1iDemY/a43cy77tvZOAcpyBxrUidV7g+wuWWrmnGtu6XOQqMJOgmTmd0rl3wbrzxOW33YVLV2Irsml1gyBUQpxhrYk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8676002)(6862004)(4326008)(316002)(70206006)(54906003)(70586007)(6486002)(81166007)(36756003)(33656002)(356005)(86362001)(2616005)(6506007)(6512007)(47076005)(36860700001)(508600001)(40460700003)(336012)(26005)(186003)(5660300002)(4744005)(8936002)(83380400001)(82310400004)(107886003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:53:10.4990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceabb37a-44f3-466a-9c37-08da13e6f553
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3125

Hi Stefano,

> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> +
> +static int __init find_domU_holes(const struct kernel_info *kinfo,
> +                                  struct meminfo *ext_regions)
> +{
> +    unsigned int i;
> +    uint64_t bankend[GUEST_RAM_BANKS];
> +    const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
> +
> +    for ( i =3D 0; i < GUEST_RAM_BANKS; i++ )
> +    {
> +        ext_regions->bank[ext_regions->nr_banks].start =3D
> +            ALIGN_UP_TO_2MB(bankbase[i] + kinfo->mem.bank[i].size);
> +
> +        bankend[i] =3D ~0ULL >> (64 - p2m_ipa_bits);
> +        bankend[i] =3D min(bankend[i], bankbase[i] + banksize[i] - 1);
> +        if (bankend[i] > ext_regions->bank[ext_regions->nr_banks].start)

Just a code style issue, the if needs a space before and after the conditio=
n

With this fixed:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


