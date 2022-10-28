Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF5611277
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 15:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432063.684758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooPBS-0008N1-SM; Fri, 28 Oct 2022 13:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432063.684758; Fri, 28 Oct 2022 13:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooPBS-0008Kx-PI; Fri, 28 Oct 2022 13:14:02 +0000
Received: by outflank-mailman (input) for mailman id 432063;
 Fri, 28 Oct 2022 13:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqEQ=25=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ooPBR-0008Kr-3H
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 13:14:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 627266bf-56c2-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 15:13:59 +0200 (CEST)
Received: from AS8P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::17)
 by AS8PR08MB8249.eurprd08.prod.outlook.com (2603:10a6:20b:53f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 13:13:57 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::14) by AS8P250CA0012.outlook.office365.com
 (2603:10a6:20b:330::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Fri, 28 Oct 2022 13:13:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 13:13:57 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 28 Oct 2022 13:13:56 +0000
Received: from 250b8ccacc88.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBCD2236-15B4-40AC-B42D-1A47B5BB3217.1; 
 Fri, 28 Oct 2022 13:13:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 250b8ccacc88.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 13:13:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6368.eurprd08.prod.outlook.com (2603:10a6:102:159::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 13:13:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 13:13:42 +0000
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
X-Inumbo-ID: 627266bf-56c2-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UrXRE2cJHszoBFq6ddevWRYWfYfn8k0n4qBn5gX8cU0mylF2fE5/QT73ewBvULiPSmRDYUo37QFnroj7W7Hh16Bghh2Pq1juT//fnmHxyCPElUTjk9Xpj7/OXRIRrDBtV4MjAnt7cMZWyPr0wm+IiFse87DGIZtO0Is0EmLKJBBr19AVEIgkmUQJ856Xc2hZVNkA81eU2ekGbCSX4pQreco2rKjhH/WSl3Y9drRMXfJPGztqozgPwPZ3aadeyktK0qhnA4+XNnq2XefZEYAfBlzisnLO0yT/Yk/VPoxc9Y3Eu7NMnpQkkCjr9xEZGcjfNKx6DgKAfTzLBtI1md1NGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq7r8Hv4HfMPFp24z5skg9bXgMbAh3TGz2A5+IJwmzw=;
 b=nCN0LmeubQSm/JfrA3HdJjppf5zY8SJVeJPuHtnIpGJQpRR4RADNv6ue+0xOELslBE9VCXPWcRWMS5v6BWdpVcpUx00Mst+S2hJ4KdcWUFKUxT0iKcl1zlaORidr7B8vOhj7BqSe9s8I18SEUWCpCSzgj7q++ylkDgQmERw5lN13GIznnkHgPCw08VUpslQj7dXVh3K1oSDP5ynskyVvA9vjMrF773+Gml0CgqqVw4CaKmVBCEL2mggnzEOxbEBG+nvWuqC62gX4DJEHLFAjV/mIhnmh9creouMdYtZhPx2MAWFjXbK7cAX6MYXjGgLEiVOkigRjBW2z7iriADh1jQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq7r8Hv4HfMPFp24z5skg9bXgMbAh3TGz2A5+IJwmzw=;
 b=eXu+hdrXgmqHa5IXyS7IaAUE/+tYmIT0LZOvtd8gR/7of9RmmfgnKZTwLSQJ7ZIVIfvEyLijUhibLnaX1N2VmiQkZ+ffPI0zh2oPUzIfZ27pzqPy4U/D/D1yY7JJ5PKL32XiZDJZjOD8wGBx2gkk3Lzu+fpIt87w1J4ANAQGdmg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7490f930d0b41a78
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQgJnulKzt2cTRYRB+nRbV7IrNioqZKzSY9TWbBxKi7M73NdtAuVDgx+Z5fA8hmwq1Mqai4ahdpYO05fk53D4kkmKOpoH9zXGUaLE2ybKfuiO0o2Hlh3ITAs8n+/xxXkEZMBcqB7sLXRAusMBgUjaBJaDT3SG8y4FHPBUDTXBcme3aSG009yL+luM9a7PwXs8fn5eperWOzBDDrnbUiJU0iFSteT6JYsMhlZ3nconZUb/xopneC35dBfeLjqcu5CSeEd1d2hXTV1C66KHTPZ+mkjSei+4Ke56RgYUQnBjhY1iIF2nk580njGqvO6+jrGI/XKXq5GudbEDpn9bxDXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq7r8Hv4HfMPFp24z5skg9bXgMbAh3TGz2A5+IJwmzw=;
 b=KnSeMoOcjth7DIpmeq4WjnpmkEZWvx4sGSu0zb31f5LV0zEqonj480E0em5Dikv+UeEmeJwNRe9Iz6YQucE8k9UNmAWspwbmuWfZepqaESRifKckyYiNGJsdmqy9qjWrNx3eHj5uOSrE3SWfk15gvaqF0lnyhkLWDrMPjai6UkvymXIYnSQi3hD0vEnsHuSoVRrTvIHwAWuiEVaPX2xu9RHMhO9IfT+l5HIY8h/cwOyL9kOn8TP90Dq8/UE1yWrSeSWqNwAIDF0gV3nyLlftRzQjDYUudCFJt47LIkC+YDyLKK+YrZExk/zVXNeFp6NJGRqhO0IINYxJbxo9HgIgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq7r8Hv4HfMPFp24z5skg9bXgMbAh3TGz2A5+IJwmzw=;
 b=eXu+hdrXgmqHa5IXyS7IaAUE/+tYmIT0LZOvtd8gR/7of9RmmfgnKZTwLSQJ7ZIVIfvEyLijUhibLnaX1N2VmiQkZ+ffPI0zh2oPUzIfZ27pzqPy4U/D/D1yY7JJ5PKL32XiZDJZjOD8wGBx2gkk3Lzu+fpIt87w1J4ANAQGdmg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <Michal.Orzel@arm.com>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index:
 AQHY6T1V+gcJbmRqpEyt0b8GeG9bFq4grXIAgAAQCACAAFf9AIABVMyAgAAG64CAAVVJgIAAAzuAgAACBwA=
Date: Fri, 28 Oct 2022 13:13:42 +0000
Message-ID: <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
In-Reply-To: <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6368:EE_|AM7EUR03FT008:EE_|AS8PR08MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b42318d-18e7-4cff-0c4b-08dab8e6454f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9VyJJt86UX4//VErB5JDNlLphOHnyBmz6CVdU9rR8xvjka4uVj7xluy7D+LZUVI5/Y9nAbLN17bnyEn4Ma1ZVDnl89DjAlKxwED6KorBYkXe8VDp8ea+PEE+w0VtkleNBMGcDUFgaTvg8Q46udBSjXyv1TXI0D8ZT6G1AepAp7fm+D73nNYORUj7FoYybWqdWwkVKk5I7QyG145S0YrLAOVTmphprNAF9993hUJxr5nEJGvAbJGO56heNv+rXVSoo5S8OSyUkHDVW428zS0SUpfSilPNigECOhFfbWIyg3tH9tC95ySBKobHIlqNa/CXiML+3P0ZIJ1rhbUSvweONe2BUndYb0E1r9TFrTTnXvl0FDwBNc5tnfmz72f4AzijSMLtYFameSKwuvBCnOQiYr01bRvgMm5srsHORbuXnXo73opX9JQLjdqtqp53FvjUgMfsUYmgWPUwaLZpg4GyvldD2ZeEygclgTDYPYLbQXug4kW4lVZb4a/T0vdlrTI5Icy8hMQhoefcqK0P+Jt+aeCdekn4fSU3uoCnAd7XNv+zOG0x0bR1+1FBIBM35FQVV0Xv/qNY2HMNEWXB2JeKDNFv6r0cHFQWxvy2Evu3jLCr4Eow8MEF9qXN7zjbaX5jZQj2OSt1ij0LR59F+K273Wm1CQ6nngcjva4RTQ/KQyfDkpTJRrYJlmqQ4H2o3I3RZQgBlR5QXrY3ckotLt+Pg5J8d+SzN/8NxREuomjqUSmkniK9UaDAc34/yO7TS6UqDSspLDIGhu+GMnqP12pkTR8UgjhUkShDmTEQoPYM6+M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(38070700005)(38100700002)(7416002)(2906002)(5660300002)(26005)(6506007)(53546011)(6512007)(66556008)(66446008)(64756008)(8676002)(66476007)(66946007)(4326008)(91956017)(8936002)(122000001)(41300700001)(76116006)(36756003)(33656002)(6486002)(71200400001)(2616005)(186003)(6916009)(54906003)(86362001)(478600001)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <136AA14B40E78F429309B6D61F6429BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6368
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cfcce145-f0de-4b98-5162-08dab8e63ccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNpZyD0tEFPO76YvbSxy7IwlDu/JJSoGhpjVLLSKYdAkTqprG+PuQ+HUwTp5Ie6bHPwEhrHiVaMD8R6xyk4pY02PVGpTj7IC7WgThgQ46Tu7IPi+GA/OL4SKylrXey7IPBelGN1+zMuANu9lpnZLZJ13HAWFuEYsYqP6VM+dfXhfiA80S89cCO/obb4fzVTvmDTeJ86O5XjfTS/06AO87d9ufIN39qEZAtCAbk/MNdcL0S2uOlmz4efECPPxbTFX81Ktcl4SRWOnj8QfD1enj/IajjXwniFFgPN0wEd1fOA+z8fdmFTLIy9pnfKsSW2kvwps4nPA3Jf4A2FPbIr2voC8gzCCwvlGGxjzp5ASyyw85/USe79epPAhbKBFampuh7VnAcPu15lDLZtCnG0Vq364o9JptN2SpfRiwvvQtWWX6jhIWCbUsm2ZWBTURopJSFZ6IgaJiV9dAj+JOTJ2owdIQREXblDo9OMqb4vb26UysjDzxCmMC7euFNCh6SNeB7KK96ejUbvgCWQNx7oCymx4WaPrhplnEWxRQtquBxuk8IGgaTg9YfZIeVgtH+EgDdvPM7KWH9k7pbZQGSc1JFkg9kP/F/I4j3zvJH3z8kbk3vo9caIJ1O7t/EVDJB0+iOJpuUJ3cuB0xXwc+JC95zrOxumDe2vL+x/R3KyqWQgOEmj5wR1o4i5SD7usBXunqd3JDbE5oq87VmGrNBYDovefPnak+Z8YqeiK/1jqYCnR0Pa3OlJdaPdUZXmb/BRdtrUhxTXMNFupd96SIEmpSg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(40480700001)(478600001)(53546011)(54906003)(107886003)(6486002)(4326008)(8676002)(70586007)(316002)(70206006)(6506007)(41300700001)(26005)(6512007)(36860700001)(8936002)(6862004)(5660300002)(33656002)(36756003)(40460700003)(186003)(86362001)(336012)(83380400001)(2616005)(82310400005)(356005)(82740400003)(81166007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 13:13:57.0518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b42318d-18e7-4cff-0c4b-08dab8e6454f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8249

SGkgSnVsaWVuLA0KDQo+IE9uIDI4IE9jdCAyMDIyLCBhdCAxNDowNiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IE9uIDI4LzEwLzIw
MjIgMTM6NTQsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+PiBGb3IgQUNQSSwgSSB3b3VsZCBo
YXZlIGV4cGVjdGVkIHRoZSBpbmZvcm1hdGlvbiB0byBiZSBmb3VuZCBpbiB0aGUgSU9SRVEuDQo+
Pj4+Pj4+IA0KPj4+Pj4+PiBTbyBjYW4geW91IGFkZCBtb3JlIGNvbnRleHQgd2h5IHRoaXMgaXMg
bmVjZXNzYXJ5IGZvciBldmVyeW9uZT8NCj4+Pj4+PiBXZSBoYXZlIGluZm9ybWF0aW9uIGZvciBJ
T01NVSBhbmQgTWFzdGVyLUlEIGJ1dCB3ZSBkb27igJl0IGhhdmUgaW5mb3JtYXRpb24gZm9yIGxp
bmtpbmcgdk1hc3Rlci1JRCB0byBwTWFzdGVyLUlELg0KPj4+Pj4gDQo+Pj4+PiBJIGFtIGNvbmZ1
c2VkLiBCZWxvdywgeW91IGFyZSBtYWtpbmcgdGhlIHZpcnR1YWwgbWFzdGVyIElEIG9wdGlvbmFs
LiBTbyBzaG91bGRuJ3QgdGhpcyBiZSBtYW5kYXRvcnkgaWYgeW91IHJlYWxseSBuZWVkIHRoZSBt
YXBwaW5nIHdpdGggdGhlIHZpcnR1YWwgSUQ/DQo+Pj4+IHZNYXN0ZXJJRCBpcyBvcHRpb25hbCBp
ZiB1c2VyIGtub3dzIHBNYXN0ZXJJRCBpcyB1bmlxdWUgb24gdGhlIHN5c3RlbS4gQnV0IGlmIHBN
YXN0ZXJJZCBpcyBub3QgdW5pcXVlIHRoZW4gdXNlciBuZWVkcyB0byBwcm92aWRlIHRoZSB2TWFz
dGVySUQuDQo+Pj4gDQo+Pj4gU28gdGhlIGV4cGVjdGF0aW9uIGlzIHRoZSB1c2VyIHdpbGwgYmUg
YWJsZSB0byBrbm93IHRoYXQgdGhlIHBNYXN0ZXJJRCBpcyB1bmlxLiBUaGlzIG1heSBiZSBlYXN5
IHdpdGggYSBjb3VwbGUgb2YgU01NVXMsIGJ1dCBpZiB5b3UgaGF2ZSA1MCsgKGFzIHN1Z2dlc3Rl
ZCBhYm92ZSkuIFRoaXMgd2lsbCBiZWNvbWUgYSBwYWluIG9uIGxhcmdlciBzeXN0ZW0uDQo+Pj4g
DQo+Pj4gSUhNTywgaXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgaWYgd2UgY2FuIGRldGVjdCB0aGF0
IGluIGxpYnhsIChzZWUgYmVsb3cpLg0KPj4gV2UgY2FuIG1ha2UgdGhlIHZNYXN0ZXJJRCBjb21w
dWxzb3J5IHRvIGF2b2lkIGNvbXBsZXhpdHkgaW4gbGlieGwgdG8gc29sdmUgdGhpcw0KPiANCj4g
SW4gZ2VuZXJhbCwgY29tcGxleGl0eSBpbiBsaWJ4bCBpcyBub3QgdG9vIG11Y2ggb2YgcHJvYmxl
bS4NCg0KSSBhbSBhIGJpdCB1bnN1cmUgYWJvdXQgdGhpcyBzdHJhdGVneS4NCkN1cnJlbnRseSB4
bCBoYXMgb25lIGNvbmZpZ3VyYXRpb24gZmlsZSB3aGVyZSB5b3UgcHV0IGFsbCBYZW4gcGFyYW1l
dGVycy4gVGhlIGRldmljZSB0cmVlIGlzIG9ubHkgbmVlZGVkIGJ5IHNvbWUgZ3Vlc3RzIHRvIGhh
dmUgYSBkZXNjcmlwdGlvbiBvZiB0aGUgc3lzdGVtIHRoZXkgcnVuIG9uLg0KSWYgd2UgY2hhbmdl
IHRoZSBtb2RlbCBhbmQgc2F5IHRoYXQgWGVuIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycyBhcmUg
Ym90aCBpbiB0aGUgY29uZmlndXJhdGlvbiBhbmQgdGhlIGRldmljZSB0cmVlLCB3ZSBzb21laG93
IGVuZm9yY2UgdG8gaGF2ZSBhIGRldmljZSB0cmVlIGV2ZW4gdGhvdWdoIHNvbWUgZ3Vlc3RzIGRv
IG5vdCBuZWVkIGl0IGF0IGFsbCAoZm9yIGV4YW1wbGUgWmVwaHlyKS4NCkkgdGhpbmsgd2UgbmVl
ZCB0byBkaXNjdXNzIHRoYXQgYW5kIG1ha2Ugc3VyZSB3ZSBzdGF5IGNvaGVyZW50IGJlY2F1c2Ug
cmlnaHQgbm93IHRoZSB1c2VyIHdpbGwgaGF2ZSB0byBkbyB0aGluZ3Mgb24gdGhlIGNvbmZpZ3Vy
YXRpb24gYW5kIG9uZSB0aGluZyBpbiB0aGUgZGV2aWNlIHRyZWUuDQoNCkNoZWVycw0KQmVydHJh
bmQNCg0KPiANCj4+PiANCj4+Pj4+IA0KPj4+Pj4+IFRoZSBkZXZpY2UgdHJlZSBub2RlIHdpbGwg
YmUgdXNlZCB0byBhc3NpZ24gdGhlIGRldmljZSB0byB0aGUgZ3Vlc3QgYW5kIGNvbmZpZ3VyZSB0
aGUgU3RhZ2UtMiB0cmFuc2xhdGlvbi4gR3Vlc3Qgd2lsbCB1c2UgdGhlDQo+Pj4+Pj4gdk1hc3Rl
ci1JRCB0byBjb25maWd1cmUgdGhlIHZJT01NVSBkdXJpbmcgYm9vdC4gWGVuIG5lZWRzIGluZm9y
bWF0aW9uIHRvIGxpbmsgdk1hc3Rlci1JRCB0byBwTWFzdGVyLUlEIHRvIGNvbmZpZ3VyZQ0KPj4+
Pj4+IHRoZSBjb3JyZXNwb25kaW5nIHBJT01NVS4gQXMgSSBtZW50aW9uIHdlIG5lZWQgdk1hc3Rl
ci1JRCBpbiBjYXNlIGEgc3lzdGVtIGNvdWxkIGhhdmUgMiBpZGVudGljYWwgTWFzdGVyLUlEIGJ1
dA0KPj4+Pj4+IGVhY2ggb25lIGNvbm5lY3RlZCB0byBhIGRpZmZlcmVudCBTTU1VIGFuZCBhc3Np
Z25lZCB0byB0aGUgZ3Vlc3QuDQo+Pj4+PiANCj4+Pj4+IEkgYW0gYWZyYWlkIEkgc3RpbGwgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBpcyBhIHJlcXVpcmVtZW50LiBMaWJ4bCBjb3VsZCBoYXZl
IGVub3VnaCBrbm93bGVkZ2UgKHdoaWNoIHdpbGwgYmUgbmVjZXNzYXJyeSBmb3IgdGhlIFBDSSBj
YXNlKSB0byBrbm93IHRoZSBJT01NVSBhbmQgcE1hc3RlcklEIGFzc29jaWF0ZWQgd2l0aCBhIGRl
dmljZS4NCj4+Pj4+IA0KPj4+Pj4gU28gbGlieGwgY291bGQgYWxsb2NhdGUgdGhlIHZNYXN0ZXJJ
RCwgdGVsbCBYZW4gdGhlIGNvcnJlc3BvbmRpbmcgbWFwcGluZyBhbmQgdXBkYXRlIHRoZSBkZXZp
Y2UtdHJlZS4NCj4+Pj4+IA0KPj4+Pj4gSU9XLCBpdCBkb2Vzbid0IHNlZW0gdG8gYmUgbmVjZXNz
YXJ5IHRvIGludm9sdmUgdGhlIHVzZXIgaW4gdGhlIHByb2Nlc3MgaGVyZS4NCj4+Pj4gWWVzLCBs
aWJ4bCBjb3VsZCBhbGxvY2F0ZSB0aGUgdk1hc3RlcklEIGJ1dCB0aGVyZSBpcyBubyB3YXkgd2Ug
Y2FuIGZpbmQgdGhlIGxpbmsgYi93IHZNYXN0ZXJJRCBjcmVhdGVkIHRvIHBNYXN0ZXJJRCBmcm9t
IGR0ZGV2Lg0KPj4+PiBXaGF0IEkgdW5kZXJzdGFuZCBmcm9tIHRoZSBjb2RlIGlzIHRoYXQgdGhl
cmUgaXMgbm8gbGluayBiZXR3ZWVuIHRoZSBwYXNzdGhyb3VnaCBub2RlIGFuZCBkdGRldiBjb25m
aWcgb3B0aW9uLiBUaGUgcGFzc3Rocm91Z2gNCj4+Pj4gbm9kZSBpcyBkaXJlY3RseSBjb3BpZWQg
dG8gZ3Vlc3QgRFQgd2l0aG91dCBhbnkgbW9kaWZpY2F0aW9uLiBEdGRldiBpcyB1c2VkIHRvIGFk
ZCBhbmQgYXNzaWduIHRoZSBkZXZpY2UgdG8gSU9NTVUuDQo+Pj4+IExldCdzIHRha2UgYW4gZXhh
bXBsZSBpZiB0aGUgdXNlciB3YW50cyB0byBhc3NpZ24gdHdvIGRldmljZXMgdG8gdGhlIGd1ZXN0
IHZpYSBwYXNzdGhyb3VnaCBub2RlLg0KPj4+PiAvZHRzLXYxLzsNCj4+Pj4gLyB7DQo+Pj4+ICAg
IC8qICMqY2VsbHMgYXJlIGhlcmUgdG8ga2VlcCBEVEMgaGFwcHkgKi8NCj4+Pj4gICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47DQo+Pj4+ICAgICNzaXplLWNlbGxzID0gPDI+Ow0KPj4+PiAgICBhbGlh
c2VzIHsNCj4+Pj4gICAgICAgIG5ldCA9ICZtYWMwOw0KPj4+PiAgICB9Ow0KPj4+PiAgICBwYXNz
dGhyb3VnaCB7DQo+Pj4+ICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOw0KPj4+PiAg
ICAgICAgcmFuZ2VzOw0KPj4+PiAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+Pj4+ICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4+Pj4gICAgICAgIG1hYzA6IGV0aGVybmV0QDEwMDAw
MDAwIHsNCj4+Pj4gICAgICAgICAgICBjb21wYXRpYmxlID0gImNhbHhlZGEsaGIteGdtYWMiOw0K
Pj4+PiAgICAgICAgICAgIHJlZyA9IDwwIDB4MTAwMDAwMDAgMCAweDEwMDA+Ow0KPj4+PiAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8MCA4MCA0ICAwIDgxIDQgIDAgODIgND47DQo+Pj4+ICAgICAg
ICB9Ow0KPj4+PiAgICAgIG1hYzE6IGV0aGVybmV0QDIwMDAwMDAwIHsNCj4+Pj4gICAgICAgICAg
ICBjb21wYXRpYmxlID0g4oCccjgxNjkiOw0KPj4+PiAgICAgICAgICAgIHJlZyA9IDwwIDB4MTAw
MDAwMDAgMCAweDEwMDA+Ow0KPj4+PiAgICAgICAgICAgIGludGVycnVwdHMgPSA8MCA4MCA0ICAw
IDgxIDQgIDAgODIgND47DQo+Pj4+ICAgICAgICB9Ow0KPj4+PiAgICB9Ow0KPj4+PiB9Ow0KPj4+
PiBkdGRldiA9IFsgIi9zb2MvZXRoZXJuZXRAMTAwMDAwMDDigJ0sIOKAnC9zb2MvZXRoZXJuZXRA
ZjIwMDAwMDDigJ0gXQ0KPj4+PiBUaGVyZSBpcyBubyBsaW5rIHdoaWNoIGR0ZGV2IGVudHJ5IGJl
bG9uZ3MgdG8gd2hpY2ggbm9kZS4gVGhlcmVmb3IgdGhlcmUgaXMgbm8gd2F5IHRvIGxpbmsgdGhl
IHZNYXN0ZXJJRCBjcmVhdGVkIHRvIHBNYXN0ZXJJRC4NCj4+PiANCj4+PiBJIGFncmVlIHRoZXJl
IGlzIG5vIGxpbmsgdG9kYXkuIEJ1dCB3ZSBjb3VsZCBhZGQgYSBwcm9wZXJ0eSBpbiB0aGUgcGFy
dGlhbCBkZXZpY2UtdHJlZSB0byBtZW50aW9uIHdoaWNoIHBoeXNpY2FsIGRldmljZSBpcyBhc3Nv
Y2lhdGVkLg0KPj4+IA0KPj4+IFdpdGggdGhhdCwgSSB0aGluayBhbGwsIHRoZSBjb21wbGV4aXR5
IGlzIG1vdmVkIHRvIGxpYnhsIGFuZCBpdCB3aWxsIGJlIGVhc2llciBmb3IgdGhlIHVzZXIgdG8g
dXNlIHZJT01NVS4NCj4+PiANCj4+PiBbLi4uXQ0KPj4gQXMgb2Ygbm93IGxpYnhsIGRpcmVjdGx5
IGNvcGluZyB0aGUgcGFydGlhbCBEVCB0byBndWVzdCBEVCB3aXRob3V0IGFueSBtb2RpZmljYXRp
b24uIElmIHdlIGhhdmUgdG8gZ28gdG8gdGhpcyByb3V0ZSBsaWJ4bCBoYXMgdG8gbW9kaWZ5DQo+
PiB0aGUgcGFydGlhbCBEVCBpbiBsaWJ4bCB0byBpbmNsdWRlIOKAnGlvbW11c+KAnSBvciAiaW9t
bXUtbWFw4oCdLiBJcyB0aGF0IG9rYXkgdG8gbW9kaWZ5IHRoZSBwYXJ0aWFsIERUIGluIGxpYnhs
IA0KPiANCj4gSSBhbSBub3QgYXdhcmUgb2YgYW55IGlzc3VlIHRvIG1vZGlmeSB0aGUgcGFydGlh
bCBkZXZpY2UtdHJlZS4gSW4gZmFjdCwgSSBhbSBzdHJvbmdseSBpbiBmYXZvciBvZiBsaWJ4bCB0
byBtb2RpZnkgaXQgaWYgaXQgZ3JlYXRseSBpbXByb3ZlIHRoZSB1c2VyIGV4cGVyaWVuY2UuDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQo+IA0KDQo=

