Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96D59D692
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:15:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391797.629765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQ0E-0003zk-Dm; Tue, 23 Aug 2022 09:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391797.629765; Tue, 23 Aug 2022 09:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQ0E-0003xG-AO; Tue, 23 Aug 2022 09:15:18 +0000
Received: by outflank-mailman (input) for mailman id 391797;
 Tue, 23 Aug 2022 09:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQQ0D-0003xA-1w
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:15:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19224315-22c4-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 11:15:15 +0200 (CEST)
Received: from FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::10)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 09:15:12 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::58) by FR3P281CA0147.outlook.office365.com
 (2603:10a6:d10:95::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 09:15:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 09:15:11 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 09:15:11 +0000
Received: from fcdac6a25151.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F095146D-D47D-4411-A394-B8C200BEF3B9.1; 
 Tue, 23 Aug 2022 09:15:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcdac6a25151.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 09:15:01 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 09:14:57 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:14:57 +0000
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
X-Inumbo-ID: 19224315-22c4-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EWZcaNDv7lQVWfcrtEzkg/3IFhRlg5XckVSLWUZza6xpMI/kuZa4XHgdGIShhR6ScoQaod9lJQd939IuMc19/ujJwdQLOpAAH27MmpQ8P3JJLFARRLUUE6pw8s2lKyt+h6Zo8jBEVnnJSZhUPd/rs7m9OcfPgpOPTSX/YWXECzi8/4hCsJ5SkSQjujP3ffFtJd8/WG8Uj8coto7vbPyVbD7FjFRO5tlxa1HAqX7MmZtsQCaK2iHa3Mmnl/a1Q7v9BSkSIW8RTBPS4cx1bFVQaSPwSnS7UbmTpwgHjd2RB24q6pt1md9Ma/CAf4B9tr9TUJqvSfIg8aLqErmo0wJe7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjejxnosNceZ0BAonpVbN3+lCqFDid0+Y2Dy4YZgqE8=;
 b=gMQ9GsHm7hvFVl8jH31y1n+1FI+GzqofgGDGucixc1iOGv1kEVmjTSnA0EsQx2l5pfA9i/MwdzQJy1I6+v2cyWY+4DTNsnXJ9iE5xYTfflw6Af1ZBjiMzxwL95y3TsTcEw6TTgxlcT3wiXEPezcleldLcA+abG6U2KUARRX7r4PaN1shQBAs2aGafXYpzgzhme3XLulG9Z8AnQTM+5Wboi61zOfVtGC4zdUf2t74a7MIiGq2TPOOrO6JcxtOERgLwIVkNZPBhnRBcc5ZGerESyKzW9CbmS9hefPV3y7ZrXK9LGAr4pJSrKGaqVxraeYZeFrLDotn5puT+lBd04Fo2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjejxnosNceZ0BAonpVbN3+lCqFDid0+Y2Dy4YZgqE8=;
 b=qp32mabRCv/jYT4UVu927BLl9Gpk06chw+tohIIph9/R9HbNSaPe5NS09e9hIjxyn8Ue0vVmfFqh+B3uq1fXuo/+r1zUyFYxzDy2Yaf12cJRCCEVcv50Bf1A0a1FvG1pppc71WqDqN4KUBmygIPqoAiYFmPEe8Ed2nEZlMvwZwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95e6d3d98a04f011
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvV+29ij/fOLNQ4VJ6IxCDT4lySolbuJmdMaHKpZ4wwbec/6fz4ubjA4CRNI/S4ekyR4PFHBXDP3xcJJm6WDR3Hj6LxStF4T0f/ktE7cwRcMTd9a/s65UCUKuJhxEQdvwK+oA9FCOxSOdTuCv3XPVaG7/RQnoF1gWY+Z4iZg2Kt786Xigc9Ev+W5E0hSTrH0yfHrBzIYZIteNaF4VyUoR0FaYq1y3C9CKachLWFwjsMcuxvQi1Se/vBvtUHswXEXCAHCvzNMb2SNtfPIR5i7KLOtXAl4b/YjqlZEqZgag7oYoKjA9CNWyVhEeXl9UmBBbeXvr5hnoUqs4jnO0pKjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjejxnosNceZ0BAonpVbN3+lCqFDid0+Y2Dy4YZgqE8=;
 b=HumVMNT1DwKQeOKaCRn6P2g9v+ZxLMPVGI1FLZpui4oUZlLqOnGv6BlBQvhjfvkfnaonMkyZ/TeUSydjoulrY01j+MyuZH1vYhq+xDmNlk+SnIlo+e+hahAluPN3YfjZy38YZREUJaNk95KH0X09lpACnU82AcHt6vWT7VS3PWwb+9O+smZ3H4hUSropchO5upDanyXxDywLd65KAODhBvIZi+qPm2psOnoiuUNda8LCl488O6Mk1Hvgs9PtOQW27Fk/gq6juZGUMosd4L+4QNNWd9gIG5FSyfBp8gvvI7FcdLgkbyAO8dnCMZTG8CYCRy69eoHrS0jmY6Qlpc/y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjejxnosNceZ0BAonpVbN3+lCqFDid0+Y2Dy4YZgqE8=;
 b=qp32mabRCv/jYT4UVu927BLl9Gpk06chw+tohIIph9/R9HbNSaPe5NS09e9hIjxyn8Ue0vVmfFqh+B3uq1fXuo/+r1zUyFYxzDy2Yaf12cJRCCEVcv50Bf1A0a1FvG1pppc71WqDqN4KUBmygIPqoAiYFmPEe8Ed2nEZlMvwZwI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Stanislav Kinsburskii <staskins@amazon.com>, Julien Grall
	<jgrall@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/7] xen/evtchn: Add an helper to reserve/allocate a
 port
