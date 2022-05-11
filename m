Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46E523792
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 17:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327067.549785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nooSg-0002xA-Ff; Wed, 11 May 2022 15:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327067.549785; Wed, 11 May 2022 15:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nooSg-0002uQ-CP; Wed, 11 May 2022 15:41:14 +0000
Received: by outflank-mailman (input) for mailman id 327067;
 Wed, 11 May 2022 15:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nooSe-0002uK-9o
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 15:41:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7998b0c-d140-11ec-a406-831a346695d4;
 Wed, 11 May 2022 17:41:10 +0200 (CEST)
Received: from AM6PR10CA0051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::28)
 by PA4PR08MB5982.eurprd08.prod.outlook.com (2603:10a6:102:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 15:41:08 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::e8) by AM6PR10CA0051.outlook.office365.com
 (2603:10a6:209:80::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 15:41:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 15:41:07 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 11 May 2022 15:41:07 +0000
Received: from 7abf8b291187.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9ED56F7-1A50-4CEC-9022-12CA5D634EDD.1; 
 Wed, 11 May 2022 15:41:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7abf8b291187.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 15:41:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0801MB2017.eurprd08.prod.outlook.com (2603:10a6:203:42::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 15:40:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 15:40:58 +0000
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
X-Inumbo-ID: c7998b0c-d140-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L1I2RsbmcxBrZ3ELjoLibT1Ok2uV1+anMh+m4YzvM+TxbDMd1Vv3fTLA1dIoVqBg7xAmIDlTG4Wr9y9CZ7/hDZWFvrOq/LJ3Aj1poIfxX8LK+J4veK2qCJK4jVOQlq/fTvcYcGh8T4d8ykeSRF46kQOg78LfwxdY8rJv/hP8ycX82gBHx3YEGN6LOyzu9oIZg+RbofSId+sRUGIDBzoQkXP8A4bilBD9a/QAfiea5w4jcj77ACMDeTxxjPdtFsbolyrQ6k9IwR+gAgxLKYwzWWByUgFnuFFXyl1jQYBjHMsDgyB8WrUHyK6VoWBpkBFfakNWRWHf/Np9zp4OU2uMWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD2Mg9oNyrBHl1zd8D6rVqji58pl4Mo+sxOO4WGdHn8=;
 b=Y5KU11NQ9Z0m68tSPmkxi+ZMEwyZiRfaYxRzQPZp0+koVVB2OD3wZBJiAM2PcXiwKUuS3Dzo3H0RKP7i77qWj1+6ck/4j9IzG+Sk49PEnz3uCoDzDC78aKVSD0/UNtrMip9OwqYsGZB6675KiGmESMZ2Ivrml4TUJLMOWETv6jN9XIzzMMEI8YDiWyRX2dtXuEdr3ppxsnsX4xsJgD+JHy/2oOrALwyvOKCED6a4OoSbaNfs1qYoOHw6oPlW9GC91XgibqkAz1oi8syF85lxnbfShZ3chVkQ0rXPJPQuVeiYlfDO/ATuyOw7+DmSvfjzUZSvJhtW9jNDEs1hg+0w/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YD2Mg9oNyrBHl1zd8D6rVqji58pl4Mo+sxOO4WGdHn8=;
 b=G1ZWiCuNGzMdp55R9xzSHnDpktK80WJGrorseeKCkmOtq9gFini8mBNPXITfvokIqla4ksVMRr9R17PJ22Ts3K7v3x1wdX6gVXreS6bF54Q8oQ85dtzcoKTPZqqBrBvU67urolg6ngAYKhwxwnBW64NbQYxmmmXGYm871Qe6Wss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7112e0c9eaa634a8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZEac/waqvnbxOQ+psebciUyd/dIwzTnh3JjB3qgjEr+4X1KHD6/nlEo9rKuO96Kii1OllvYCugoJKv0eTuuyiBa9AUkueIHNb19FqCGeCLBmtc8CZUQzxjYneY8VP48rNzHiMKzZZZrFK3vs1rJ9nktkKGaLC0nbc9+nSVK8jYErkbOnjKKL8aQ6F2dRB3Yrt/bppxJrkEDr3ExU7aDCoATVD/CExSEQp0qC8KZQc3W1GFcpoFpXtmTnZr4B1QUcVstEuDTT82Eel0UlvvccbVn+86Tbw7GtkhToQRTQCyMIXAWwG4Nb37nbKbPMeXoEC1eUKFnOAzeYUjg0ut07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD2Mg9oNyrBHl1zd8D6rVqji58pl4Mo+sxOO4WGdHn8=;
 b=A5XPLcZicSRfJ+gpDrBevUl7lgmpYPaQlShMqPvRZhont+9VopP0m7gaif/+Eaywlal2GPKeG/Ci8Y6KGrRqlswAxxDC5nvclsHSiPhcjEDeCWl4Kta1Il4dzmrRVeXXm1psKgftJkA9qMceI32oVhSs8NLstq6+Nj7cnHGKx0HVOe+a3ZZy2CR9sVSXDEAg2+fqZS7wkgIzl/KZPqpjuzfWltEUtOcL1cWd8zoaGjKYOKL4r0B+15TQlf/BGwW5DJUfGhXESSWN6RA6W8WbmdtzLt7ThDSNQLPEgSDHjxDHnh9KH/XmPQ//sqSOZRfniLdi1W/3cE5LgWvQfOQyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YD2Mg9oNyrBHl1zd8D6rVqji58pl4Mo+sxOO4WGdHn8=;
 b=G1ZWiCuNGzMdp55R9xzSHnDpktK80WJGrorseeKCkmOtq9gFini8mBNPXITfvokIqla4ksVMRr9R17PJ22Ts3K7v3x1wdX6gVXreS6bF54Q8oQ85dtzcoKTPZqqBrBvU67urolg6ngAYKhwxwnBW64NbQYxmmmXGYm871Qe6Wss=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Thread-Topic: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
Thread-Index:
 AQHYXtGhqgeBKorGIE+S3ZHm07cmGK0Nc+GAgADisYCAAAtXAIAAGQ0AgAAhcYCACMpfgIACZduAgAALAICAAAXAAA==
Date: Wed, 11 May 2022 15:40:58 +0000
Message-ID: <F60293D4-0A44-4365-939E-5C1A80D7A159@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
 <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
 <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
 <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop>
 <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
 <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org>
In-Reply-To: <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d02c7a2c-3a89-4775-3a4f-08da3364aa62
x-ms-traffictypediagnostic:
	AM5PR0801MB2017:EE_|AM5EUR03FT013:EE_|PA4PR08MB5982:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB59828EA36950C7A5881AD07F9DC89@PA4PR08MB5982.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vO7QZ9fundD/voyTEd/5QxuAwct0mVp6WWtZbYfsyamQXFte+tJS1m8nFtxgHE5ssny1rOffLFCT93GwgBXkaSc0ecCXoBSENATjy2VZD1l2nc1zuUIRjUvrD4xxKubOUxGmO/jk3r0d+lZLzHg3AvSGCb2Z3zh2L8HfKQoYLSHL1BR+KnBLMg6/czCzGnKfymA8F4EOpJ8ZZjFWz8kBTJiUI6uPOh100M77qMgezN8IrTh18W0Q42pH6Q1s+Z+p2xPDkwTqzPg5BEFho1osnSq7Q3xfam1DfYns84+oifVvhV4dji+fgaJz2IIb22bOsP26P26YT5Pt3TigHGMLF9AFSf6bDbjbHBEBR5deUME026D7/RvSlj8WJmYspL+wHV6tZHfcWUI60/NlIfxrmrCfmpOxyTk3+h6R6gsM7py4EeeSMpX3DfwunaeibGBNMvdB+pA3twsym21u7Wb02OfNLH4MKvv59wi3+ULfI6Zc1KyWgnOLE8I4N6KK7V6xVKtqxjApn8sxmCbtDLvaMLGkhqlUAv+h8pu0UNm9bRH4H2rQJH2ETmc9UpSKsaPeeyQWUJ1MgSI669SkjEeurvj3x99ls6HLAZ7jE/IzKo+QgCKEMoyWHEL7paoy0czDFDEadja/DzLYay2RWQQc/nFrplWCpsaWaJncXa9tQrJlG5qXyC0x8ixKQpoW7Y4DMWsnV6OxaoGATyalZCvc2vWkz6NnxlX96oG6vcQ9wCxenxAK01CstbjWkI5YAss4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(26005)(2616005)(6512007)(316002)(71200400001)(33656002)(186003)(6506007)(86362001)(5660300002)(2906002)(53546011)(122000001)(83380400001)(36756003)(91956017)(6916009)(54906003)(8676002)(64756008)(66946007)(4326008)(66446008)(76116006)(66476007)(66556008)(38070700005)(38100700002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BDE82D4C88E9264393E849F87BA592DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d285424-cce0-494b-78ec-08da3364a523
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QEvp+oto1DiT6q+L5gDVay2JAAP6PjJ6V9L0cksgR4YZPJsS/+XS9cOUlGYA2dDx1jvV0jx/653IW222GRzd1ZrOS/77VjOT9jXO06LWmvxrjtlGn5LYTaDeyP7ZyGofM6XQatfZd9tOAbHM+w3c0itcfUNUybmoWMPBZu+KhK6NiQkQBr4SxDWMEHuJHzHOGIviuMmPP3AlI/8VSdtbo2hnNVHRbcUerL6L1tg0P3gS60uW8zCvMf3wVve9Xv0hUK62uJbLm5AhWSo+eVMHNtcddygoguiRaF2WaKjJkk/2BEzdXqqvC6zHSu/Tv/HcaJv40OKkLX7zgLIKfcfvf59NZuzKGe2kXjz7AzKdPbCpd+ntFhFlNsXnKo28jzt6QHvon3C42tjLgJyQR/BOf8F4l+LZ5Rwr/rHm02ogvBwchiLrapkjwcm9rX1HEUng054cyq9dcVZE+ZZojZNMyceL/jvWh2swHg/Pqtp78fc8eK1RO2x8j4ExTQpaT5q3tVBrbOV+DObtoNKDmhtgMeqNpw8WLsGQMF+AEim5jlTnIh4EihWx6hEwM6KFNKJ6bDochSBb0C+tJ8kufA+kU+3MjbJZTtltoLGpQDgvi/9X3vsUXy/99FE1MZWYaNN6LRAGogT4gGHcav0yJS+GYp5k0x7HC0RV2Rq4onUjRKiFXOvSwHgBltgjKMtgepcV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(81166007)(36756003)(8936002)(36860700001)(508600001)(6862004)(8676002)(33656002)(2906002)(70206006)(70586007)(356005)(83380400001)(54906003)(336012)(86362001)(40460700003)(53546011)(6506007)(107886003)(2616005)(5660300002)(6486002)(316002)(82310400005)(47076005)(6512007)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:41:07.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d02c7a2c-3a89-4775-3a4f-08da3364aa62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5982

Hi Julien,

> On 11 May 2022, at 16:20, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 11/05/2022 15:41, Bertrand Marquis wrote:
>>> On 10 May 2022, at 03:03, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Wed, 4 May 2022, Julien Grall wrote:
>>>>> Do I understand right that it is ok for you if I push one patch menti=
oning
>>>>> all the commits done in Linux corresponding to the changes (instead o=
f one
>>>>> patch per commit) ?
>>>>=20
>>>> For this case yes.
>>>=20
>>> I managed to do a review of the patch by doing a diff of the relevant
>>> portion of Xen cpufeature.c with Linux cpufeature.c (from commit
>>> b2d229d4ddb1), and the relevant portion of Xen sysregs.h with Linux
>>> sysregs.h (diff -E -b -u).
>>>=20
>>> Everything checks out.
>>>=20
>>> In my opinion, this patch should be split in 2 patches: the changes to
>>> cpufeature.c and sysregs.c that come from the Linux sources; and the
>>> updates to cpufeature.h that do not. If you do that you can add my
>>> reviewed-by to the first patch with the changes from Linux.
>>>=20
>>> The list of individual commit IDs would be nice, but thanksfully the tw=
o
>>> source files are still "diffable" so in my opinion are not required.
>> I agree with that.
>> Julien: Do you agree if I just put the changes to cpufeature.h in a sepa=
rate patch ?
>> I started to list the commit IDs corresponding to the changes in Linux a=
nd this would
>> end up with 5 or more which I do not think would be that useful as the d=
iff can be easily
>> done as Stefano mentioned.
>=20
> It looks like there are some confusion why I asked the list of commit. Fo=
r this case, this is not about diffing the code (it is easy to do and I hav=
e already done that). It is more about authorship and where the patches com=
e from.

This is clear from the commit message as I give the commit in Linux used so=
 the history can be easily found from that.
I am a bit lost on the authorship part ...

>=20
> Technically, speaking you only copied the code from Linux and therefore y=
ou are not the author of some of the changes.
>=20
> For such case, our general process is:

Could you tell me where this process is described ?

> 1) Backport the commit as-is (i.e the Author is the original Author)
> 2) Add the tag Origin (recently introduced)
> 3) Add your signed-off-by

So following this theory, if we import a file from Linux we should list all=
 the people who contributed to it since it was created ?

>=20
> I understand the patch is already written, so I was OK if you simply list=
 of the commits with the authors/tags for this time.

I would like to understand where this requirement is coming from.

@George: is there some kind of legal reason for something like that ?

>=20
> If both Stefano and you agree to not keep the authorships, then I will no=
t stand against it. However, I will not get involved in committing and addi=
ng my ack.

I want first to clear up this process and understand why you are requesting=
 this to know how I should do anything like that in the future.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


