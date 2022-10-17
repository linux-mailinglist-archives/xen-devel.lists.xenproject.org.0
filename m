Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78615600B99
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424283.671591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMnL-0004jq-Kn; Mon, 17 Oct 2022 09:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424283.671591; Mon, 17 Oct 2022 09:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMnL-0004hO-H4; Mon, 17 Oct 2022 09:52:27 +0000
Received: by outflank-mailman (input) for mailman id 424283;
 Mon, 17 Oct 2022 09:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpyK=2S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okMnK-0004hG-8u
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:52:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67419b83-4e01-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:52:25 +0200 (CEST)
Received: from DB9PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::23) by AS8PR08MB8086.eurprd08.prod.outlook.com
 (2603:10a6:20b:54b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 09:52:09 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::19) by DB9PR01CA0018.outlook.office365.com
 (2603:10a6:10:1d8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 09:52:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 17 Oct 2022 09:52:08 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 17 Oct 2022 09:52:08 +0000
Received: from e430d728d7dd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26E75044-943D-421D-8CFC-C29B57CCD33A.1; 
 Mon, 17 Oct 2022 09:52:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e430d728d7dd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 09:52:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS1PR08MB7611.eurprd08.prod.outlook.com (2603:10a6:20b:476::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:52:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 09:52:00 +0000
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
X-Inumbo-ID: 67419b83-4e01-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hMJaHYGRtBUkovyMpfVZDFeD0/BNHYush0dxLyuE7Pews5JuJd+rh1pCV/jh01iKqGwYKHV6oFdSwQvIQ57SA+z7RtH4fmoi5Him3CiumD8dvu9nkDIKSpyLhMNNMkKwYuq3/oh8xKNPEz4o+rueI59i/bdbKmNCvub3rn2YXdfD00+1z44plVyUZ+4YqJdDTgFKAgvGMSBAFzG5yJ5M3FdZxaS3TEwKAfW+RlxFFNiL7KdY+ausTTq5AVHUQ/6YtPyfPAJm4SNIrqTNKptbbakpGAGLULA59bH40wEkKsCTiYGwWJ7V6RhFudpMKC8FdiHus6iz6GUPxI4Ocvl6Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7fIctafsmzH1UfMVRSQkdOlGHKdJJ8GrFavTfzm+GQ=;
 b=Kc7BmsuHOC3swIQ6zLkEMC1q8lOgNrJ0elpnarpyYsE64gLv69nXp/8Mc1MjXm03EbOBJfdyUwoOn+wnMyn/OP2Vq7h1JgpXG63FNfZcI7ufjzvzHEThE4n9iXxs8bb8SmjYM60sSWeDcsEc4x52cOKf6HT+tVOl5gdpqQgdj2sipSyiGdifIeIFejjnv4X0zHpgcZEQnZLuTt431jhSs4Al3vtjnafqd1OK+nHEOesWaH+RGPdQuNicFwPORd8mut1eFylXYEJe4UZmOJPK/VMPfFyrtaHVeX/ld6NzopWGPoehDgg3M98RROHSzn12xjZJx8lS/QleZSuW8lRt3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7fIctafsmzH1UfMVRSQkdOlGHKdJJ8GrFavTfzm+GQ=;
 b=n8+O0iiOFeSMRe2eLTDEN7XHKdB+/y26apzMTIVQs8g2bvunrRJuO89QSQb9BwxCv+fWohKpmeC9P49/wGKmN75/kxMjBL4lZD8iKkYHZvflHUQfojeXdrZ4yQTRjFcc42/hHGOS03LzchkKpXRHC7o7vOPpj7jVqAEXURrfpXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a327fce7d2d2a01d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH/4c6vZ/cf5s4qI9I7h8ITl+jbpk7SOrgrQEsOktimvTDaWLjfdV6zESDdzU/6jHiFNHICRRk2zFR6mFFi6Wcm0oe+AjyIYrPyurU15wNhLKX7buX9q6CRAw8coxjKsWFBSMOs+mqiSLN0/rmSiudTDDfhaSb8oXKM1cN15StneCHYngUOoyLCGdJOHPbmtmIHLuKqJ8m8tsksQvhsdJufvk8vFIZexZmx6ZaiVnZxH0TnIrRzlLT93VahXLNYUFmRoEDovvtRpiauEZkbU35AEx3PdxT/26os+riwD1/ETjdIoPLh9WFBXOx0TXabiM1/GrtJxzqpEcBtCutTSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7fIctafsmzH1UfMVRSQkdOlGHKdJJ8GrFavTfzm+GQ=;
 b=Q21e55cHZwmAy4v+KB1+trt40WIUP6j5w/d8aru2Gjf56qHqMyRk6TskzvfuzJZRKzbRHpcn2a6bL3uaGr5chkvrl/qg0tEF0uZTME+yc9qAozbTW+j41pkCOtFfsaJjSnwgdZ57COcXZNhyw256XP5D3UCrXzTs55/r0Wf6PrQr0t/ewa/KUjnZzJ6GH/eIlw6tbXaNtTf5eq1O/db1UBnmy8qpTlFXC1lyTNtgpzPbI5/FG5X27Mf8Z5tPP6G/Ypn1o+2b8vZWgW0VIQFA0DAolMZFMpXAotixurG+lhmULaDYHK90uMenoMv5ehBlA2cQ2j7jLQ/X6O8VD2745g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7fIctafsmzH1UfMVRSQkdOlGHKdJJ8GrFavTfzm+GQ=;
 b=n8+O0iiOFeSMRe2eLTDEN7XHKdB+/y26apzMTIVQs8g2bvunrRJuO89QSQb9BwxCv+fWohKpmeC9P49/wGKmN75/kxMjBL4lZD8iKkYHZvflHUQfojeXdrZ4yQTRjFcc42/hHGOS03LzchkKpXRHC7o7vOPpj7jVqAEXURrfpXM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayankuma@amd.com>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Henry Wang
	<Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Jaxson Han
	<Jaxson.Han@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Topic: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Index: AQHY3vmtdKYr9F2nyUuznJvSQYcvHq4OMlaAgAEAmYCAAyG8AIAAAqcAgAAG7YA=
Date: Mon, 17 Oct 2022 09:52:00 +0000
Message-ID: <78B6710C-42AE-4889-8D2C-C1A12F1548D8@arm.com>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
 <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
 <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
 <746da4d0-36c9-55e0-ecb6-185ba0a60ef3@xen.org>
In-Reply-To: <746da4d0-36c9-55e0-ecb6-185ba0a60ef3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS1PR08MB7611:EE_|DBAEUR03FT009:EE_|AS8PR08MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: d78a2a73-4164-4ee0-d4b6-08dab02541b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BCvzPqG9Jdv2qoTKhxG7VBiZnAMCc6MCzaLhdLmk28UFTrEtRJfap5qVqOUjoTY+4kYCftOdWY4nTdDlAPUku1E7uZm7W9pC9T38zVfzvff+YBzPQkBkbDhfPk0ebi+CvGkHll9ZYCz6ErMoH/N6wfW6mB1whWNsfZtOxOpT6qJGL7kntIUlh3z3pE/TFHXaidzgIyJot8NLBiwQaOVdpzFZRyyVVKnb5VLl/hcp39G81J7C2LTlFwxgbLCHwSbbbFuXkTWGU7DiVd7fkgZcCJDVmyEc13ioWdKaHVnuQ1RtaK70Y4HnnWU2jQ6z6Kwn3zfOdhqgPdtD2Zc5quVu69owp3vZm5gUXTTo47QK7ij9fm+ahNumdMi2gZt4KmRBapcUEofHXjMpIbpeOLk4Xu5I5Mwef/rFWSNLjv4rEjkmJodj17aU//Nj6xQtbfzpuf/FzEaHtU9GpDZ6wCHNmrNlMo9psasPhOuV06vAKxTvFmDrlcspoDCIxpWOOxAl3Q6xHw7usXhyJi5CQZIiSzIupB24JOfNGcoTMhEDSWDrf1Z01bS58B3PVX57WmPU4+j3+iNJmjYIv9elng8tmgYIS0p9ycWE4N1Zm6+uOjhH8XNMv/wskHGNHGSqB9GKTSC98DBw08uo+GFVPyjEswdtBUoU+G0EfpvrOPeTtgfyhYVeLz0JHNVlopnMYlFSt0NbasrMTUSv175g9MndNm7dN6E8yzM6R4cPRfoa3s5lPq9mUcVkrY/FTnam/a6zYf5+Ba2kDaocoPyyn+6qg5CqTtDSXGHe+C+7lEk143oR12m2deeqTNoFzGMqCvxyohCyvfTvOJ60E3i5eVWdmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(966005)(6486002)(478600001)(66899015)(71200400001)(38070700005)(38100700002)(122000001)(2616005)(186003)(33656002)(316002)(4326008)(66556008)(64756008)(66946007)(66476007)(66446008)(6916009)(54906003)(76116006)(91956017)(8676002)(6506007)(5660300002)(36756003)(26005)(53546011)(41300700001)(6512007)(8936002)(86362001)(2906002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FDB0585602E27D41964BC426BBAAAAD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7611
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0ad702a-e96b-4cd1-3ae5-08dab0253c71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	emv95fWu3yF1iwhzDg9eZGfnaJWoDI3uYpofzrdUXTx4PCXUFEmZRctTHkedCv9zJg2lCTabFOf/feNs2q9pnIPsSMVDKbzAMJxyxlXtgjPjGFyZp5y6EfaEOg/q1zvjtFJLE0NRtnk/8yRAdXjpEKQyxVBbSy50Xi3G+uzDfZ7XoYzEjYjis7UKSbeEFdqxeYb856MuL7z+jGeduQd0fjIcs5zLMc4Sojb73LGTSPeAd5q5UEg2iI3H/7KendIW6MCAjy43KLsqj2G9B9VQ+SoTCBKydQ+aEPOotJkasmPP6cg8wEkLbqPYZOuEgYpMK+nRY4QogWLuDH/d6z7wZ+UO099pkQIAmgY1kbYJ/5/A0YPv5y8ci2LQL2EcIqrSMoVTAYjRBtmLdYkdotijMKbuAE59fD9CBk4hM72+8pS45/n937TLWMEUU+nYBOq8hM7OggvCI15l31rlp/80iDzp1g6YPBBmiGzyCCFnC/mFzlJfVFfr1HmEI8/onINWP/1yV/sButd5y2yXW6bUt5JLStATQd0rXyXzi7Qep0etHbQslFoNfaxz7l4VxXifLkA6FEaoImRC999b6I9Fb6fz3D7dsd4ckLIXZvVQJdxliexhMLrs/mhFd1XNOzIQKRum9rxkkYMaWchNopQZi0fi+G1zlfm4kHqGEFqwU4e8Z3lLyS2dF13r8iSrbqQBzKJYcn0bxi5VUcQcrZ2KLa1kGM0HwR0kTh+o1VnRHmjhgGme5APizIAZuf5GqTsQD/D/N3l6YlQClDGRcTtLn+1HO81zVpbughM5TVH0wDc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(66899015)(36756003)(33656002)(36860700001)(86362001)(5660300002)(2906002)(82740400003)(336012)(2616005)(47076005)(186003)(54906003)(6486002)(356005)(81166007)(83380400001)(6506007)(53546011)(316002)(966005)(478600001)(6512007)(70206006)(70586007)(26005)(40480700001)(82310400005)(41300700001)(4326008)(8936002)(6862004)(40460700003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:52:08.9060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78a2a73-4164-4ee0-d4b6-08dab02541b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8086



> On 17 Oct 2022, at 10:27, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 17/10/2022 10:17, Bertrand Marquis wrote:
>> Hi,
>=20
> Hi,
>=20
>>> On 15 Oct 2022, at 10:28, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Stefano,
>>>=20
>>> On 14/10/2022 19:09, Stefano Stabellini wrote:
>>>> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
>>>>> Hi Arm mantainers/Folks,
>>>>>=20
>>>>> Please refer to the discussion
>>>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>>>=20
>>>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed v=
irtual
>>>>> platform.
>>>>>=20
>>>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using =
ldrd
>>>>> instruction.
>>>>>=20
>>>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR=
 =3D
>>>>> 0x9200000c.
>>>>>=20
>>>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>>>=20
>>>>> The proposed solution is to use two sys_read32() on GICR_TYPER to ret=
urn the
>>>>> lower and upper 32 bits.
>>>>>=20
>>>>> With this, HSR =3D 0x9383 000c, ISV=3D1 so ISS is valid.
>>>> Hi all,
>>>> I wanted to take a step back on this issue before we jump into the
>>>> details.
>>>> Differently from other instructions we discussed in the past, strd and=
 ldrd
>>>> are not deprecated and are not "unusual corner cases". There is no
>>>> statements such as "please don't use this" on the ARM ARM. If I were t=
o
>>>> write an register read/write function in assembly for an RTOS, it woul=
d
>>>> be reasonable to use them.
>>>=20
>>> Just to be clear it is fine to use the ldrd/strd for accessing non MMIO=
 area. The problem comes with MMIO access because they can be emulated by t=
he hypervisor and we don't have the syndrome. At the moment, this is only a=
 problem when accessing some of the GICv3 (including ITS) registers.
>>>=20
>>>> So, I struggle to see how we'll be able to deal with all the possible
>>>> RTOSes out there that might have them in the code. We can fix Zephyr,
>>>> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
>>>> etc.)?
>>>=20
>>> This is not an Xen issue but architecture issue. The RTOSes will face t=
he exact same issue on any hypervisors unless they decided to decode the in=
struction.
>>>=20
>>> As we discussed before decoding an instruction correctly is quite diffi=
cult to do (what we have in Xen for pos-increment store/load is just a band=
-aid). So I would expect the other hypervisors to have made the decision to=
 not implement it. AFAIK KVM doesn't suppor them,
>>> Note that looking at ID_ISAR2, it seems that ldrd/strd is technically o=
ptional. Therefore, the RTOS would have to assume it is targeting a process=
or that supports them.
>>>=20
>>>> Unless we can get ARM to issue a clear guidance that strd and ldrd are
>>>> deprecated,
>>>=20
>>> Arm Arm cannot say that because ldrd/strd are necessary to modify the L=
PAE page-tables atomically. What we need to know is which instructions can =
be allowed on MMIO accesses.
>> Definitely this is something that arm arm cannot fully answer as it is a=
lso down to the full platform. MMIO accesses are going out of the CPU and h=
ence wether or not 64bit MMIO accesses can be properly done might also depe=
nd on the bus or the IP on the other side (some peripherals might just refu=
se 64bit accesses or some bus might only be 32bit so the operations would n=
eed to be divided).
>>>=20
>>> I think I already raised that when Ayan added decoding for post-increme=
nt instructions. There are plenty of instructions (or combinations) that do=
esn't provide a syndrome and yet the processor doesn't prevent anyone to us=
e them on MMIO.
>>>=20
>>> I was worry we are going to have to continue to decode instructions in =
a non-compliant way in Xen just to please a few RTOs that may not even run =
anywhere else.
>>>=20
>>> This would also reduce our leverage to request a change in the RTOes or=
 the Arm Arm (maybe there is already a statement I haven't spotted) because=
 Xen will already (badly) support the instruction.
>> Going back on the ID_ISAR2, if Xen is properly setting the value seen by=
 the guests, there is not reason for us to actually emulate those instructi=
ons.
>> The emulation code inside Xen cost a lot in matter of lines of code and =
would need a lot of testing (which is missing at the moment).
>> So as we have a standard way to inform the guest that this is not suppor=
ted, we should stick to that.
>=20
> Thanks for the feedback. AFAIU, the bit in ID_ISAR2 indicates whether ldr=
d/strd is present. If we decide to clear the bit, then it would mean the gu=
est should not use them even when modifying LPAE page-tables.
>=20
> This could be a problem because AFAIK those instructions are necessary to=
 modify the page-tables atomically. Therefore, I don't Xen should clear the=
 bit.

Agree

>=20
> Cheers,
>=20
> --=20
> Julien Grall


