Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CCF7B2D75
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610288.949640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8UB-0005jD-9U; Fri, 29 Sep 2023 08:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610288.949640; Fri, 29 Sep 2023 08:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8UB-0005gu-6K; Fri, 29 Sep 2023 08:04:31 +0000
Received: by outflank-mailman (input) for mailman id 610288;
 Fri, 29 Sep 2023 08:04:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm8UA-00053y-5B
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:04:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0413439-5e9e-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:04:29 +0200 (CEST)
Received: from AS9PR07CA0043.eurprd07.prod.outlook.com (2603:10a6:20b:46b::6)
 by DU0PR08MB7437.eurprd08.prod.outlook.com (2603:10a6:10:354::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.36; Fri, 29 Sep
 2023 08:04:25 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::24) by AS9PR07CA0043.outlook.office365.com
 (2603:10a6:20b:46b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.14 via Frontend
 Transport; Fri, 29 Sep 2023 08:04:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25 via Frontend Transport; Fri, 29 Sep 2023 08:04:24 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 29 Sep 2023 08:04:24 +0000
Received: from 58408885f934.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B49F8CE0-5AD1-4739-831B-6B47AB1E2F4E.1; 
 Fri, 29 Sep 2023 08:04:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58408885f934.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:04:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7425.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.37; Fri, 29 Sep
 2023 08:04:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:04:14 +0000
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
X-Inumbo-ID: d0413439-5e9e-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikr0SFHNN5ALAmZlj5YnTwAadTRTjJyL66PE3loUSeg=;
 b=rjsd+XEtzox9oTx6T/Y5AgfheBHgxbQlkQ0NVWaDT6+qf2CYJbrXtC1H1LyQbdGOeEc1GHM87gJcQpmcmH4Epy8B0EVbsW7B7xi1Aui2Qwi5tiN0gKj56bK0crDfWn5InmRsi8XlD0ySyqsnpHOwU5l1dkbTLpfGb83c59B0zfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c9b3ec389d54f0b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W21egUw57bAsxm96NmhPUBJ2mbNuH+RK4fFTg/QUNlG2edm+dC+xlBFs8Fx2zqKfNx8AqlZOu7OOIymOhM8zg+OcpA71qsNSMvUapoSP38+KaGxab6qOQefeIVSB0owTNdkRZ6OHprhPkcsNaxmf/RtWjaUFnMHYpAXUGNBzmVPJ1QfqcACXRHheVl5iooqd4DY1E2nI/kDkh/3Sjf/edqF6FK4vabdf0k5tu4n/I2XOoRHcQh1q7nP0APRe/DgVyzRdhmuT1UGziiW8eKeyGU4CJNyhAQApKB8hp8ycyfkBg3OG1SaM2h18sWiy5yNYQ/61MnA+L2phLp2P7W9w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ikr0SFHNN5ALAmZlj5YnTwAadTRTjJyL66PE3loUSeg=;
 b=QQjGi+Ji7tw7BHzbHWO1iPi/XCtxlvp5KmCJx+UKML7f0fdxPHDbc9jEaMIHspefzYg1A4cCjn/svR4rtNzVwljrsBUcd+XDjKKBxPWHFYU/MfJVC+Ys8jP8w+InD6Gl6GjAlzub1+fXtDoBfQ4d4QSUdp3zU0xKj12mfGGYt5MW4PFv52FvAACO/U/0xi9YinE7hvvSA5vNfZgwvXQLouPcrDVhGH0VNs2JqSgUFEYQnnmA9JLxkENkUo8fzAKbug2WZJEgM4v33asHjJUEcM9iKAbm73bjdaObchKbo9SqpsIHF/2tQYv6mctaFPNmn684kX5xTNFP3OfIPJONDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikr0SFHNN5ALAmZlj5YnTwAadTRTjJyL66PE3loUSeg=;
 b=rjsd+XEtzox9oTx6T/Y5AgfheBHgxbQlkQ0NVWaDT6+qf2CYJbrXtC1H1LyQbdGOeEc1GHM87gJcQpmcmH4Epy8B0EVbsW7B7xi1Aui2Qwi5tiN0gKj56bK0crDfWn5InmRsi8XlD0ySyqsnpHOwU5l1dkbTLpfGb83c59B0zfY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen
 4.18 RC1)
Thread-Topic: [PATCH 1/2] Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen
 4.18 RC1)
Thread-Index: AQHZ8qraFalO+9fmeUy7aHVwsSZPHLAxca2A
Date: Fri, 29 Sep 2023 08:04:11 +0000
Message-ID: <9E26D4C2-4592-427F-8A97-D73C7E0AD791@arm.com>
References: <20230929075857.87092-1-julien@xen.org>
 <20230929075857.87092-2-julien@xen.org>
