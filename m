Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53885571E09
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 17:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365789.596114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBHRk-000639-0g; Tue, 12 Jul 2022 15:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365789.596114; Tue, 12 Jul 2022 15:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBHRj-0005zg-TI; Tue, 12 Jul 2022 15:05:07 +0000
Received: by outflank-mailman (input) for mailman id 365789;
 Tue, 12 Jul 2022 15:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9B0=XR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBHRh-0005za-OB
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 15:05:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e35394-01f4-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 17:05:04 +0200 (CEST)
Received: from DB6PR0501CA0016.eurprd05.prod.outlook.com (2603:10a6:4:8f::26)
 by AM9PR08MB6274.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 15:05:02 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::18) by DB6PR0501CA0016.outlook.office365.com
 (2603:10a6:4:8f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 15:05:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 15:05:01 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Tue, 12 Jul 2022 15:05:01 +0000
Received: from 04a161cd6d06.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A20091A4-D056-4D26-BCBD-30C72CA6D3BB.1; 
 Tue, 12 Jul 2022 15:04:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04a161cd6d06.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jul 2022 15:04:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7685.eurprd08.prod.outlook.com (2603:10a6:20b:504::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 15:04:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:04:52 +0000
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
X-Inumbo-ID: 01e35394-01f4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EM4jsYTa4fAtObO3nP+1N4slUotK4aZR9Wh8gzQpfwYHdwMwjVQ4+fTL8yhuOSDfWYg+iIrtPa7EXP0WDoTMcZTjlQY0j1wjFgKN1vUrjvU4064sZWcYeDav0aLOvi+HkjhqZBIxRr1QZt1tWXiP32gS6P0UJK5fGjDiDj9ZlQX7JwMZskzlnvxgrDbGEynQTuQeUIWlUeEG4xHTVaPXslz3TfeP2IEWtdKu2OYkrIfl5Iy2FL3CvcoLgYe+GW1zXmYi44KY8mzj3qGQC658UgNNCz5LskbXdI9GVq5QDZP+Y2NaVbM5fZ1Al9AVPAFOAQ6rcnUy/DEjo791I+A5NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+9liIFvnm5JvJc01YVF9kvSNd20f56p6JPxUl8CAK8=;
 b=OqljYgeHxPO90id8mBWMFdz6Ssj95sJHDkVzvG4BfWubxDWwf2tislVl3vqZMWGCKp1SnEFQWl47PeQU5ljSBrZwxh2/CbVxE7hXkBDyaelv5fx31UAlneeUCTCf2hCHWNpwZh42qbT7F5RiLS9lpx8JCGixTdPyWDbT3SMo/HvwR+bume394UGvF+XTes1Kd+hnmfEMWB51NXoFFcj0zXMzLGEh9taoVNMr68jzAWuDkphCz2HpO+RoPRP98h2B3co64ee1AcEKEBSYRk/GpwYPgvHx8/cMzTTVy7pbPpNOqwI8CdyLxbkYgZFiGvl2PnQdT1IXM3QTJMj9iN6plg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xen.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+9liIFvnm5JvJc01YVF9kvSNd20f56p6JPxUl8CAK8=;
 b=gYkYdJr2GfMoMfxparCpVNhtY591abSHUnfbN+XEyPAywWpqdoAwcyIi4OYdFCDWBur73Z1o0FkGVLsBfGxhpTfspZRA84vZibcQ5n/ksFUhTYcmRUmReVXMreX9S/e2GY+5Ffq5Gq7azn9cYIO/s8NiYqC71FfydUjCqwrS9Ck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79107023e992212a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMdkJXcDBh9MHsYjNh0cICfE5k7KmWWrOkvoTbFMbWoyfPn8iujSN7xZJF1U56zsbu5xXvNEMPt30AR33G8fu0TbqSWVDW5mtjWvQLVy0z3/+YlL9sSPFmFaXd3uewcJg03OXIz31X8MdiUod86tdboo5fvgfxY6bognjJ+aRdaPOuCKwwpuQXg2ALi+cnPheeE9Ptb1jeUOP4zqkxqFCLWjXZ46RFlfrIpdbS0aU5zQpTsnnz7HRLTVL7ea7yOfI4fsJV6X04K0jrfw9rIXh2XifDtz+dImOZ8//EjTEG58sCTeyMr4VuUWdcuOV08R2v9AuXTjewrqcd+23pJxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+9liIFvnm5JvJc01YVF9kvSNd20f56p6JPxUl8CAK8=;
 b=BkLBpD5h9zJjDyd8WpFllLIUJpjGufkTWThzcJB7SZaizaPN/Ih2P5bV3DSRr/JA3Z6je1GA5bYQ6hkFNeVoPnDtcwkdkXVi0M2Rejzns2+cSj6ttMdvE9QH08cc09oveTip343yNDf+TLAQCYCl17RrZa7mEA+yretseq+Hi23xbcbr89w3sV2P+Rkt/wpvDZLSGe6C0mplEhQg3u+d8PuY8vu2/nmMryt3oCCtNT1USkFT1Ga/WX/WEJzPX/2FJNNXi+MLoQFSlIreO8Lwun0mW9dLkqXtg5asuT01/tkr41lBnxBb/98wtWMXyPTtfBIRiCv9G5gPpRtKJkfFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+9liIFvnm5JvJc01YVF9kvSNd20f56p6JPxUl8CAK8=;
 b=gYkYdJr2GfMoMfxparCpVNhtY591abSHUnfbN+XEyPAywWpqdoAwcyIi4OYdFCDWBur73Z1o0FkGVLsBfGxhpTfspZRA84vZibcQ5n/ksFUhTYcmRUmReVXMreX9S/e2GY+5Ffq5Gq7azn9cYIO/s8NiYqC71FfydUjCqwrS9Ck=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Brad Churchwell <brad@cachengo.com>
CC: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: Xen on rk3399
Thread-Topic: Xen on rk3399
Thread-Index: AQHYlaRzw0VI/DSwq0Ot3R+564rcea161i+A
Date: Tue, 12 Jul 2022 15:04:52 +0000
Message-ID: <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com>
References:
 <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
In-Reply-To:
 <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2c930733-8576-4777-94b7-08da6417e500
x-ms-traffictypediagnostic:
	AS4PR08MB7685:EE_|DBAEUR03FT011:EE_|AM9PR08MB6274:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G+pnuKsr3k6qk3a6vKYdG5/jFcPocfXiH3hZ6SvPsboyxK+wnCZ2P/KJdR03o8Q1/a74qR2o2MN/2pZpb7v8J/eA2tNheqG5mNnW+5MDExfxvm1rKW8YFUKGgmExfQd54mIqNa0splcxFikbqSoBsvdUpTmmHO4ZV5vTbr9T+IX3A7S85Gb6qnMjFuqntdGdtNwyzzDr0WZmazXLSdqOl0GO2Mmo8N56f6MklxcXPHR4m1nf2mqFK7LRf9nQYhZOffRd1D4b3FHIEEE8izU8TlWYQiK2x3QJxOTlnu+pG+V9mz+ihaEjAH5CO+2TNPdx4QCbWq5x3y9Ms2mkqfFCVUv2GCQ7Dsnhxpf0Tp6OZK5LBj2kfS2dbZA+DYrHk5SnzCH4AtnVTErojdv4Idt+NyzLlNmcAWfO8V/tGvXqeHUls6zeasSvDL+QV/Y9Rgc04UYDNIKislpcAdAnZMPAaUtNxCzkoKjH4ADuZD952SCy4Dp2z5XMSh1vtoeQZsUNXjpcZ1k9AQVclrOqy3GEA1p/1AALw4iBckGJsZN/TlIHCJgtmaa3z4SniUAv7YxeTHSbaBG0hitkNVUoMsacJZ6YTmQlLxo8Z1JjYKtrxjDnYtjeTYPG8IEPhtc9/Dgl8LZft5SLMIm5rgOPW8H6E4XDKNQeD/jVNaPjf/+ysgdluwNGRuABTfECy/4mzwYikPO8UxM3N+Z7s32/Y70heBATVb770NZfO0SNdlcWTatQUqr+vtpG/oJUIhk88uF1O9NPznixRJiLmh0CWUuHB2sgKc4zGEiLb/4ess04GZpxNthyH7vsRLPjYqpxRIhk4e6GYyq3TBUyAq5DmgmmJXxzQgeXjAJwhZCISmZ+viQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(7116003)(6506007)(91956017)(86362001)(478600001)(8936002)(26005)(33656002)(6512007)(41300700001)(316002)(53546011)(6916009)(2906002)(6486002)(38070700005)(2616005)(66556008)(186003)(38100700002)(83380400001)(122000001)(66476007)(76116006)(8676002)(64756008)(66446008)(71200400001)(4326008)(36756003)(5660300002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E601FA3264D4B4CBE8B994F9FE9F98A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4e3f92f-e68a-47ee-8b03-08da6417df71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r7fS1I79J53vdWiZLvt2EV67ljJvF4al2CZcOlQonz4jhD4cADfaueK5g3JSWHw6siExgH1vOz2YV76HAQh3sAQqRfe9am2CkKBWbbyEncMDZJ6lVAOxptRftYQ5BEx7GLMAyIDbKDD5bJN23OdyuybBMRsWm++e0t+KZ+bVYbvf9g50osZs/KGeqisirDTxXujrfH1QR58ye9zONsMnNLrb/BKn4Q+DdF7F+q2PpamyhLYhCMotgDU3qxPwqnsC6s6Ek0qqmwfbajTz1y3BxgirzWT9qfn6+RptH8+orr9HCGk9IJsbso714maaM5KXPZZnFutx04heHddIp4i/7kVQf/oX6r10A71yOfiGz67csccwsSFDUiqIJ44UsXgcvAFspxKwcG/OJYF/nigDfDpSZrJ0tIuJkxFWNEJAbjj/m331y/No6Y6vHq5SzBpRdWIfAjKx8zQj57kzVuY7wObzoHVIr52pubPUbnsyavIpf69oCOr85i4/AG+4a3AHfQFT5lwzN/cP90Va5LuEtqLNP9EBOsD3EFoApyJ6j94MtB7xGzxka0IYFURojEKoM/XgixtEzjiSqFTiFzZeJe7JlmhIexEsyzzR0V28y+/wGqrhgx1fHgaLFiShGTOu8B9708Vo+6AC35Cy/vBK1tjhK0IIvC8KpHhZOm54QHTEXXK2afptSZsucQ24xG/y0s3hSzKD8amULtKf2MqA5suwHtVg0Rv6YtGxL7Giy5gsyqeJP8nLg2VoTNDIOgs63liYc2oAp6rCaYaxOcKESvyBCu6x9lKAruKa3Ji15h9NBjyDqdoy2iGOYudikgf0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(46966006)(36840700001)(6512007)(41300700001)(82310400005)(2906002)(26005)(6486002)(336012)(47076005)(2616005)(186003)(86362001)(53546011)(82740400003)(6506007)(356005)(36860700001)(4326008)(316002)(40460700003)(8936002)(70206006)(8676002)(81166007)(40480700001)(33656002)(36756003)(7116003)(70586007)(6862004)(83380400001)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:05:01.5236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c930733-8576-4777-94b7-08da6417e500
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6274

Hi Brad,

> On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
>
> Hello,
>
> I've been trying to get Xen to boot dom0 with my kernel for weeks on an r=
k3399 based board and thought I'd reach out for help. It looks like either =
Xen is not properly recreating the device tree or the interrupt controller =
is just failing. The hypervisor boots but falls to initramfs because it can=
not find the root device (nvme on pcie). Any help would be greatly apprecia=
ted. Here is the complete boot log

From the logs you have an issue with the interrupt controller and the fact =
that your NVME is behind PCIE and as such depends on ITS is probably not he=
lping.

I would suggest to try to boot on usb as root fs for a try.

Also it could be useful to compare the device tree on xen and without xen t=
o understand what is going on (using /proc/device-tree).

Xen seems to be ok but Linux is not happy with interrupts and is showing se=
veral issues around this area on your logs.
Could you show us an extract of your device tree around the gic declaration=
 ?

Cheers
Bertrand


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

