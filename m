Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55218561351
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 09:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358267.587383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ogh-0000Cq-5g; Thu, 30 Jun 2022 07:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358267.587383; Thu, 30 Jun 2022 07:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ogh-0000BG-26; Thu, 30 Jun 2022 07:34:07 +0000
Received: by outflank-mailman (input) for mailman id 358267;
 Thu, 30 Jun 2022 07:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUi7=XF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6ogf-0000B9-Fb
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 07:34:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 048713cc-f847-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 09:34:04 +0200 (CEST)
Received: from DB6PR0402CA0023.eurprd04.prod.outlook.com (2603:10a6:4:91::33)
 by AM0PR08MB3090.eurprd08.prod.outlook.com (2603:10a6:208:56::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 30 Jun
 2022 07:33:58 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::d5) by DB6PR0402CA0023.outlook.office365.com
 (2603:10a6:4:91::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 07:33:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 07:33:58 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Thu, 30 Jun 2022 07:33:57 +0000
Received: from ba888a6f0445.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08BA23F1-919A-479C-8A30-D837A175677D.1; 
 Thu, 30 Jun 2022 07:33:51 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba888a6f0445.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jun 2022 07:33:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB5952.eurprd08.prod.outlook.com (2603:10a6:102:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 07:33:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Thu, 30 Jun 2022
 07:33:42 +0000
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
X-Inumbo-ID: 048713cc-f847-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NAJCCZ3sUyvh4k5uWPhF8iWkzZdW0umCfdyaGIlK1hzQHp8J3WcYY6OKJHtPX3YViOg5QstGJngyAmMxP4dyqOdISafcJ8xVd3TkoQ62LoqEWywt7sOTVJsbgRz6Mmc8txcuXD3ADUy8oFj7eUn9dgJWZ9cAKNq8NI59xiesTtl5yKFeJEyoW2A52iE2ji/PiTn7jGtZaDtOMv3znqqP5HimTkacBbnI9HugrTeQQcXuGZ7PW4m7XYfppRo3xcUFCA09zNDu0ZRN636Wxxxzb/FhxmDngw+X7tabkJ5B08J/RsjPNjsdGgbinZO5m2K9ejENUz69NGv1ULE5/emC6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1Hd7Cg6jECUFRedG0LV7S55Xsmx1xsHD1Sv+yG639c=;
 b=CQKCzemmqtbUhGzAKUKOWGZ21MjqbNxbI9JZzAbfFV6W1mtT2/1jt8kUv7e4G3PsOuDnW3SG1Gq5j9MJ9SvKPZnsfaAJ7My+k3uDRrVq9ZVnfDDFxL56UxfevhVdfAXjZZLHi36tgZpYT0vf6UzuE2h2lHnasuJDkL+n2ebIkeFPIx5CFuWeJLq9qe9H/yP7tlGsXlwedsGFpg9g6tvT+SVRempxrXcRpqPeoh7zgWrfGBv6197rEkLhLQY77iCDs+mNAIHDu+D/4xj2dVLLPLj4WHFKcsijjrW4KuRt4UUCBhSK78twuzEzzESWeGdxpPhyTWHtTBW0MU0F+Z4OnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1Hd7Cg6jECUFRedG0LV7S55Xsmx1xsHD1Sv+yG639c=;
 b=S8QGg362thJSVaJYwP1VPYiue12nlCoR0UddvNO0yAAPLBlUVUH7BMg+ILCzTbnJ2Bz7HHJl1m0XUX+leTkGDmz/8TsvGRKtYSTvZSA4e7TNncfFOJ3Dj6lQoDELtStfBSoP0Us28Cg8a34tc0C5taJw9eC+56z5XltAV5Kw6dM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1b58a814aeea5fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/imnmyTjPllutb9SHPq/Flr0nf25Cs7MOW5WA8OAecwg4uHzbgrM3zmga3vGv3OM8dvdw7XIuPkeSaBg3RRXUjP/U+SCvx4w/RrHblk54p2Rx54oT259ablwFpRAhKlfS9tJsCb8R6sgGlYwIYKC0Tg/0s8Dkl3j4mguRKOzPGX3UQilWNG3kWzvLlWtl+cNtMwShu6v8/WZx5gg5wwdvciK3VkTAYt8zCkMBpzxIwHbzRzNqLnAm7DX975t4IDZJOAwvTSoDoetKQJNcTKN7vP6yFC5HpwxlhueumeG9OWCaWw1n50XX8kI4pjq60NK9umkHP/YpNIq6UMFVJbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1Hd7Cg6jECUFRedG0LV7S55Xsmx1xsHD1Sv+yG639c=;
 b=O68CsKhfpgFiAoTQ8B/Pww+dkuNh3u35yBjOjLthr2hNPBwV7X7ZUQYieZTL4P27T7ToDQHqJuEiJvY7D2/Znts85A7o++BYJzdW9/7ZQ6rfTXzY26DX2JBZZ/8Js0sUJdQOGEmMIp3yS1MUqrj98hLl3ZQ9uTNwm5eloJHoiliFw1vngJdlP5dXij7tdHDba+2fhakpP1RV8SyWm1E44X3OmII7ahpTCpBz14ZIGGE2/WO4YEgSt/+2zdSbsBDWrL23AeaUpHQTSuBCUx6Q0Aegxa1XEvFdE2Ch79ZTwX3j180p0vig1p5cp7Byp2b2YjGcT79ltpK9JhCFAlbSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1Hd7Cg6jECUFRedG0LV7S55Xsmx1xsHD1Sv+yG639c=;
 b=S8QGg362thJSVaJYwP1VPYiue12nlCoR0UddvNO0yAAPLBlUVUH7BMg+ILCzTbnJ2Bz7HHJl1m0XUX+leTkGDmz/8TsvGRKtYSTvZSA4e7TNncfFOJ3Dj6lQoDELtStfBSoP0Us28Cg8a34tc0C5taJw9eC+56z5XltAV5Kw6dM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan
	<tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
Thread-Topic: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
Thread-Index: AQHYh+S8oo1uKED1kUSSvOK+OMp/V61mHT4AgACMngCAAO3MAA==
Date: Thu, 30 Jun 2022 07:33:42 +0000
Message-ID: <6CA16D2D-8AD6-415A-A98D-00B27F91C4DA@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-26-anthony.perard@citrix.com>
 <BF28045C-0848-4B5A-8DAB-57192C7B4A18@arm.com>
 <alpine.DEB.2.22.394.2206291019550.4389@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206291019550.4389@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2ceff935-a88f-4540-18dc-08da5a6ae4f3
x-ms-traffictypediagnostic:
	PA4PR08MB5952:EE_|DBAEUR03FT038:EE_|AM0PR08MB3090:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1ypgeETqgEb6OH6/mWLN/T9668zoVooiHMNBJFCvLNfcIMuqQ5u34EDhragQD6qF6FolExi/SzNIrTwbwr9WZetubVAHLXHbTTOP49idteDQHvNCa1JZRWh6fN7t4Z1LaGBtE1Xzsppaj+ZIo16LqWl6hA0WfMtBk0gXoCu/qMp17jXyNyGR2NJCKiQZ2e8XaDRC2D4Bd6GSPMUlR1eoxITq3lLNWTWDKqvsyQLYgERujj/qNde3FzSyhh5rfdySl2IFiYEzP5d80nI3ziF+IXeWkW6jqWYLYJJ+3bbLajYf5k53jNBl4XlJzO3iUxAgJlMY3vBFyGQ6ZK/6PSSgzTwaIMd4kRHYWAAfBSDJe9u5bqAkv9msHUPvBjbN7BuZVb1Px0+dceE+pJEPCix2rCT7wVABuDe25ZKs5wLYiXcHdIlh1DEG9wcjoLjmX4eiut0cD0MZPpSXB9di2lvxGRj7julGaHgHMmZwoFpJ6TNJGfzt/8u5x8sC+pRnsDoQ2CdZQxkDU7CMtMnygnQ91TOxhm3Pj7EQd1MPsc4HjBqzXge7+DKCxnaW2sYrnSJRrOZsey08FBSCCb2ugHU/rVT2B0s+6idn+WeXTLxRblkF1MifHtwsoA5CT1Fvos66SIDfVPcxC8yQoZMDQ/7Ok5PfKnJK2IgINyjB/AjYBXPhhNkwSaEbVV8RRCnTHA9S5lKICxMbgNPJ3h8kNv6hSswqqyRPPjJAEIJ4R8+HfESpa5xeJ/r+kUM71+6WqheSzPAm945gERaBM+OFAC+kqY85i5wogbBFrmBmbE+vFGBaeUGVgNmQqMNi5hs7QyeXSgMx0fm5GFX36f00xUiEbezBxju01m0KwKgz8/y2pTw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(38100700002)(66946007)(76116006)(316002)(66556008)(66476007)(64756008)(4326008)(38070700005)(66446008)(122000001)(26005)(8676002)(2616005)(186003)(6486002)(71200400001)(91956017)(53546011)(41300700001)(478600001)(6512007)(6506007)(6916009)(54906003)(2906002)(86362001)(5660300002)(7416002)(33656002)(36756003)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E210679A06529340AB47E3F2E92B10DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5952
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e48a946-f92d-46cb-0fb2-08da5a6adbac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NSIStOehZzq3YnsqGoS+XdrBWol4IUx/tljsdBdwC+K3PAJJoAoEfBsly+zGWUD14OXJxGZ9zPKyZ3g7Cw6NpmCo+Qc1q4Zx5ipAoj+DTocBG/UGKJLKVGrbPCK8MLs05U/OGehReKW79Ddy/L3Uf3dvg66wQ5dqEuTlrjWCAy5jcI1snopP1kyPGEhP/h1bc4Yd7YgL4TtwmdXLWNXfK+H4xejNdLOepL+o31GO7joe23dZ22uoZJwcRCR1yga0/iRSQ81pFlxOFpcBOX9deLLs2GPFo1dUrd4HgAianSl2REBd8EBOV/bq4qCM1Wiw3HflDs2LAU6Y/nnRZrnh1JeivtB+tGFuxzHm+Gdw/sXbfsFK4r0y/M4jNoQc/R4lLBaRIAnjPe2NUhLXUznqgkJlijPAjcoi5cPtPZTbypuNqUwxD7kfR5TD574U5/WH6dyeek/oeRYSC5Is6aKL/8e8LsNbxF+b3C6fQ5mK+YuRAxyKDySpkh7XBQ1uPTsYPLOl3u7cvcXb5og6qwes+4jML5T9lJjoBdhb+QxqCLn+aMQAB/j4y9YohHqAH1j2VMv82Ud31A3bh6SWNRU9fqWIS552skMWU8ESkFn1Y/H0STgEW7lOdX56pP0ea6BJxihUFUOhvmBaQv2VVNAYUYzA45fgstQg+nVpZmefE1ZEnA9VW3fkjCUdtUiPngrruWUM5b83t96obt1IK2Ey2kDS+AKEPVS8uOGcNK6XUOKGp1qZJv86lPZ1oYHMAV4ESYaijzosNPeMwVVgayZXvdo5ZuUKln8JOfsc47VoT3w5b5jcXBmiZTHBH6romxRO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(40470700004)(36840700001)(46966006)(336012)(47076005)(40460700003)(186003)(26005)(82310400005)(82740400003)(81166007)(36860700001)(356005)(41300700001)(6506007)(53546011)(40480700001)(54906003)(478600001)(316002)(6486002)(2906002)(2616005)(107886003)(8676002)(6512007)(70586007)(70206006)(4326008)(6862004)(5660300002)(8936002)(36756003)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 07:33:58.0516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceff935-a88f-4540-18dc-08da5a6ae4f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3090

SGkgU3RlZmFubywNCg0KPiBPbiAyOSBKdW4gMjAyMiwgYXQgMTg6MjIsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDI5IEp1
biAyMDIyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gKyBDQzogU3RlZmFubyBTdGFiZWxsaW5p
DQo+PiANCj4+PiBPbiAyNCBKdW4gMjAyMiwgYXQgMTc6MDQsIEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBQYXRjaCAidG9vbHM6IEFk
ZCAtV2Vycm9yIGJ5IGRlZmF1bHQgdG8gYWxsIHRvb2xzLyIgaGF2ZSBhZGRlZA0KPj4+ICItV2Vy
cm9yIiB0byBDRkxBR1MgaW4gdG9vbHMvUnVsZXMubWssIHJlbW92ZSBpdCBmcm9tIGV2ZXJ5IG90
aGVyDQo+Pj4gbWFrZWZpbGVzIGFzIGl0IGlzIG5vdyBkdXBsaWNhdGVkLg0KPj4+IA0KPj4+IFNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0K
Pj4gDQo+PiBIaSBBbnRob255LA0KPj4gDQo+PiBJIHdpbGwgdHJ5IHRvIHJldmlldyB0aGUgc2Vy
aWUgd2hlbiBJIG1hbmFnZSB0byBoYXZlIHNvbWUgdGltZSwgaW4gdGhlIG1lYW4gdGltZSBJIGNh
biBzYXkgdGhlIHdob2xlDQo+PiBzZXJpZSBidWlsZHMgZmluZSBpbiBteSBZb2N0byBzZXR1cCBv
biBhcm02NCBhbmQgeDg2XzY0LCBJ4oCZdmUgdHJpZWQgYWxzbyB0aGUgdG9vbCBzdGFjayB0bw0K
Pj4gY3JlYXRlL2Rlc3Ryb3kvY29uc29sZSBndWVzdHMgYW5kIG5vIHByb2JsZW0gc28gZmFyLg0K
Pj4gDQo+PiBUaGUgb25seSBwcm9ibGVtIEkgaGF2ZSBpcyBidWlsZGluZyBmb3IgYXJtMzIgYmVj
YXVzZSwgSSB0aGluaywgdGhpcyBwYXRjaCBkb2VzIGEgZ3JlYXQgam9iIGFuZCBpdA0KPj4gZGlz
Y292ZXJzIGEgcHJvYmxlbSBoZXJlOg0KPiANCj4gVGhhdCByZW1pbmRzIG1lIHRoYXQgd2Ugb25s
eSBoYXZlIGFybTMyIFhlbiBoeXBlcnZpc29yIGJ1aWxkcyBpbg0KPiBnaXRsYWItY2ksIHdlIGRv
bid0IGhhdmUgYW55IGFybTMyIFhlbiB0b29scyBidWlsZHMuIEknbGwgYWRkIGl0IHRvIG15DQo+
IFRPRE8gYnV0IGlmIHNvbWVvbmUgKG5vdCBuZWNlc3NhcmlseSBMdWNhKSBoYXMgc29tZSBzcGFy
ZSB0aW1lIGl0IGNvdWxkDQo+IGJlIGEgbmljZSBwcm9qZWN0LiBJdCBjb3VsZCBiZSBkb25lIHdp
dGggWW9jdG8gYnkgYWRkaW5nIGEgWW9jdG8gYnVpbGQNCj4gY29udGFpbmVyIHRvIGF1dG9tYXRp
b24vYnVpbGQvLg0KDQpXZSBoYXZlIG5vdyBhIHdheSB0byBidWlsZCBhbmQgcnVuIHhlbiBmb3Ig
YXJtMzIgb24gcWVtdSB1c2luZyBZb2N0by4NCldlIGFyZSB1c2luZyB0aGlzIGludGVybmFsbHkg
YW5kIGFsc28gd2lsbCB0ZXN0IFhlbiB3aXRoIGd1ZXN0cyBvbiBhcm0zMiB1c2luZyB0aGlzIHNv
b24uDQoNCkkgYW0gdXBzdHJlYW1pbmcgdG8gbWV0YS12aXJ0dWFsaXNhdGlvbiBhbGwgdGhlIGZp
eGVzIG5lZWRlZCBmb3IgdGhhdCBzbyBpdCBzaG91bGQgYmUgZmFpcmx5IHN0cmFpZ2h0IGZvcndh
cmQgZG8gcmVwcm9kdWNlIHRoaXMgaW4gWW9jdG8gYnVpbGQgaW4gYSBjb250YWluZXIuDQoNClBs
ZWFzZSB0ZWxsIG1lIHdoYXQgeW91IG5lZWQgYW5kIEkgd2lsbCB0cnkgdG8gcHJvdmlkZSB5b3Ug
YSBzZXQgb2Ygc2NyaXB0cyBvciBpbnN0cnVjdGlvbnMgZG8gcmVwcm9kdWNlIHRoYXQgb24gZ2l0
bGFiLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0K