In-Reply-To: <20230929075857.87092-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7425:EE_|AM7EUR03FT054:EE_|DU0PR08MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a7b695-5d30-4408-1b76-08dbc0c2b1e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AMa+bC96AExTQ0P4U6pHB84WfzIQZ4QlqW0aSpDe9+IKjOn4bVbfH3JIY68xHZlamnXMLbeec8DBOPHJdAp1B82veWCtgsW1KoypnXV82D45PtHR4mSfG5L7Czd0GFg77kAp8jAh3StwMdEFZGppXVAjduuukCsME9po0FmTi5O29X2unvC0Q0aa6smCvuse5kh1gFtU+d+wQtvkYOPzI7ryVuKuOvmbBUXNDfojmOdXZAr2nWdoFdJvDFcl1PLYreQ7NFrnuw6teH0ot1PKIMeIJvzlF2f1VpSHUvnTDtNrNmMSmHf1krFMjV0QYwiZBNYSbCyWjHonEH/U2XwkzvhyQfWYBy8EHBtTWeeMSnItelEhgDdzkAzlKwqwVGqr0iQ5g+6dhfjoVXu+EVnO2ZSH5cmqqVepQ9fzLdxASq6eD2Q5IdOcDY9l1o6WWtIMNPJUA4V3SbFz8PbyK5gT78kKGd7U9ucHqRP/aRI1lI2p1Y9zbujHyPItAwKl0PRCpfcarMpRBR9o3uZto0PwgIKRSx5g4csUtXOk5wfsNUTqyJMnhv63ldBLgBYA01/g6/BRBcoFrp09nyaU26AQ42GRgmiw3mCDx2ELyJYCVvyACZW3b/V8TFyR7dBvkkaAx1cwIo2kfR+4iWXRpRPGwbqLQaI47rVXRiTQrwk2u7hvxVv4qoTSBWtX+voJITmw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(91956017)(76116006)(71200400001)(6916009)(54906003)(66476007)(66446008)(64756008)(316002)(66946007)(478600001)(66556008)(41300700001)(33656002)(6666004)(86362001)(122000001)(38100700002)(38070700005)(6512007)(2616005)(6506007)(6486002)(53546011)(26005)(8936002)(4744005)(8676002)(4326008)(966005)(2906002)(5660300002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0FD5200A599188468BC0C1152B0F6D41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	167912d6-3124-481a-b76f-08dbc0c2aa7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dk8zv5AoV5jRiOEJbhKNeXsY34c+ZZRLhY18xg08OmdD1f2T8yPMQzsQqKDCXC38gKObJnlrwXHsU47cUZSE4L4r4AQZ0/1QJ650t3vvL3c/Bcf3h3Zuq0qVgFxqgYikpfgrtTy7rCHiXC+hOpKHiLIxKlpCVaK89zu4njrNAG47X3hBKARjvI6ubTLzODmziGQTocVvLduyYCesnpmEsex+1yCngw8M796FwaQ2osE9WyK8auVpxWbVNR30s7a5nJGw/r9NmQkgY/NfId299fcH6OkVFBcPovC8vvuAxcny80fsfgVpXPiRqyScmF0l2ccFqeVL08LRnICDjZYp8Vu+/0wzQcZdIHIn7YuRpGKf9YSZZKSs1jahKN3eMXTkhjmDjwFAGYsz1d5eThFhc9tEhZlm9jlOX6uRYBIsvIaGlqmkoEtbzHCOcRbRafOnTSUr4DwkoDaT0C8QTl/crllEdQ1nwqP6voPRT1v3veDS7Emf/1KcD/5zZbc317EMfc3J04MPVVm5qTLn9Naoso0qMshzqDp3zoPGBi12tEe8nAr1wntwOHyrsufLYWZnU0c4q1JO2UEBRe+3Hky8nYbF5K2k8htO1jN7kAZkS77wGg8Ti3/6x77rtI9pWQIbfpayFNlBFeVTRD4QZk0y7YNq4NWrPFP3Uh4oW8UH1D2309WYek8uMA5lR8edoPlnes9rvuLB4j3Agcg6UsAQb3BQESkiZu1pYuVpkiCWmlNr+JCVb2AfYA0yOALLWCh9OkyQ8Vi+nyzd8QT71UUOVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(6512007)(40460700003)(6486002)(6506007)(53546011)(6666004)(83380400001)(82740400003)(86362001)(81166007)(356005)(33656002)(47076005)(36860700001)(36756003)(2616005)(40480700001)(26005)(336012)(4744005)(2906002)(5660300002)(8936002)(316002)(70206006)(70586007)(54906003)(8676002)(4326008)(41300700001)(966005)(478600001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:04:24.3071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a7b695-5d30-4408-1b76-08dbc0c2b1e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7437

Hi Julien,

> On Sep 29, 2023, at 15:58, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Thanks for doing the changes,

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> Config.mk | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Config.mk b/Config.mk
> index 29c29f8d7fb9..000cf06d418f 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -223,7 +223,7 @@ OVMF_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-ht=
tp/ovmf.git
> OVMF_UPSTREAM_REVISION ?=3D ba91d0292e593df8528b66f99c1b0b14fadc8e16
>=20
> QEMU_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-http/qemu-xen.git
> -QEMU_UPSTREAM_REVISION ?=3D master
> +QEMU_UPSTREAM_REVISION ?=3D 0df9387c8983e1b1e72d8c574356f572342c03e6
>=20
> MINIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-http/mini-os.git
> MINIOS_UPSTREAM_REVISION ?=3D 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
> --=20
> 2.40.1
>=20


