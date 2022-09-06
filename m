Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5965AF1CC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 19:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400000.641502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVc3Z-0003GW-8j; Tue, 06 Sep 2022 17:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400000.641502; Tue, 06 Sep 2022 17:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVc3Z-0003EI-5S; Tue, 06 Sep 2022 17:08:13 +0000
Received: by outflank-mailman (input) for mailman id 400000;
 Tue, 06 Sep 2022 17:08:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVc3X-0003Cz-Mo
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 17:08:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b78018c-2e06-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 19:08:09 +0200 (CEST)
Received: from AM6P192CA0101.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::42)
 by VE1PR08MB5565.eurprd08.prod.outlook.com (2603:10a6:800:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 17:08:07 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::fe) by AM6P192CA0101.outlook.office365.com
 (2603:10a6:209:8d::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Tue, 6 Sep 2022 17:08:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 17:08:06 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 06 Sep 2022 17:08:06 +0000
Received: from d53e5faaf5cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 45E8E883-DB05-4797-896F-767EE47C74D5.1; 
 Tue, 06 Sep 2022 17:07:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d53e5faaf5cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 17:07:59 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PA4PR08MB6189.eurprd08.prod.outlook.com (2603:10a6:102:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 17:07:53 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:07:53 +0000
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
X-Inumbo-ID: 7b78018c-2e06-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D0YK+AXLhQN3604KKcC8OgW7Hry/hkB/aQaSYV7aOde4s1pZkLwAoKeyVDFuU1JJLvYxQA7LhmIr/VwH/lJGTFyxE/iUiVfy1lh4dAz4OPjLeQZTld4Jz+BK0y+c14z6t4fcJJ3q52sp1S0s9KUBScN5WGJ598Wq304qIZs01RxcGB2W9Q4KwFSEuTb/4cdzVLejRKRpAcv5yg853mJ2gG+D2+2BQo0JvpMjau1mFs7CB5MkFLbcz44mkczqIl/DksevpTuksqWYWCrNdVHT7w3FR2uE4mElvlSIJ2e8BPDSUpP2CMI/ulFaCiBo3ZVI3PsvCaR3O//hxcRFg0i70w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVHP1rld6IvDe38z2JNpji9FUKe0XMZ1+DJ2DQoL18I=;
 b=IlD5mWVsN9/u6o4Y4WaFq8+2fN6Pqnbv1OZvXEeTysLGcu31GHExWF3bSlxJMP6y+w6dS+LcE0dAw3/qsWuzI91iaQhd2xuV0yfDa6/saFO6C+2blBIYwsTjkshDPfO+e6x0ZWzSp4bpf8SoxaxtftI/kIHeqHh2d7hBmsPij4odh4q7XvQOGYIOiwERNvNRwYPPaQjHQbEtD2ABacwapjtf6kdqwpPyHICF0GkuGZCiyFyyKDkaqTBWwl/evuLHhY+k/B3vF2FoC6xMb6NRgg0LhHDTKir3jvVSve361I52pdN7cdguyEU+FnsJ96MilQhq3SjwJ1AoYSfHT53bBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVHP1rld6IvDe38z2JNpji9FUKe0XMZ1+DJ2DQoL18I=;
 b=8O9w3Rlo43sZrONZEafA1i7Hav80rn5PBep6LxvJuyHTDLwpfo1mqFZGkFeeUHb3obQs3djBKINsM/ZwTVmFs9GdmzjuAMDtOpZC2dOwZdPo/9XN15a6EWf7YR1F7GMRRlp3JO2aKlXRGJddtGIcP3G44VnMmW5ONCb6TDBIitM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ee5f775c1f9f123
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRhDKthjr6AWY9R3Zwce5m6UrGn75yzKNwoxaERj2vbEJYzUSxLCRvpTylzth53ngi2bfB92mjSm9cKYf1cMz6+QHhWAqbxqV2vcgCGSCabftXaS4oZTjPtBA+cUtkTfYs+mqh6WSIJEfaWkqJeZeL5+5Mzmv4cJt8WN4z7TfgQg4lAMIfXk5SdLgu776F4fi4PjKJEdeigKfxdmp6XRidKjE+l3JNYk9IE091Ln+UWAcjhlbUCJxL3eiLu3I5kMiRc51aYZ5lWcNuLXuUfLEe+kzK5Y/yPXmJC2/UHI07mNpVFlSQpc7ESxKfLECntpz+nFLxlIeubwipcfaZ0eIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVHP1rld6IvDe38z2JNpji9FUKe0XMZ1+DJ2DQoL18I=;
 b=GeAzTUPcpG/88aoWHt7RBpmzqfFggzikYeRDVUElsiAiDvv5jyQqzV9C3g2T2cLL+aBJH4kEWKq3cGwrmkszI/l6xylGgK1iBPbseU4OT258AR9oP1qmOOIqzD3BbXxHvarqXS1x0Me+z016d5s4/BL8Z+8EVVlSfv+wgIuYBA7xPK2dzwTJVn4xGnb85z9ag7RSzTnJpyYAKTpyYmkekjOffOXP/Av0124GYgG6hAT9j9zNI6S5IeF+WSlN2KW3AsYm2k5wvSzNLVarwIBLfAwd2z9AL/6l7Ub2fzX86rc4k5NtW2bNgj0o1aBPSehef3puAN+pk1W9HpxOQC4Mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVHP1rld6IvDe38z2JNpji9FUKe0XMZ1+DJ2DQoL18I=;
 b=8O9w3Rlo43sZrONZEafA1i7Hav80rn5PBep6LxvJuyHTDLwpfo1mqFZGkFeeUHb3obQs3djBKINsM/ZwTVmFs9GdmzjuAMDtOpZC2dOwZdPo/9XN15a6EWf7YR1F7GMRRlp3JO2aKlXRGJddtGIcP3G44VnMmW5ONCb6TDBIitM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Thread-Topic: [PATCH v4 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Thread-Index: AQHYwdclHjvo1Mpgb0O6C3wbnsmdma3SnZgAgAAFHwA=
Date: Tue, 6 Sep 2022 17:07:53 +0000
Message-ID: <C2D1C272-3D50-40ED-A0C5-EA65938042BB@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
 <b2edc092-5c7d-70b5-7525-810e21ac1370@xen.org>
In-Reply-To: <b2edc092-5c7d-70b5-7525-810e21ac1370@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c4d8747f-2f4a-4184-ff26-08da902a5e29
x-ms-traffictypediagnostic:
	PA4PR08MB6189:EE_|AM7EUR03FT008:EE_|VE1PR08MB5565:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AKzVO9RALx4oP1/IeuovlHIxHExklv+OlnIJGDj6k8gi3S9Ls/reK7qYNNQRo+usCEt+NQmPYR/eIngg3eGDHEnFxVFCnv7VfCMZOeMlLVB1AcEI/ZLFGHxX91Dkpv7ipUE1qCYixNnMpeIXwWRr873Om2kH8S0x2RfRpSneY8Fcqmzvr6nxahAVGuFDcUEQwGlgq3jSBBuuFPEvIdRnRtKpuNxifKB4yE1FGUhe7Y9HYctpyufts6PZoza2L6IqmPeJRMPXP384JtBQM4h85Nn6F86TnirS6eoLHeUG7dgvAky6ykKWHefQSCEmINcT9CWsCO69YbIl6sMNKFh3BY1OnuCc+tyT3zUcDEWFzVpHqLLnxsVXKKBVZGEwQ2+q7MBCk4AJQOsZu3uGfSgmESvleboknjn1HRkHLVpaFSxL2kCdb98/JoZtEnK24gUV75ZRH14LpuipVTE0QtsCky3RcXldJhl+aVgDRNnm9KKsJLiD+KUmj+3u+WFPsfvSmHggqeyqOJODiBWKhChifivJFmeB3/gUTHg3gk6SSjuxxJxci1MD6nNm7uLi5CTGcKqaUwzHmXMusuXMTTpuFMJ0CVI8q4fjgOx1+WetNpAUGRzfpZTTkwtWt9ZccqbuFqAnY5OEAXHlQOzZsKAgt/9pWIU0Tw98MCuE60b2A2217GXWltajtG8Qye6MQR7YN6GXaJcoMeYfenRv4UuWTwR4/rLM3GAU/14udiWyRm2EsShEsLERE6Fm3A2DTqclt7QoAUNKgR73YcWhHt5UnvQaOcXl9fy3BRGdRgsvp0Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(2906002)(316002)(33656002)(186003)(66556008)(5660300002)(8936002)(66476007)(76116006)(8676002)(4326008)(66446008)(6916009)(66946007)(64756008)(36756003)(54906003)(91956017)(41300700001)(6506007)(478600001)(53546011)(71200400001)(86362001)(6512007)(6486002)(38100700002)(26005)(38070700005)(83380400001)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF43EEC53B3DC04CA79DF95DADDB012D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6189
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e693e6f-cdb4-4708-e33a-08da902a5609
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KhnE40Rgqpjlz/9Wm7HAY7RuyIiQyXHIa0oq24FDg4o+35eLo0oivan3amUM/ry8cTiHwuQjoKC6QOmjNa6611ikBJgHB8j3j27/TTpnBDvKSk81aHU6CWpO53trlMo88UAlfPEPaVTIKpjYxA/4n8AOKcSmxZN419PZUiKC6bkU71Urc1vcNztogrOoMc37rPqWOwsN1nsCMUQuMsEw4Q6hSw8ITxDG7Cp6XYWfTsLhto2rnwTZJo33wswj+sEdxFyT7A5GNHloZd1qHNRJRiMr4PwuYVRGdDcNaP21dpp+FDkWvX0PPgU0VYoTVD6wTpBrgNMzp02yaCNw3vZHgJ0ZB4EjWN42WqcwnNS3I0jMnHNF/uYPg6gyCqJ2TVVx8sB+4w0RHV5NSRISU+qkQ3HeZ7w0uphD3NnTpru2mTtikBjtEyVvA1B9Mddf8LA/4acs/h+fueIVWO8d8aoJ9Uv5xXGho6uPKQzOewaI0T4MDyG4P2qqeWhSi6D/ip8ZtePrPAIdwucoRy8Q4i8MQFv1xCNEGZ/iWfl00+dyH9cuM44UreTrk029rCwe7Eav6F28yv0tX/G5tSczUK05tw3dePiQRxco5p2CUaJ06kNjx0IKwVYGQYYgpQ3nHqtlGOsxr/HRZ41OrH+XNyifVPC3BmrmXDFqZmyK91UsdQRNa661cWpEUvHQfTmPbV4WAYfxqD2yHt0KqTsDhyPQSDF7sZEASIENTpGONYJAJrcfbA9ODGFR07gbQCJfm9A1yYe/YKl1qIrd9if9PtNXEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(46966006)(36840700001)(6506007)(186003)(53546011)(336012)(2616005)(5660300002)(47076005)(8936002)(40480700001)(6862004)(107886003)(6486002)(6512007)(86362001)(26005)(36756003)(478600001)(41300700001)(33656002)(40460700003)(82740400003)(356005)(81166007)(54906003)(8676002)(4326008)(70586007)(2906002)(70206006)(316002)(83380400001)(82310400005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 17:08:06.8558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d8747f-2f4a-4184-ff26-08da902a5e29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5565

Hi Julien,

> On 6 Sep 2022, at 5:49 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 06/09/2022 10:55, Rahul Singh wrote:
>> This patch series merge the applicable Linux fixes to Xen.
>> Bixuan Cui (1):
>>   xen/arm: smmuv3: Change *array into *const array
>> Christophe JAILLET (1):
>>   xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
>> Gustavo A. R. Silva (1):
>>   xen/arm: smmuv3: Fix fall-through warning for Clang
>> Jean-Philippe Brucker (2):
>>   xen/arm: smmuv3: Fix endianness annotations
>>   xen/arm: smmuv3: Move definitions to a header
>> Robin Murphy (1):
>>   xen/arm: smmuv3: Remove the page 1 fixup
>> Zenghui Yu (2):
>>   xen/arm: smmuv3: Fix l1 stream table size in the error message
>>   xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command
>> Zhen Lei (1):
>>   xen/arm: smmuv3: Remove unnecessary oom message
>> Zhou Wang (1):
>>   xen/arm: smmuv3: Ensure queue is read after updating prod pointer
>=20
> I didn't get the full series in my inbox. So I used the branch Bertrand p=
ushed on gitlab [1]. That said, I had to tweak all the commit messages to r=
emove the tags Issue-Id and Change-Id.
>=20
> I have also added Bertrand's reviewed-by tag on patch #3.
>=20
> It is now fully committed.
=20
Thanks for committing the series.=20

Regards,
Rahul=

