Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3565685E3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362088.591970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92U7-0006Aw-Gs; Wed, 06 Jul 2022 10:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362088.591970; Wed, 06 Jul 2022 10:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92U7-00068d-DN; Wed, 06 Jul 2022 10:42:19 +0000
Received: by outflank-mailman (input) for mailman id 362088;
 Wed, 06 Jul 2022 10:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LAHD=XL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o92U6-00068X-QT
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:42:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150074.outbound.protection.outlook.com [40.107.15.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e26a27b-fd18-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 12:42:17 +0200 (CEST)
Received: from FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::12)
 by DU2PR08MB7360.eurprd08.prod.outlook.com (2603:10a6:10:2f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 10:42:14 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::6f) by FR0P281CA0007.outlook.office365.com
 (2603:10a6:d10:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 10:42:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 10:42:13 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Wed, 06 Jul 2022 10:42:13 +0000
Received: from 3cd16d376cc5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E87F0EE-C2F0-4357-A49F-5756644F9ECC.1; 
 Wed, 06 Jul 2022 10:42:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3cd16d376cc5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 10:42:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB6PR0801MB1783.eurprd08.prod.outlook.com (2603:10a6:4:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Wed, 6 Jul
 2022 10:42:03 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 10:42:03 +0000
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
X-Inumbo-ID: 4e26a27b-fd18-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UhVTPh7p4Q69kzVmoaGFrMsYujBZKWVPS1TzyeE3+NHgiQCYKJxYVUkUh6EN2cBqTJXMcCUPqnQ1exwB9+0e+uRzqgIWnqg2vcanlGF66/MI/CNKolmAd7v/XD48+5Kc+oLF37/w0WZy6wKop92RtrC2c4zW1GpZHvXk+15Ls9iWxU0CUqqYxbWPtlaYnNIerinxzcoA3Lo139rixau+QvTZyM9IHduYZMwWOyluOin7jppkiTnEDTwttXRYQV8J+KE00I7u1vDrzqy5JTlinqK6Vas8zCUdsh7THRo4Dm8NNlK4oZZ4QGJfNqRZedorosxmhrgaWDE/F99KBTCNyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jxOhJ8WD+RSzAjdZgMNYj5h2Pt3OdaCjHSjWhNaf5s=;
 b=XL421N/kq5aNx16/bi3CYBF6Ps4/uQ4uC82h+T9EcBCbY8epriZDZbWaUJxpdUz5FUToXsh4wmkd4P5uUUzSjYEFeBuhpUzojIMNa/XKp+sGyvrRyANzt3XnoETlWtUkRxZoHbcJJxvuDcupcgArlwT4uwxfsN+cXyJkUbbckcNeHQ4njEiYrfMFbTxvSFZ+yrhW9Ubyk4jutEJXlF2Dw3CR1puNR7U1kq9CRX2Ewk50I/61rAWKZt32KSg3IazGZcCABC1KR1VKq83HUc0fdaeHL/WvO8GSu1y3/aKyQO27Dgrpl9OOt2wBTTAvT6TSVmuDApZ0TS008KwHt0A+sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jxOhJ8WD+RSzAjdZgMNYj5h2Pt3OdaCjHSjWhNaf5s=;
 b=Qz9y68Ns5y7EM7SwRJiTdwYHmUO23GLBI9biRWuTcAE++oJ2iMsaVfHZtwx6PAChG9/3joWpaiRgYOcRv6qkMrSUy9zKN1oMGjimzVhXLZ4ZrLr/UfjnPH8ph/tvScoVA9jGC0jgHgOzkFXOZujyfqTD6gRmDf0eSnBN5r7ugYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89c812f6367c30f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv/y+i/2be4OXlTKAvCRBEznkfw4Lal5qJJYMAMYsQUCausUXAEBdPWPg2Jhh2UUFEkhJbf9lI6jMzUtId6XGaS1Qfmnx3cpIwO5ncGKRnidZTaEBLdW6lytX/RV+VzKXyJe7PFhtbWfCdPsklHNtrtYQHItmD3n6WR3mc75xyFJZOHCkCgdJS6QMMOLjlQU9fiKSgeL7XaTRsEjyVi8UE1vmWngji8cNMpuZl9wubvBHozOrjQCYqWcpBpnV5yRHKiPLxuxcCJiy1vh16rDvwD83SMFEDRYoCyqNOxioJhFExG+pOcK/iWtOVYHt6Wm7x5U+7CD/eRY9ObmwSrz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jxOhJ8WD+RSzAjdZgMNYj5h2Pt3OdaCjHSjWhNaf5s=;
 b=VIMi0O8k01SaqIR8oIaMuhIdUwAQOu3WqzRgGKz/2Jq9QXdnP/ndbmDBn0SUXvQ5vVZWpRH1MYkXTBApgeOsxrG7sc8XNfou3VaoS2ylpV3Dac1ijUBWU01v4TDcgArfan/cRz8LqkHRvM4l4XUi0HSfGXex3ynw2sJhc4A7lhiHWYHurevCEAHgbPi1/DNe81hVl5yjH1xnJ2sutoCbG9cU56B7JndrUmYNYlkroI5HsQoQQTTVOcdlnKtt1QsO6LVt1spIYzPgBuaY0EFkbNjIcO4Y0JYN+n+MEGpaUZWo7axoBpFuJpOW/2oWpunt+zoLWF/LZSurgkcrfVjvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jxOhJ8WD+RSzAjdZgMNYj5h2Pt3OdaCjHSjWhNaf5s=;
 b=Qz9y68Ns5y7EM7SwRJiTdwYHmUO23GLBI9biRWuTcAE++oJ2iMsaVfHZtwx6PAChG9/3joWpaiRgYOcRv6qkMrSUy9zKN1oMGjimzVhXLZ4ZrLr/UfjnPH8ph/tvScoVA9jGC0jgHgOzkFXOZujyfqTD6gRmDf0eSnBN5r7ugYQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Topic: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Index:
 AQHYhkX79rj81mJ150e3nBZ0EA7O6K1bhmuAgAGTuoCAAAWegIAHwJEAgAAJPQCAAAcgAIAAB1iAgArhiICAAAgBAIABW/CA
Date: Wed, 6 Jul 2022 10:42:03 +0000
Message-ID: <CC88A73E-FD16-4F41-9478-9979FE498725@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
 <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
 <77952dd3-e777-f4ca-75d0-c168c10d46d0@xen.org>
In-Reply-To: <77952dd3-e777-f4ca-75d0-c168c10d46d0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 46e024d2-619b-4860-80c7-08da5f3c3047
x-ms-traffictypediagnostic:
	DB6PR0801MB1783:EE_|VE1EUR03FT035:EE_|DU2PR08MB7360:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D6blRt0YxwXI3tByzm/ZNFDwvbdpiHcGVN0K3wXYVOkKqrVCmgx/RGISKcNCP36Z1AHmEcS+7J16MsUgEnbmW8ioYCeLKnATfPZy0NANzF8uX1nk/t86/ya1sUUuM/6Nk4wS5J8g/vuyYVeZBH+lzip2GO9FEH4IoWefBBhjOSY+T0/JwuxVHdOtrXEMXq54LlkeRyUrCW1E4LSYB1uZLBjIWRptZgZ9taD2B8oB61lr68v1c6yGrXrohqu/8V70zlrC3X8bQRa846RJk2GXWXMww3h60/zzsNnDKsW5OUrdLry+q5PREV1wyUJ0dNQRL1bLLAvOuJ9rfuOojxo+HBcNVOM2Ii1uSxUlPKnL646S9ZQXpG0Stwj+Jm7uFk6mbiU+a5vagMXNLx6iUqp5Qxz2+oqqP5B3e/FvlnlgHhb2tlo8QT1n34gRMXMI/FNZqtuybjF8ZsgkpBPfACQ30lM2RDlzDh6NGLjt7PkJjSPqlg2iB/WHDhPVz7mB8XzJGNfuIocEkV+uXPiXAtJQ67MEng2cSJl+I4tY74hxcgw9wDHnQpnVYrgjuF+0hZ9nptE2spw46aAkPljtCxKrhZOxqTNrw3JmgAAeJZ4cAWhiB9GJWOq0s5QakVFzMOU58JWOPpl9j9qktXtbjY66bxSes58UcNe2DBTLxTa50nP6CXJ6KDRIrwkoEXalD28PJYNld4yiMU8mFEgo66ZVKjOt/ot16PMxs40N92Vx+e0zGLMW1ftvlIoXA1dye+SF2UgFGMaICYdjtKepFkJ0ANjjQ+LAKOL0vL1AmgigMltQR2QgaOS8kWUiiA6YQVwRksr1nTHzhgCuPav5fTlGDaYwh34tUjsLtDIUnDLlxJU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(4326008)(8676002)(64756008)(38070700005)(66446008)(66476007)(66556008)(71200400001)(41300700001)(76116006)(53546011)(86362001)(66946007)(6506007)(2906002)(478600001)(33656002)(83380400001)(5660300002)(8936002)(122000001)(26005)(6486002)(6512007)(91956017)(186003)(2616005)(316002)(36756003)(38100700002)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A4B87E8E8237A40B55BCA27E620DDFF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1783
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d650ccc-6ca0-403f-6b6a-08da5f3c2a18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bbTM8M92kS6Tq5laLpj5qmtSPbM6uegLs/8Yxtxabe6RjHTOsrPR+r3RBgkvxxcVM0wxeJbfGZY+DF7vJu/0hQGLunxtKQXZlgw96C37spGgLMOeaOU7C0SY06H2AvAv+8cWyLI5W3tODrarvubelJoNskIbCNpM7v0PdXBT0+0jKJkjWi+r2DXXLa0hwuvTrqW9U6uJKIZggQAS1wol4wc/ECRSeZp25scMCBfF7mugMTMpZeEeCNjbFI5sjCJeozyMprXPQUyB7IBEN4ay28zEBQ9wyx17Okls0nNFrR181useG/MdRIDZxiPTmZJmW58WQ8OfhkOejA/qskeJwgOV4DtS3Du08YVPs519RCyI8K7Ax10kO2qhJo3nbl1nSnlASyqKEuCoABpc1JYwmSON2DxcBvxFhV4NfFRFETStyh640XDaJ81lo4J+IXINkr8C3HPK4aNXIhpvGMXueRFke+9f46Me/UWDx0N9ZnLpvxbbqLtHBB0GX2gzyBt5d2u5DnQylPN9RNxshmeqnBGvjoTPac9qfB1EF4eTq2j1Gv/a/8RGTciUWLpKA92z+2EhBc81Dzbo/kf6AN0THA3sXBJa7GRvrHX9MvD1madjPae3k6nA5Dx7/2WpO9TY3lH9Jvpf6myv9QSqksM5hTNziMtCqQLdCIgMm93I3O6KZ/qeiZzZXl5/z0mZTWRfkccIpWdDcdNcQjHjglIwMwgPVuuak9ipa85NqcHrzPAjJqzGNLxuVJ3IK3xG90Yfj6MhvKSWtpCuXdk1YkRb0QRfqQ6HqPgHmklZkM+owqFr8J/DNqt8fXoiJTZC/7AM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966006)(40470700004)(36840700001)(316002)(70586007)(6486002)(70206006)(8676002)(6506007)(478600001)(4326008)(40480700001)(54906003)(82310400005)(6862004)(8936002)(40460700003)(5660300002)(2906002)(82740400003)(36860700001)(36756003)(86362001)(81166007)(33656002)(356005)(41300700001)(26005)(2616005)(186003)(83380400001)(47076005)(53546011)(6512007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:42:13.7609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e024d2-619b-4860-80c7-08da5f3c3047
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7360

SGkgSnVsaWVuLA0KDQo+IE9uIDUgSnVsIDIwMjIsIGF0IDI6NTYgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNS8wNy8yMDIyIDE0OjI4
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFJhaHVsLA0KPiAN
Cj4+PiBPbiAyOCBKdW4gMjAyMiwgYXQgNDoxOCBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6DQo+Pj4+IGEgbmV3IGRyaXZlciBpbiBsaW51eCBrZXJuZWwsIGV0YyB3aGVy
ZSByaWdodCBub3cgd2UganVzdCBuZWVkIHRvIGludHJvZHVjZSBhbiBleHRyYSBJT0NUTCBpbiBs
aW51eCB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZS4NCj4+PiANCj4+PiBJIGRvbid0IHVuZGVyc3Rh
bmQgd2h5IHdvdWxkIG5lZWQgYSBuZXcgZHJpdmVyLCBldGMuIEdpdmVuIHRoYXQgeW91IGFyZSBp
bnRyb2R1Y2luZyBhIG5ldyBJT0NUTCB5b3UgY291bGQgcGFzcyBhIGZsYWcgdG8gc2F5ICJUaGlz
IGlzIGEgc3RhdGljIGV2ZW50IGNoYW5uZWwgc28gZG9uJ3QgY2xvc2UgaXQiLg0KPj4gSSB0cmll
ZCB0byBpbXBsZW1lbnQgb3RoZXIgc29sdXRpb25zIHRvIHRoaXMgaXNzdWUuIFdlIGNhbiBpbnRy
b2R1Y2UgYSBuZXcgZXZlbnQgY2hhbm5lbCBzdGF0ZSDigJxFQ1NfU1RBVElD4oCdIGFuZCBzZXQg
dGhlDQo+PiBldmVudCBjaGFubmVsIHN0YXRlIHRvIEVDU19TVEFUSUMgd2hlbiBYZW4gYWxsb2Nh
dGUgYW5kIGNyZWF0ZSB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWxzLg0KPiANCj4gRnJvbSB3aGF0
IHlvdSB3cm90ZSwgRUNTX1NUQVRJQyBpcyBqdXN0IGFuIGludGVyZG9tYWluIGJlaGluZCBidXQg
d2hlcmUgeW91IHdhbnQgWGVuIHRvIHByZXZlbnQgY2xvc2luZyB0aGUgcG9ydC4NCj4gDQo+IEZy
b20gWGVuIFBvViwgaXQgaXMgc3RpbGwgbm90IGNsZWFyIHdoeSB0aGlzIGlzIGEgcHJvYmxlbSB0
byBsZXQgTGludXggY2xvc2luZyBzdWNoIHBvcnQuIEZyb20gdGhlIGd1ZXN0IFBvViwgdGhlcmUg
YXJlIG90aGVyIHdheSB0byBwYXNzIHRoaXMgaW5mb3JtYXRpb24gKHNlZSBiZWxvdykuDQoNCklm
IExpbnV4IGNsb3NlcyB0aGUgcG9ydCwgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsIGNyZWF0ZWQg
YnkgWGVuIGFzc29jaWF0ZWQgd2l0aCBzdWNoIHBvcnQgd2lsbCBub3QgYmUgYXZhaWxhYmxlIHRv
IHVzZSBhZnRlcndhcmQuDQoNCldoZW4gSSBzdGFydGVkIGltcGxlbWVudGVkIHRoZSBzdGF0aWMg
ZXZlbnQgY2hhbm5lbCBzZXJpZXMsIEkgdGhvdWdodCB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwg
aGFzIHRvIGJlIGF2YWlsYWJsZSBmb3IgdXNlIGR1cmluZw0KdGhlIGxpZmV0aW1lIG9mIHRoZSBn
dWVzdC4gVGhpcyBwYXRjaCBhdm9pZHMgY2xvc2luZyB0aGUgcG9ydCBpZiB0aGUgTGludXggdXNl
ci1zcGFjZSBhcHBsaWNhdGlvbiB3YW50cyB0byB1c2UgdGhlIGV2ZW50IGNoYW5uZWwgYWdhaW4u
DQoNClRoaXMgcGF0Y2ggaXMgZml4aW5nIHRoZSBwcm9ibGVtIGZvciBMaW51eCBPUywgYW5kIEkg
YWdyZWUgd2l0aCB5b3UgdGhhdCB3ZSBzaG91bGQgbm90IG1vZGlmeSB0aGUgWGVuIHRvIGZpeCB0
aGUgTGludXggcHJvYmxlbS4NClRoZXJlZm9yZSwgSWYgdGhlIGd1ZXN0IGRlY2lkZWQgdG8gY2xv
c2UgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsLCBYZW4gd2lsbCBjbG9zZSB0aGUgcG9ydC4gRXZl
bnQgQ2hhbmVsIGFzc29jaWF0ZWQgd2l0aCB0aGUgcG9ydA0Kd2lsbCBub3QgYmUgYXZhaWxhYmxl
IGZvciB1c2UgYWZ0ZXIgdGhhdC5JIHdpbGwgZGlzY2FyZCB0aGlzIHBhdGNoIGluIHRoZSBuZXh0
IHNlcmllcy4NCg0KPiANCj4+IEZyb20gZ3Vlc3QgT1Mgd2UgY2FuIGNoZWNrIGlmIHRoZSBldmVu
dCBjaGFubmVsIGlzIHN0YXRpYyAodmlhIEVWVENITk9QX3N0YXR1cygpICBoeXBlcmNhbGwgKSwg
aWYgdGhlIGV2ZW50IGNoYW5uZWwgaXMNCj4+IHN0YXRpYyBkb27igJl0IHRyeSB0byBjbG9zZSB0
aGUgZXZlbnQgY2hhbm5lbC4gSWYgZ3Vlc3QgT1MgdHJ5IHRvIGNsb3NlIHRoZSBzdGF0aWMgZXZl
bnQgY2hhbm5lbCBYZW4gd2lsbCByZXR1cm4gZXJyb3IgYXMgc3RhdGljIGV2ZW50IGNoYW5uZWwg
Y2Fu4oCZdCBiZSBjbG9zZWQuDQo+IFdoeSBkbyB5b3UgbmVlZCB0aGlzPyBZb3UgYWxyZWFkeSBu
ZWVkIGEgYmluZGluZyBpbmRpY2F0aW5nIHdoaWNoIHBvcnRzIHdpbGwgYmUgcHJlLWFsbG9jYXRl
ZC4gU28geW91IGNvdWxkIHVwZGF0ZSB5b3VyIGJpbmRpbmcgdG8gcGFzcyBhIGZsYWcgdGVsbGlu
ZyBMaW51eCAiZG9uJ3QgY2xvc2UgaXQiLg0KPiANCj4gSSBoYXZlIGFscmVhZHkgcHJvcG9zZWQg
dGhhdCBiZWZvcmUgYW5kIEkgaGF2ZW4ndCBzZWVuIGFueSBleHBsYW5hdGlvbiB3aHkgdGhpcyBp
cyBub3QgYSB2aWFibGUgc29sdXRpb24uDQoNClNvcnJ5IEkgZGlkbuKAmXQgbWVudGlvbiB0aGlz
IGVhcmxpZXIsIEkgc3RhcnRlZCB3aXRoIHlvdXIgc3VnZ2VzdGlvbiB0byBmaXggdGhlIGlzc3Vl
IGJ1dCBhZnRlciBnb2luZyB0aHJvdWdoIHRoZSBMaW51eCBldnRjaG4gZHJpdmVyIGNvZGUNCml0
IGlzIG5vdCBzdHJhaWdodCBmb3J3YXJkIHRvIHRlbGwgTGludXggZG9u4oCZdCBjbG9zZSB0aGUg
cG9ydC4gTGV0IG1lIHRyeSB0byBleHBsYWluLg0KDQpJbiBMaW51eCwgc3RydWN0IHVzZXJfZXZ0
Y2huIHt9IGlzIHRoZSBzdHJ1Y3QgdGhhdCBob2xkIHRoZSBpbmZvcm1hdGlvbiBmb3IgZWFjaCB1
c2VyIGV2dGNobiBvcGVuZWQuIFdlIGNhbiBhZGQgb25lIGJvb2wgcGFyYW1ldGVyIGluIHRoaXMg
c3RydWN0IHRvIHRlbGwgTGludXggZHJpdmVyDQp2aWEgSU9DVEwgaWYgZXZ0Y2huIGlzIHN0YXRp
Yy4gV2hlbiB1c2VyIGFwcGxpY2F0aW9uIGNsb3NlIHRoZSBmZCAiL2Rldi94ZW4vZXZ0Y2hu4oCd
ICwgZXZ0Y2huX3JlbGVhc2UoKSB3aWxsIHRyYXZlcnNlIGFsbCB0aGUgZXZ0Y2huIGFuZCBjYWxs
IGV2dGNobl91bmJpbmRfZnJvbV91c2VyKCkNCmZvciBlYWNoIGV2dGNobi4gZXZ0Y2huX3VuYmlu
ZF9mcm9tX3VzZXIoKSB3aWxsIGNhbGwgIF9fdW5iaW5kX2Zyb21faXJxKGlycSkgdGhhdCB3aWxs
IGNhbGwgeGVuX2V2dGNobl9jbG9zZSgpIC4gV2UgbmVlZCByZWZlcmVuY2VzIHRvICJzdHJ1Y3Qg
dXNlcl9ldnRjaG7igJ0gaW4NCmZ1bmN0aW9uIF9fdW5iaW5kX2Zyb21faXJxKCkgdG8gcGFzcyBh
cyBhcmd1bWVudCB0byB4ZW5fZXZ0Y2huX2Nsb3NlKCkgbm90IHRvIGNsb3NlIHRoZSBzdGF0aWMg
ZXZlbnQgY2hhbm5lbC4gIEkgYW0gbm90IGFibGUgdG8gZmluZCBhbnkgd2F5IHRvIGdldCANCnN0
cnVjdCB1c2VyX2V2dGNobiBpbiBmdW5jdGlvbiBfX3VuYmluZF9mcm9tX2lycSgpICwgd2l0aG91
dCBtb2RpZnlpbmcgdGhlIG90aGVyIExpbnV4IHN0cnVjdHVyZS4NCg0KUmVnYXJkcywNClJhaHVs
DQoNCg==

