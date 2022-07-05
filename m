Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D010566E38
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361115.590433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hlI-00080y-4t; Tue, 05 Jul 2022 12:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361115.590433; Tue, 05 Jul 2022 12:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hlI-0007yO-22; Tue, 05 Jul 2022 12:34:40 +0000
Received: by outflank-mailman (input) for mailman id 361115;
 Tue, 05 Jul 2022 12:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8hlG-0007wD-B2
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:34:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d505a991-fc5e-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:34:37 +0200 (CEST)
Received: from AS8PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:20b:31e::24)
 by PA4PR08MB7596.eurprd08.prod.outlook.com (2603:10a6:102:272::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 12:34:35 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::a0) by AS8PR04CA0109.outlook.office365.com
 (2603:10a6:20b:31e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 5 Jul 2022 12:34:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 12:34:34 +0000
Received: ("Tessian outbound d5fa056a5959:v121");
 Tue, 05 Jul 2022 12:34:34 +0000
Received: from 14b5b9d96f5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34B10BFA-18E5-470C-A151-8ED6FD7F360D.1; 
 Tue, 05 Jul 2022 12:34:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14b5b9d96f5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 12:34:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3710.eurprd08.prod.outlook.com (2603:10a6:803:c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 12:34:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 12:34:25 +0000
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
X-Inumbo-ID: d505a991-fc5e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IVXsSH3+AViOK5FdxuDhS5Aqk217lPW9B7Qjgk4K5/r0S1tbQxO2mzqaMp4QFGMb/lVMko47S484Dan76mRJqWRyqogkXujvnP+LWuUPmDWeYNgQG/V+JQptXvX7Q7ehMwnPcYupU+rTQMDrl7dr2PgotRV5Z20tgH5VNTvGQ5EnDL0LxB0rOigeR0MQ5r+7Ebwgx13x7G4QaYNrecXIWgq0fQUjzD+SAOxrnnIz3sCRIAQvOTc3LHGh2GC9hh3aDa2Uf6ClzTiweuDKWWuYDdrVwDB0F4ZkjbkVSAORBxXya0z1/Llz8J1tm7TH+xQWhMAwUstI0qgVVzearipUGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXyJhOCr6VrkrYsOXyERShNoJHw+wd2rE9vtb2Re0Vk=;
 b=EW9WaAx25etSEZdJiWed67ewgg5MnhaG83FhmeonEzDJv7I4Lu6e6MyUJoD8JV4Ip+CAY4TIKO7PoGxGnxKSAlxjMxt3VbQZGsIdfKvROhuM+U5nVnNdnrMThZF3NE44wl1E2rJnPb77m0OxIzDFUjtdzggb7fFOZiiqY3isFw3m1VjhxftXnNX/pAUPB2gmjvvxvZhCHp9kG8RiEXkyJnsw9YJupPRjYhXHf9MqxzGV3QUGvp5sNKTXhsf6iTWDUbsHiRQOwnSecmcPEIgGBrVgzhxbasby1p5bEjSL5L/SD73P5R2cHghBL4l4wBMBD5s2kWOywmwoZu8oh8/Xog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXyJhOCr6VrkrYsOXyERShNoJHw+wd2rE9vtb2Re0Vk=;
 b=qv2k+aQM4tsh1maMfXcSviUC6LJEH/U8eWMx3g2jWTMDX/LXe/jDV/H18+DeemUb88kLz+fwHNUnVvb2x2IeMCJxtbam9ptJdDRovDq55MOs8+YEm84wWSE5liPsnqXZ3wHRH50/Blch1Gg2s1pOP1dfAvoYPkLwBFiDx2tpLV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f162e2246515229
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVmWcMXM56XTlxayB4wX4OFlVbVIbGjvxH/AqGEQGBjbfhY80MB4NBDvomalSZFmSu2K0Gl62Qb8AFxKlbHTuz/UBYHX3q1I0F0tbM8iqaKIm+HYJb8uYu7XuYeDYA2RT29XHZQDzzS3xfx7JBskB3jLl3Tud/4gTSrnlY4Hb6zYRlx8Xsqj1/j1rYGfpQ21ie9xDFEsFwtSvJ+aRutJrvXUTfAorCDbphUZVXcF2z8L+L94TSCKkhsQ8lFOVvArgNHpXXshcRUQuzXMNyV6YGou+8U1RUMZ6A2gIeaOhXLY0neG5sVo74hw5HweMYiACtKhR1SMXWnOceOHtqcEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXyJhOCr6VrkrYsOXyERShNoJHw+wd2rE9vtb2Re0Vk=;
 b=ZtPeVEEkGLUZNcN3P9Y/uRmTR7SC4/NERAAYa+oiWsy6aRveuuJcULb877VsTfxakSZXrE3s5R7NNaKRDMDs7NOYoP+MvFhERB5QfAHNV52Q49z4+B4Xk0Evklo+mCNWHaDpEx+P0IYzFVbvU34keBz1pXmZgNM+VY6sxTLun98YdcOIFo7T5pX4g6HEEvimCZatKh1bNXgCY1sBHoXHBDlddjS0HGPxh2cM9KYHmAHmcLgGp/tUXaKCXf3sXkuKMFq7OYGvS+4Vx/cL/kA2SUSJNq9S8reqeXZoER5vp29TtgHUebOL50WBjKRbTiT4CUK/Yr6hSO40RuxrmlNHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXyJhOCr6VrkrYsOXyERShNoJHw+wd2rE9vtb2Re0Vk=;
 b=qv2k+aQM4tsh1maMfXcSviUC6LJEH/U8eWMx3g2jWTMDX/LXe/jDV/H18+DeemUb88kLz+fwHNUnVvb2x2IeMCJxtbam9ptJdDRovDq55MOs8+YEm84wWSE5liPsnqXZ3wHRH50/Blch1Gg2s1pOP1dfAvoYPkLwBFiDx2tpLV4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Thread-Topic: [PATCH] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Thread-Index: AQHYkGnF2mJV3nmWm0mEL2tvTat45a1vtkuA
Date: Tue, 5 Jul 2022 12:34:25 +0000
Message-ID: <D016B2EB-F0EB-4781-ACA6-33EC1B8BADF6@arm.com>
References: <20220705122114.419634-1-burzalodowa@gmail.com>
In-Reply-To: <20220705122114.419634-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5d885490-f858-4aec-e660-08da5e82b7d2
x-ms-traffictypediagnostic:
	VI1PR08MB3710:EE_|AM5EUR03FT005:EE_|PA4PR08MB7596:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NpbqRVxQmxsWU2JHvbVv9Pxk2JU2qywU4JfnBKOzi5zSm5pLrtgWSRUp1D9TODFsHDqssSBwsRysO3fECyrE2HCxHbeOz1Er0OKB00QOQ+RdfIZcXWkJk1TSMOzO84D69gXVKhuyOBu1nTXjw5JjORvDOX7AxCMjJA0o2rbKJL/oBn7Y2i9loRQGo2CwNh9KDb/AQFKe6gZbagLkpN95oKlSXS+IDj+hAx1PUooKdGOglWcaCAJNizJcwnXuhXk9tWQ6onPNuD7zN/Ow5PMHpNAayK9J9dlbggDlwSrK2JSlA5U/faKM0jH5GSaLCsIla4onDLUhrcjCqZV4AIxQKf38gU+FjudvQ7jN4PAFEF48XpE4FunikcjgWjORUWpOLFETY4gVuhapDAt1Di7TWenTz36L6G/X1c7+4Hl9p8ebvPM5zELd97qUljGGAosRRRhB18Zh/xaMS/oK5o6Axx9kmqEx7ay9bjbsonJyaZyPVdwfa4zAGf3v6m+9tlPEwAcIPS2lKEsP60Br/HnS5j1WgoGNmB0cYd+5I7dDkdjRXK+Xt1JQTaIw69d3A5T1UugMP9biTtsxyvFv0QjjltqF5tUitA0J3FBmE3rrvveaRCtjBqmco1WD0k1OvEckg0rxYtN/PzlZDhZ9VsORBvOyRZ6hGXMKlUjSHvCVEYImMuKIEMeVoU4HQHHJIHG2+jwmjKgepfQH4OhSc3Zy768wSVkakNXsD4O6a6/46sVXyEdQivcf22to/b5eTGk8cwTx3kiHJT0F668KRjT8izoNQURsKpDpYwQyW9yb8grwzf9rqH0RPnzPYksVwJf95bFpt4RKwlBw/wHrMf4Vp1arCFuRqVx40vpFoTK16CY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(91956017)(4326008)(66446008)(66556008)(66476007)(76116006)(66946007)(64756008)(38100700002)(8676002)(38070700005)(186003)(316002)(2616005)(6486002)(71200400001)(122000001)(41300700001)(26005)(6506007)(478600001)(6512007)(53546011)(54906003)(6916009)(2906002)(33656002)(5660300002)(8936002)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C27E17292C2B744686A59CEB36E77C63@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ece35b1-fd2f-4267-ad91-08da5e82b256
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0MWibpBsNWUx402tFP6F4Q9TXks7N0nAS8gJgzWeTl/jk7F/8q/L4OIZWwWqzWqBN4mHLCH8z35pvYU5rCK/i95sJuBcgkMhcLppJUgvEKpv+Ym4pSLyt09ZxWk536HVJdQtpBKjPBEv3s8b8M0JY8U60kZ0xodBPA0P//nOMQMNtNEd78OYceSHmqoAUHQ59YeRd3D1tT+C/HTKKhMhB+yvPfl2A8g+U1BGK4e5Q5merdSmuWmmPdO9q0twIfVth46OCv8DCzOgLiKGLdumT4towg8+cRuQkvsPPv64a8nV7PIqwzCuIv/6NiMKVAHc6YYurm778bvCDWqzaQq+BKENs8AqAlAUysM6v/kGn8ZhIAzcO+E053y1FOjJPRVVljtAXPRkqcvdprymUjg8IMuhIlL+W8Je2i0dLu1sTOTICKHmuDYq51sLcn1uqoRxyH+20F6F70TFqS5PrN2sgqNYgWq1iMelmYtT55FGuHrtWzs6lXc7S28tyqHK+1mmhAA8j+LW145PKfVWStU3an0bAr/A6Pb0BEcl33Z+b5MftyI4ZsPba33SIzTwMaFjKwAFV+0PwsWeO9aGIAzd6vD+INmKMiBBG3rCzojMieblzhMvFxQRI7Mx8R5RcPMlI6lSUPSHD5MJBHHy9EvLPLr2FE2jYGKoCLqQJ27B1YybwZ4rDA2iKf6MQwLLir5txmYHsI5pyjMzRJvz1dYaOCC7j5kitojY/sBMbvi3uLm05zYCCuRfxw1hiCV7zExH1BQ8JosyxbjEji93K0VgMxAyDukJsvTFmrkeWrz7Os2r3qEuEA/vQtoE7YZYQ2hi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(6512007)(2616005)(86362001)(5660300002)(6862004)(107886003)(8936002)(478600001)(53546011)(33656002)(41300700001)(82310400005)(26005)(2906002)(356005)(70206006)(6506007)(36756003)(83380400001)(81166007)(40480700001)(47076005)(336012)(82740400003)(186003)(40460700003)(36860700001)(54906003)(6486002)(70586007)(4326008)(316002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:34:34.8509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d885490-f858-4aec-e660-08da5e82b7d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596

Hi Xenia,

> On 5 Jul 2022, at 13:21, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Add the function prototype of show_stack() in <asm/processor.h> header fi=
le
> so that it is visible before its definition in traps.c.
>=20
> Although show_stack() is referenced only in traps.c, it is declared with
> external linkage because, during development, it is often called also by
> other files for debugging purposes. Declaring it static would increase
> development effort. Add appropriate comment
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/processor.h | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/=
asm/processor.h
> index 4188ec6bfb..c021160412 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -558,7 +558,9 @@ extern register_t __cpu_logical_map[];
> void panic_PAR(uint64_t par);
>=20
> void show_execution_state(const struct cpu_user_regs *regs);
> +/* Debugging functions are declared with external linkage to aid develop=
ment. */
> void show_registers(const struct cpu_user_regs *regs);
> +void show_stack(const struct cpu_user_regs *regs);
> //#define dump_execution_state() run_in_exception_handler(show_execution_=
state)
> #define dump_execution_state() WARN()
>=20
> --=20
> 2.34.1
>=20