Thread-Topic: [PATCH v2 2/7] xen/evtchn: Add an helper to reserve/allocate a
 port
Thread-Index: AQHYs7MFOpbwfPUQw0OF6Q1ZZ9sa6a2684CAgAFGuoA=
Date: Tue, 23 Aug 2022 09:14:57 +0000
Message-ID: <DACAB803-D803-4031-A41E-F17846B1AA5A@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <a6835a7c7223635da27d4e7db002eae5d21417b8.1660902588.git.rahul.singh@arm.com>
 <22ded444-ee44-2e5c-ab3a-e29edcf01ae0@suse.com>
In-Reply-To: <22ded444-ee44-2e5c-ab3a-e29edcf01ae0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bc1d329a-1cbc-491f-4f17-08da84e7fba8
x-ms-traffictypediagnostic:
	DB7PR08MB3531:EE_|VE1EUR03FT030:EE_|DU0PR08MB8279:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uvinxxhkhD6vm7z9GXtk36PVBHVA3/Xo8JK+fAGSwsnZKXl4+TMUpk7qdEUCC51z7gA7GVXOjJ3wpt/Wu/g+5ZwLOAI9wSbOGi324ROGe4atP7Gv4APd0oXZcP0Wvbmc4qNfsfQVvwnL5id9wu1KidHnqnl1O5cwNYurcXt26pfHma1kb9f5IMfPiwXuhISZUCLoqMw1EjlreoYCkeS/6DgNZFt3d09YWMX2Un7a9R0MKF+VMaeDENNtJD6LK83CQ+2ZCedfcMgu5xLr+UojuNxrT9rtCw2r42oZzdfbDRpTz3zyL/Fkrg8JF6JSrb2dJ0iqKkE3YX1waOlk2b1UR//RYOvq+mkkjJpdzVZTCynAQom5E3jBJuxgLIZloHWZasVzAQ1ru17yxVppwcUarr5sd5/9ew7e16sWdsVOQM5dNA5hUmtONoi0VwIfOneiFZ0UzFyKAD4fdDMS4giATu2IjcnpciBSLsvQyB+Nt89gg9LMcmuma/HgugsrOEy9Z8vwdctEK66BhTs5vjybRpyUygXHoRlEheuJGgYWbpynk7QlDHw+LvlFH3ztiV4DKdsN8wy8Kg5I8h4fCET4/uuHvEak1QJ93qFotg66P5OJqBXJsCCM2jwOYsYMIo0RJwkVTjaNAd7zFLArbTqY67oXiNfLa2HmLYlxVwPtahDvbtEw34uaXu7gjBhHVZdqtUdFAmI3QTQgTpqnYDZK8oDMwQHUXFi9Ivh7xmI4/Jhzs+8Q0C8sn7E3I5DcoU4IspFuXKIa3yzYII9MeZE0hsGd1GT51jL6nDxGcpW4K5k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(6512007)(53546011)(71200400001)(478600001)(41300700001)(38100700002)(38070700005)(2616005)(186003)(26005)(6506007)(6486002)(36756003)(6916009)(316002)(8676002)(4326008)(91956017)(66556008)(86362001)(66476007)(66446008)(5660300002)(66946007)(76116006)(54906003)(122000001)(64756008)(4744005)(8936002)(33656002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4813B02541171B449468D23484F9DE90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3531
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b910864f-2c90-4ece-3e81-08da84e7f30f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRnTMBRdLLd7UFgoVdy5DARgsJ+iTqdeHBNZAhmfK/WFDPaYwjaqN+FYIHhD2sIslvpHMessOpxjO5h5Qhm5Yo1llC/CpokdWIQ8ZPdeFk+vRQ5fXq1zpiuBD9viLOHi4kkRKqaY6IWCUB6mp310rH64wWHADr4Uc49hoE47z7BSXISEM+hEPbvf4QdINQeP8zx8JODZyxuwDD8f3ljXKCMVmF0mZWOuZQg+5+Ipzgh4BOxtmnyFxMpzhM8Ldpj1ym+HpSXNjr+iuu0/+c1qksBcyFQW2zEgROTkOCH1OKq7Pc/lcL9jj2vr6VyOseyurDkpm2LaQMiZYa3a7h4ffFmiLefjPcZb1sZ5qnIEj/3b9VlHcp+OVnfGZnuWq2bOk5q6rgzjyJZZfKmT7cjTOzUnD5iRMPkp64tzBT964+K8ndkAdKNMchuaA0t4V8/yhJeiZvOvCgyKS6ETS1r0/TEnZr43Wa6NeyGZKlbVxJLQesEkPhZ0Rvq5fRQMPoTchQQWx2UtSS/SrMvvYyxQlB/AEchkCCX180nSmXcWXrlhNYJpzJ96DX8HfQ2u1tk+s7GmHFGypAaEL/m8NPVOc1pitrEGOxvgvRexyDPWQYzku8VgJZ6WGzwhzpWNursJul6YqQV71ZLO+Az3JkwbWRnAfaFQjv50c+sNFYHuQGEPrHvOpaGDhMCPrjT0Vk8gWFF2BQ867ZlWqo0QzZuhvyTEUq1S6dlNhKP15Q9XCbrhyhp9Ovqc22Dzll6X4qSKra6IBkGzw+GrA5AgnvGwpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(316002)(36860700001)(81166007)(2906002)(8676002)(82740400003)(70206006)(70586007)(478600001)(40460700003)(4326008)(6486002)(54906003)(356005)(47076005)(336012)(6862004)(26005)(6506007)(8936002)(2616005)(186003)(6512007)(41300700001)(5660300002)(53546011)(36756003)(4744005)(33656002)(86362001)(40480700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:15:11.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1d329a-1cbc-491f-4f17-08da84e7fba8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279

Hi Jan,

> On 22 Aug 2022, at 2:45 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.08.2022 12:02, Rahul Singh wrote:
>> In a follow-up patch we will be able to either reserve or allocate a
>> port for various event channel helpers.
>=20
> Maybe "... we will want to ..."?

Ack.
>=20
>> A new wrapper is introduced to either reserved a given port or allocate
>> an empty one if zero.
>=20
> Maybe a/empty/fresh/ ?

Ack. I will fix in next version.
=20
Regards,
Rahul

