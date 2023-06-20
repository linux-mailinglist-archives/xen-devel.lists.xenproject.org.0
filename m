Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B6A736AA5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551679.861313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZK5-0001tv-FV; Tue, 20 Jun 2023 11:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551679.861313; Tue, 20 Jun 2023 11:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZK5-0001rR-Cd; Tue, 20 Jun 2023 11:14:57 +0000
Received: by outflank-mailman (input) for mailman id 551679;
 Tue, 20 Jun 2023 11:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2irc=CI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBZK3-0001H0-BT
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:14:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adffcf8d-0f5b-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 13:14:53 +0200 (CEST)
Received: from DB3PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:8:1::43) by
 AS4PR08MB7949.eurprd08.prod.outlook.com (2603:10a6:20b:575::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 11:14:49 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1::4) by DB3PR06CA0030.outlook.office365.com (2603:10a6:8:1::43)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 11:14:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 11:14:49 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 20 Jun 2023 11:14:49 +0000
Received: from d4b43e7e50b2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 513C8910-1812-486D-96EB-69D34C6BA6F6.1; 
 Tue, 20 Jun 2023 11:14:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4b43e7e50b2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 11:14:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB3PR08MB9088.eurprd08.prod.outlook.com (2603:10a6:10:430::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 11:14:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 11:14:35 +0000
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
X-Inumbo-ID: adffcf8d-0f5b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RZ3N4fkwmcjTK1M/cwxWJIZ83Jv+/9dPTwWI41AjuQ=;
 b=PvziarorUn2INGxX1zM0/CsvzMNZm1iaNCw81NB0iuPDqkaT3sivCzD7u5zuujJfEC6pvRtDbyOowLjXszEtWvKyND2UunJRZfniPx74K8Y5kosnIS7BXzGGgiEU2yB68i6Ow/1gwtYLZoq3dHa+9Zl0GrQkf0Rib4Kis+7ONSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1322fc761d540a61
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmlkX1nYG9ETxCWJdt8rONFts+ui2DbPJ4FVvvIYpEhQ/JAtLNNxMRo1pFGxX5Z4qC3+M/41x3XMjqJePyPjHL61Kz6W8DWYIhNJAusDBJz350bCzLTKrXvY/HPaVveDat9yn9c2gVn1JJHYLyaPx8ZfkJietzHQlV+ijeM/rDQmKK7AOrnNTJ+fCFuxGvIr9KQjU39rTrc74s96WyiKeVWpOrUiFC/QVjU5qr8TDczvd4x+3Ysz1TZnSXn9limXozsF10unSexgH3WmSv7LyZEyjUJ3IeJbDgClD/Z4mP+KsIOC821xnVQIPN+j1MTt2iUtLZuZQROPWDHDGi159Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RZ3N4fkwmcjTK1M/cwxWJIZ83Jv+/9dPTwWI41AjuQ=;
 b=nIkNrS5/nsea2155Cb8FxGweyBYg18h7uNzbI7BY+YQHEM0JAkuLGxfxOGJSchscLxQyDrDVo155ornxkZuPj87kGn22XU2YJgtUfTogLXVZ8JzvUS8UWhdoC+shYmAGVid6Xo44AvektQ0BFBtj4OJQVdzk6SOLIcY7J3QsHLEu1zEPCPi7ksKm1AkNYzAeiaPS9mI+cSm9nA1qQrI/2t8xd7JwffMP26fiSztntqq/2wDVYJYqX0VjYL4tnvqG57Z/O40dIZHvUZZAQhCHqUFOMl1tacJQahXTpre1q5hMLW8k/YDUYLO2MW9BMSe62T4Wrx9hSQx+/LR7Z8uGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RZ3N4fkwmcjTK1M/cwxWJIZ83Jv+/9dPTwWI41AjuQ=;
 b=PvziarorUn2INGxX1zM0/CsvzMNZm1iaNCw81NB0iuPDqkaT3sivCzD7u5zuujJfEC6pvRtDbyOowLjXszEtWvKyND2UunJRZfniPx74K8Y5kosnIS7BXzGGgiEU2yB68i6Ow/1gwtYLZoq3dHa+9Zl0GrQkf0Rib4Kis+7ONSY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Thread-Topic: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Thread-Index: AQHZos+3kgkgJrhp6UigH6k9WVt2Wq+Tix6A
Date: Tue, 20 Jun 2023 11:14:35 +0000
Message-ID: <AC854894-5328-4B17-91A2-9289ACA20160@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-4-julien@xen.org>
In-Reply-To: <20230619170115.81398-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB3PR08MB9088:EE_|DBAEUR03FT025:EE_|AS4PR08MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a684e9-2655-4129-e90d-08db717f8fe9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XBygSTfnqfmRTx7bNOS0m0Yc/lYTOaypUDrB6DIikx1xjWWU0yUc1KCzOVQFmWKM+zWj+1M1k33Ku/W2MO6Cu4pabJBJO0WpAEjG5u9j9+NtULKJX9jnkVsoNtztbeaxSzQDw2SBVH+JzlGs6bo+CP0an78QYPVd55n5i2C6swD4EQyre7VkWoKr//03L2uAaV5UyLpcH6qwh4fG8jc1g6qnFn6lvIvCgtnjqG/owQF9mcacYjPWRbhQxA0LcI9vCcexvHjT+Lyp7eKh7Wm/0yrFQ5yexS5+nSOoL6DoJQ/JH+2WcHs9zeqq2TfTNFTlRZrF0Jg8fQ7egix6MU8nDxoaqoZ2GkEe26p0dFpDLzfb6wFTlBUPnSBofMrjrtDiSdCJ40ea3Eq/G8GbIG923uJT3q3UFB9Wrq7V2PDow1RAC1BwPjSKdOhvLkZgk8oDIld1B8a78ego7yiXsa4G5ht1CTTRB1VAgo5aMrnJ/WLe3SKoAQHkUxaXNsUhx2Jqe1957GdFdkOPhppzc5tGK91hqY960nOhqRxgPC4fBOGBC9RkBtr9tA7mSj91s3CYFx/RZDZ4KLDEhuKivN6AVWsmbSyR0J33mtMzSdlkg9VMMvIPGv8TuBQT3Run+1tPfJb0H6+WGlSWLIBgWdEX9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(2906002)(6512007)(6506007)(26005)(2616005)(186003)(53546011)(6486002)(91956017)(76116006)(66946007)(8676002)(8936002)(66556008)(66476007)(66446008)(41300700001)(316002)(64756008)(4326008)(6916009)(478600001)(71200400001)(54906003)(5660300002)(38100700002)(122000001)(36756003)(33656002)(38070700005)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CCDFD266F1D4EC438A84C34278610BD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9088
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91126f10-b0c4-4feb-066b-08db717f87c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DIeIo5RUXucjh2HhN+V3KecHXB1kSl3qB9XKihLNF0IPbLXCJ7nm5HcNUh/1y5CLhZFaVidUa3RXAOnFP3TMo6e1WJtwlTbI0kxiKUZaGtkMCOYpZiYhcxOmVRauon1iZLqcndTQ7o1i+3VQmIju0iwiUcRL09O+yCBAURV9L03GXyU+ETThOwwRyGB5daO5vp0TvVau/jhFB59mix13t3wRXZQ5Ij7+bdfHYDyFTqJMmSZDVJ3sPlzPiYSAyNIMytiakS0/HQYlSpHP+ufW8yLskhFnXMCtJLvQf2eEntkJf4D+Gfm1ZKrjDANwyGjdeTQekk1nVcZlxYgfKqobC0tuj8SHaGp55jQm658fE6v35qFefF6Y4Vd06Cst/gTrcwDTxEFgZXz21OPxsk4eEIPHwbk/eg0MElG8oxm3q+/Px3UKrIplD3WmYaAsKorA5uTIT5ZsByrTBXm2F3PlhZ371P0oLEgDhNU8d+Mk/wob6HLnsq0faW8dG0FhuGTSSRFtNwEHKXLnfNHtreYuz8WxJhnZ2ZTUZfxEtIH4pSd3oyRZ3U2aBjPrX6lO6XdvzOPVCU++Pwp/Am8za4ArCfg5+aach6y//qVCN0CQFedU4Z5kbXhUFcIJVoCiyiJGL9vrKBPYI2pkeqh4AWClRKE/as0ykplsFH9mA719AV3t9PyhBTvXElNAaY3Kc00bKQ+C09FQ/+TN28CLfxBJCIeRrMenPRSkUNFAxBHiWsNxi9T5frEUVsANnJgNCfWZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(8676002)(6862004)(4326008)(70586007)(70206006)(316002)(2906002)(54906003)(41300700001)(36860700001)(6486002)(40460700003)(478600001)(82740400003)(107886003)(40480700001)(26005)(6512007)(53546011)(186003)(36756003)(83380400001)(336012)(47076005)(33656002)(81166007)(356005)(6506007)(82310400005)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:14:49.2157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a684e9-2655-4129-e90d-08db717f8fe9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7949



> On 19 Jun 2023, at 18:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> On older version of the Arm Arm (ARM DDI 0487E.a, B2-125) there were
> the following paragraph:
>=20
> "DMB and DSB instructions affect reads and writes to the memory system
> generated by Load/Store instructions and data or unified cache
> maintenance instructions being executed by the PE. Instruction fetches
> or accesses caused by a hardware translation table access are not
> explicit accesses."
>=20
> Newer revision (e.g. ARM DDI 0487J.a) doesn't have the second sentence
> (it might be somewhere else in the Arm Arm). But the interpretation is
> not much different.
>=20
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
>=20
> Fixes: 2b11c3646105 ("xen/arm64: head: Remove 1:1 mapping as soon as it i=
s not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



