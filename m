Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65DA4905D8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 11:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258089.444055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9P9R-0006NP-BQ; Mon, 17 Jan 2022 10:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258089.444055; Mon, 17 Jan 2022 10:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9P9R-0006KF-7Q; Mon, 17 Jan 2022 10:22:13 +0000
Received: by outflank-mailman (input) for mailman id 258089;
 Mon, 17 Jan 2022 10:22:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSOx=SB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n9P9Q-0006K9-2m
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 10:22:12 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54a924fb-777f-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 11:22:11 +0100 (CET)
Received: from AM5P194CA0018.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::28)
 by DB7PR08MB4602.eurprd08.prod.outlook.com (2603:10a6:10:73::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 10:22:07 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::88) by AM5P194CA0018.outlook.office365.com
 (2603:10a6:203:8f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Mon, 17 Jan 2022 10:22:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 10:22:07 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Mon, 17 Jan 2022 10:22:07 +0000
Received: from 05e3f173c1a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3ECFD60F-0A6D-4AA9-A986-0CBC126E1DB5.1; 
 Mon, 17 Jan 2022 10:22:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05e3f173c1a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Jan 2022 10:22:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB4685.eurprd08.prod.outlook.com (2603:10a6:802:ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 10:21:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:21:56 +0000
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
X-Inumbo-ID: 54a924fb-777f-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PTwpnwexCCnE1cJ//IMYJaY9lwOr1UoZQNknSCoboY=;
 b=BJHwBJ++Vhx6tt402lddVDNCLsdLGQ/+vlO47gQ4ZJpZsar4uvdX04Vxtqs0WkS2AZ3kvh1D1OwWy8hr5HuOzRuU7UExzbDUueHxcqjpz7AiYBE33uKkjxfvqPPXcJQaEdrIXt4wnIS/src8olUFe5YS4Zyi+TCXX9cCwQTYxD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2044f934f16f69b0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQZTKl2j8gnyDKIEtQYRGLtLT9f2FedGsxZtNWUEi0Jm7Zf3p/76nLDhjsTze9WY3k9RJ9LxVEiaC+49lhOa4PZkxnTqkopg4t7u4MtSFrU+KAAWKZUpbja9LuNXKvSg0YbfGZvzdeaUN/Re++M/qLkXUo8LpcmoOE2lVt6YJB02hal7MpevXjUDtFzohiuQIQ7clXFDXARgp6snDxS92AjAfWMnDJFeDAvdB0hFNA723BH0Lqa9N022aDsn6f9HRtQS6/kpjyZZmgJuPhT5APLW2CKVU3Zcg3hw7k7uJRlABFF4X9RaBmGB0S/DKX5itIz/aVUYYr/kzXvSNgr6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PTwpnwexCCnE1cJ//IMYJaY9lwOr1UoZQNknSCoboY=;
 b=CTKLPHtEaMhKZEdW6qucLHPXJBZQfCV0xmg7cX4F5R/68SNR+GyGHH4sAvgGwaXN2s0LRI9QiLzZ3hHsuj7GcKhEUMO4KGdDwaMx8cylAyyaCvHFgsRY9wJp3cqCrmoAgBsQjRaV7sEwHtwT4fXD4p7fSdy05NksTzp8T74si22sE8L3rfkyU0gj1GuftcmIOITqXMGv9kkmOmux8Jx6s9jqNP1N1uT3MlCXI4wOvSd/Hjg8mPy0rYieNRdA+6Pq3ylvK2YSu83amZy4fCG/AZWIiBXDzRp/aSGIuFTVZonND1UEcJt6I3EO9MRNgDRxyDKUmmU6YucsjHyIdXYCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PTwpnwexCCnE1cJ//IMYJaY9lwOr1UoZQNknSCoboY=;
 b=BJHwBJ++Vhx6tt402lddVDNCLsdLGQ/+vlO47gQ4ZJpZsar4uvdX04Vxtqs0WkS2AZ3kvh1D1OwWy8hr5HuOzRuU7UExzbDUueHxcqjpz7AiYBE33uKkjxfvqPPXcJQaEdrIXt4wnIS/src8olUFe5YS4Zyi+TCXX9cCwQTYxD0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: update my email address
Thread-Topic: [PATCH] MAINTAINERS: update my email address
Thread-Index: AQHYCWlQ7Wn/NVFPwk6SHdDVv/7d+KxnBUeA
Date: Mon, 17 Jan 2022 10:21:56 +0000
Message-ID: <E44AAA0C-25CF-4FE7-9915-FCA33F0BEAD9@arm.com>
References: <20220114170733.55750-1-rosbrookn@gmail.com>
In-Reply-To: <20220114170733.55750-1-rosbrookn@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 01bc6120-1546-4b53-be4b-08d9d9a336d8
x-ms-traffictypediagnostic:
	VE1PR08MB4685:EE_|VE1EUR03FT044:EE_|DB7PR08MB4602:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB46025C0A0EDC57A9EFE5C5D49D579@DB7PR08MB4602.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:478;OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /QkxgrhzI7c352ZiwhID90nXZa7efp4OWxYo6vmjLmqMwirNEKF27hwrsYEosk2GHq2zpa09/E3BIVsBmDWscTD7Sqydd7pJVYFzHkdFdhqrIL7+V7lMC3edglGPaNs+k1IjWZdjU+gG0lEWJO86q6tubaQHo7r1HEjVHuP6gLOEmt9g7PVqI1F7TwnFhyRKrB5vaoOpu3rhS8tBHqdoS6ekP18UlT56TMpAlIr3+Kwkdjv39i644slp76SuuPIf5YRaCr7Ifq1Pb4tcXDlwdQ8OHXK3Ov7i4ZzC2mHM1fL5bvVqdRvlUnJMYIEhPvOgpxmwmh/3qP6kr8nCYT5z3veWvxucKtPJGMniiKW8kCs5VXELw9/WIuz7aUr6hPF3eIj0SZAMGSepKqez+kyFhtUa8G8D6fqOH45Y/Wvacj/O+z4TXu2wqjqSzsZwgwC5jJuY3gOxTex0wWl+yntUhfX/T03r0QpTPAsnQInaZcAvZZ5ppVBySkfbuIrNnsulSOHkIzEPV5Tgkd3elvOrrpxM61i8nJeNDe+5oylXJASTxIKHm2igGamR+btVoDuLoRUhK0HUz2/gWBP1aDQhamCIfGL+53KIuknIX/HSkA5VZf2nEryszux8273ACJlarUQkiVPoosh0Wo4fB0bppHrZMijJ1UJh+D6Kn2vDODMMMrmCwINGB5YrAk41i+DJkgWPwTF76PMW6RZxD5EWWUKClgEAKLOZTHlRaqjINeQGBn+MBay/7vngytFfBlAodhGocAOHLYWYtMs60Ogr6g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(5660300002)(53546011)(2906002)(6506007)(316002)(4744005)(66946007)(66476007)(66446008)(8936002)(64756008)(66556008)(83380400001)(122000001)(26005)(186003)(91956017)(6486002)(8676002)(86362001)(36756003)(508600001)(71200400001)(2616005)(54906003)(33656002)(4326008)(38070700005)(76116006)(6512007)(38100700002)(356934004)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34C9B4F89BFDE549A6BE77C20E63F1AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f80407ee-2d29-4ff3-b242-08d9d9a33086
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TdR+GyhSGBpLMh1KvRh8gXvGZ6lyPH3DFLKzI0ZWjSj3DYqbsiuUXqYCBw2dLdBi7zLkbQFsfxZim4t7YnZhbCxkHjYymC3zKwALyRrRaDmoiLg1LSLgkCfjG0io7kRLfY8GUOe5HSgT5Ugda05qY9T4fz47+1TyKTpkjV7Btf0rpTWs0jmHB1qS0Dbv11DuogoW1L+O7GciSgCYJNy/Pjgjtd7VKJ0do61F7h5XcmrLlZhgD95odOIE9v+2918buiQRH+zKJi5b11g+RanFRvDMIc+J8qvmMIyzHyL0yhB10JeCfM/sIXMA+nzSOaEU7UuPPZ1iN/GYVmkitEHd+ndaEmZ/5trlBwiP08FoPdWetT5ynAq+CLuWnOU+BwqcLM/7drSSC0auAvvBifJ1usa9dVgPfgosCe8byCOO86K2PryGVIgtKvI03IXmGiTI4WfTEKUcO8mxGW0CepJ921TLCkZU9jRFKRO5F9dE6IpIJPjY4ifeE2nhQjlvOqu0+Yh9p5Rb0BshbVOIMn4ICAKWf4leGeeLMwexBkeniP0RQYFma0ZvRr8O8Hm6pfC6MNBGoHTMXy+7sETazKJ2b6HgMCnGsAUIAXG6bVI/gfP42jSkEzA0oGi4eUWgARZK201578IbAuya1REusqEPTDSttG1qiBCf+q+uWM04Aw9bbLM1mBw3mVhjG1VutR8Xq6sDuhbWTdFLvYg0oWB7L1F7zJA1c0odGb7yRSdD+Vg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4744005)(5660300002)(26005)(70206006)(36756003)(8676002)(82310400004)(6506007)(47076005)(70586007)(4326008)(6862004)(86362001)(53546011)(54906003)(186003)(36860700001)(33656002)(336012)(6512007)(316002)(2906002)(508600001)(8936002)(6486002)(83380400001)(356005)(81166007)(2616005)(356934004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 10:22:07.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bc6120-1546-4b53-be4b-08d9d9a336d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4602

Hi,

> On 14 Jan 2022, at 17:07, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> I am no longer an employee at AIS. Use my personal email address
> instead.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a2884dfa7..feea7d14cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -302,7 +302,7 @@ F:	tools/debugger/gdbsx/
>=20
> GOLANG BINDINGS
> M:	George Dunlap <george.dunlap@citrix.com>
> -M:     Nick Rosbrook <rosbrookn@ainfosec.com>
> +M:	Nick Rosbrook <rosbrookn@gmail.com>
> S:	Maintained
> F:	tools/golang
>=20
> --=20
> 2.25.1
>=20
>=20


