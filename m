Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E680F61163A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 17:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432154.684914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooRYg-0000at-C0; Fri, 28 Oct 2022 15:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432154.684914; Fri, 28 Oct 2022 15:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooRYg-0000XL-8w; Fri, 28 Oct 2022 15:46:10 +0000
Received: by outflank-mailman (input) for mailman id 432154;
 Fri, 28 Oct 2022 15:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqEQ=25=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ooRYe-0000XF-LI
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 15:46:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b98ec6-56d7-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 17:46:06 +0200 (CEST)
Received: from AM6PR04CA0038.eurprd04.prod.outlook.com (2603:10a6:20b:f0::15)
 by AS2PR08MB9320.eurprd08.prod.outlook.com (2603:10a6:20b:598::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 15:45:53 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::1b) by AM6PR04CA0038.outlook.office365.com
 (2603:10a6:20b:f0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 15:45:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 15:45:53 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 28 Oct 2022 15:45:53 +0000
Received: from 7f3da2e6fec1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8CD2E8E-C38C-4FA8-BCA6-28BD3E07D6A8.1; 
 Fri, 28 Oct 2022 15:45:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f3da2e6fec1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 15:45:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7530.eurprd08.prod.outlook.com (2603:10a6:20b:4f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 15:45:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 15:45:41 +0000
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
X-Inumbo-ID: a2b98ec6-56d7-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TkITVSr14HQ+9/OxEDb9PJU6/ue0qyAiSfWt4TbGIZBOvK40plvVG1VTup+oIa9xr1gZhv/oYZGXePAka37WATpcGw/owP0fCWM+BxJRP7B5auk9/X8ogKB9QwXg2q/BbA5+243oA/+EzsVZib5X3nwqRJLPw7xiMvPTaIA7ym5BT9Qlb66kSwsyL6oZ/MxHi7LVWogdoC/LrpiFaI09WJHL2SjYwr7L3dTTSzAUk752rK+JKl7wFUS6P10267C8pKKwzKriT9zfw/RPKjqjniB15CjPXW4iZs+HlHLfxOxFP4HFDuU6YCvtsnEstsRmgsWEY3jtFiQKOItalgWgaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w3AIFOT56xT7gpTwnUOohy02sNHJLZ5KfBpaHLruyc=;
 b=lx1cqDmlgY9A2qmJWoZVhTpWVhi2Tg/Ql9yiHOsm6Itx4s9SU3y8EEsaRojnjNvjXP00SuqMhoSTq1sI8YnSXVIvO6aWQb6m4XbeCc/WoG5Nkm1xpGFIgqKlGaCbVZqmGj1L0tnVxUUhjQZu3LbHmajJ+2PDyEk3uI7Vb/SHZSGCf86ERo7sRC7u7HYY89D/jNrgQtAtbfH6Wznwq5OBIDLDeqUk57RlNG4v18dU/ljPHVL/ChHnzawssMtvn3XxF1a6VELV9rXdmBhJvgYmdYID+eDC5+ifUENGEukL9Bj/0KXz16/zwqrzPkMX8ba2aiKnpjDGPKDHLMB5/QnXgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w3AIFOT56xT7gpTwnUOohy02sNHJLZ5KfBpaHLruyc=;
 b=RHww1MQuZCsb3Cy1M/tIovCmVAd6qcsMyGYRVc8Scpq36FBlWF49Up//bDOngCf+O9UD0oduhYU2wGf+F5BOSZ5hj5rf6wofTRVtq7cZVwPUQA8ZA7Owm143/gK3wrUNV0fSZyH2RpnAMS1fw6X+yb64aBMZwc2WrCF7FwJFEQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9fd18cb8ea3e382d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+t3ib1QBi2K3dmjY5ka82Iq9KCWlUp0XE4vpU8n0bm7TMn3/0FfNaIKoh4EhP35/jD1P2p43pgyuHdlfG7zolmclyMMQoWeZMnJIkxESm6J7lL7mAaRgVapqn8OlCzwW/vHJdKs4HT4jIY6c4tY7jA3fSVYV7jDqfBpm9s5z/Is+ZynKcJPAO28cu9ZqCbzB6FoTDJ3eY2ffLGmojUnuGtIBEtxPYvsDwQggIdzeOlRQQJT2zqk8Wo2hXvrQj82dK39OG5irMKDfHdkVMQ62BcDpdIjbGcux2vEX0B5V8xZOfD6ubsy5qTf3clflP0DtaTz6AS6uGOR99Ps/Hwimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w3AIFOT56xT7gpTwnUOohy02sNHJLZ5KfBpaHLruyc=;
 b=VC7JDKuRFWfx2pYXYhIIOPxywJ4UekDw8YZUE7q3d8XYTdSp3mziWmcCGOZaRSy70SzQ93+NGELkea+nN0Kz8je/J5D8Jbjd6bVxsIG78lAWa72R3gNzbNHEmGvv+aIki//1ly6OV6GAL+r7DNUf8gKKw1kGJesse04yaEyx+Yjk99SY8RJOn2CBj7YfjmZ52sf7HWPNGoS8abfWbSt8oqR2CfKk3BW/Yn2Jq/8DwXnHkdqBirfL7cV/7i5ylLOasbpXx17KcE5s5FhYfLC7OGZoqNT1abMcfk+SQ7yi/pJ8xX2hsJ4RYgcYgL4Huqs6qC+Xl0v6xWhuGgfydH9x6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w3AIFOT56xT7gpTwnUOohy02sNHJLZ5KfBpaHLruyc=;
 b=RHww1MQuZCsb3Cy1M/tIovCmVAd6qcsMyGYRVc8Scpq36FBlWF49Up//bDOngCf+O9UD0oduhYU2wGf+F5BOSZ5hj5rf6wofTRVtq7cZVwPUQA8ZA7Owm143/gK3wrUNV0fSZyH2RpnAMS1fw6X+yb64aBMZwc2WrCF7FwJFEQg=
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
 AQHY6T1V+gcJbmRqpEyt0b8GeG9bFq4grXIAgAAQCACAAFf9AIABVMyAgAAG64CAAVVJgIAAAzuAgAACBwCAAAPNgIAAE5mAgAAGngCAAAxxAA==
Date: Fri, 28 Oct 2022 15:45:41 +0000
Message-ID: <EED0A9FE-E948-469E-AB30-20BB69A03DD7@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <2981F6DC-444B-49DE-9D01-C0093A32E68F@arm.com>
 <affc51c9-0f8b-b76a-6f23-ec161c967580@xen.org>
In-Reply-To: <affc51c9-0f8b-b76a-6f23-ec161c967580@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB7530:EE_|AM7EUR03FT003:EE_|AS2PR08MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: b32af9e1-baa1-4dab-68d5-08dab8fb7f02
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L/mRHBG7dzA6tyzuxgM89QwybtI9HuprkGfG45rU7P3IeRQJHZxjY7XAAhWnPLwWd0KSSXZ0hYfoyBPyNBmwFWvs7Co+3LqqFwgqB2pI5dWU9vJvAkfrP4cuiFrCtp8QRB5SMfNkcx73ezXp3wkIw1pOrBCnvztPECGqU7FSICta6ujHnYPrLXP1ofrt6Kh72nI9UE4V33ajAlnr8PkqdiKfUplOmjm3u5tuCWxpQRvK/ivgtwRoDhUZ4/mPsSvL8ym7CrmVGeVOwSR//n5BrXDQ6b992aqXlytGhWVZ92TJAL18nRHsTvrF0IyCJVd13PJKhUQav79/O3Zx9f94PkLh3TQw3K9bDgbKblijC5XgyBtVM/6QyshzLPi4/0XNqUGUYEuLxKv9vk8vgD7Vfw+uvaD0EzNUWBkxTz4C/MuUdedV1EYhanZ49QoNZ7O9C1ZoGQ9l6nQnKxNJcm1iVIPjo7MqLhpYsV3TgDcg27rMdsLu6wVK9LjKqwkq7oGqPidIJPDDrItAtrvBmdZ0OREgKW3BGsAAVfwMS2UtL9/Xs2+dxDjgyQ3vMH6J7mfvn0skuMDBXyhuaZxOYcVwkLGX7/NRZnfjpmgWKPhd7wdDZJLo/IfeW8tBuWwHsKqwSa0Mr3iWbJV5iw0z/0zGSomUnzUIQJzRHoCYEcuIW99c7MGOfWfUT80kt6gjr9rroiBO1pQFW4rcV+avajgCAY+BWJ2Rhw0xJbNBmaYBGRQhe148j/Pz+OPwcd+h2Jt1bOH45eP3z8ZeGBSHehcE4IE2VDis6WgzorB0lxHPD/I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(66556008)(8676002)(316002)(86362001)(66946007)(76116006)(64756008)(41300700001)(91956017)(66476007)(4326008)(8936002)(7416002)(36756003)(38070700005)(33656002)(38100700002)(66446008)(122000001)(6512007)(6486002)(186003)(6506007)(54906003)(53546011)(26005)(478600001)(5660300002)(6916009)(2906002)(71200400001)(83380400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E724C4EBA618D4197701195E098134B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7530
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2d5f2ba-7475-47fc-ae57-08dab8fb77ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVniouvfa/fO+oNgxcdMyuiN2+0wr8KmSS3tw2BcyjPlOtXGesQBHgNeXcJp+sxQ+GcnGXpvdUeuDUve72sPT5HQUKnLw2iV83oeIKrHff86mT0jKb+nAeITB4ThhxbIHWSxqlFCBkl4mzhCqOYJQAz3jPxv747bzq2kMWGQV6yXRYi5bLd73osPNmEWlSkfYzXIV2sqhYhL3WdurRNzJ4tRAEM3blDSSNn4iIkHCHZ/IeynYShUfA55qrbtNGPR9wfc8/ZepuADNzavqG+KzSRU0efy3VCkss/yJMBEO1A/TIkkqK9Br3D0nnGmH16QbHwCMqz6w03fwb7FbrG8O2c09D1Uh0U5E5ZBIiRnh7utLU/QSUd7WTUwDbqmWQb1cc/FByrH0nQM9hZ4Un5U0mYP0bZFupLqZannvyerTwIm9eSbvYFe5zG7tnY1ryoDZMvjGqx/YYzsB+KaiHaehK26NCr7vlbSC0CYaZoygvoBW6VvOAcLLykLU1Ws74tSld/oueToZEyvi5ccAHOoTIzOzmlXYrfmv8ccyMip+m7VNzX7ncxnjTUfxEMBrBShGIjWXV23e6cxmxpShYrdWUS4taC1ZAFrzlDqlEHq9gvFfDG5hBJ6lVh9TjvVlo1f1k5uEtwcvu8MvXFx5mQdbqVfzX2k+jPRTSA91yEESAdKl2U/mzqcbgeLxYgfRawAwrRpGzIBp07bWFwM7NwoNkK14CgA4GGaBMXHegWHv4zWMaxX9ty+s2HgjlAH2cSDG3OAcOdDmtqkfg9Az0TkoQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(83380400001)(478600001)(6486002)(36756003)(41300700001)(53546011)(2616005)(316002)(8676002)(4326008)(6506007)(6512007)(26005)(107886003)(33656002)(2906002)(6862004)(8936002)(186003)(40460700003)(5660300002)(54906003)(47076005)(40480700001)(336012)(70206006)(70586007)(82310400005)(36860700001)(356005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 15:45:53.2887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b32af9e1-baa1-4dab-68d5-08dab8fb7f02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9320

SGkgSnVsaWVuLA0KDQo+IE9uIDI4IE9jdCAyMDIyLCBhdCAxNjowMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI4LzEwLzIwMjIgMTU6Mzcs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gMjggT2N0IDIwMjIsIGF0IDE0OjI3LCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiAyOC8xMC8yMDIyIDE0
OjEzLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4gDQo+Pj4g
SGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4+PiBPbiAyOCBPY3QgMjAyMiwgYXQgMTQ6MDYsIEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSBSYWh1bCwN
Cj4+Pj4+IA0KPj4+Pj4gT24gMjgvMTAvMjAyMiAxMzo1NCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
Pj4+Pj4+Pj4+PiBGb3IgQUNQSSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIHRoZSBpbmZvcm1hdGlv
biB0byBiZSBmb3VuZCBpbiB0aGUgSU9SRVEuDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IFNv
IGNhbiB5b3UgYWRkIG1vcmUgY29udGV4dCB3aHkgdGhpcyBpcyBuZWNlc3NhcnkgZm9yIGV2ZXJ5
b25lPw0KPj4+Pj4+Pj4+PiBXZSBoYXZlIGluZm9ybWF0aW9uIGZvciBJT01NVSBhbmQgTWFzdGVy
LUlEIGJ1dCB3ZSBkb27igJl0IGhhdmUgaW5mb3JtYXRpb24gZm9yIGxpbmtpbmcgdk1hc3Rlci1J
RCB0byBwTWFzdGVyLUlELg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEkgYW0gY29uZnVzZWQuIEJl
bG93LCB5b3UgYXJlIG1ha2luZyB0aGUgdmlydHVhbCBtYXN0ZXIgSUQgb3B0aW9uYWwuIFNvIHNo
b3VsZG4ndCB0aGlzIGJlIG1hbmRhdG9yeSBpZiB5b3UgcmVhbGx5IG5lZWQgdGhlIG1hcHBpbmcg
d2l0aCB0aGUgdmlydHVhbCBJRD8NCj4+Pj4+Pj4+IHZNYXN0ZXJJRCBpcyBvcHRpb25hbCBpZiB1
c2VyIGtub3dzIHBNYXN0ZXJJRCBpcyB1bmlxdWUgb24gdGhlIHN5c3RlbS4gQnV0IGlmIHBNYXN0
ZXJJZCBpcyBub3QgdW5pcXVlIHRoZW4gdXNlciBuZWVkcyB0byBwcm92aWRlIHRoZSB2TWFzdGVy
SUQuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBTbyB0aGUgZXhwZWN0YXRpb24gaXMgdGhlIHVzZXIgd2ls
bCBiZSBhYmxlIHRvIGtub3cgdGhhdCB0aGUgcE1hc3RlcklEIGlzIHVuaXEuIFRoaXMgbWF5IGJl
IGVhc3kgd2l0aCBhIGNvdXBsZSBvZiBTTU1VcywgYnV0IGlmIHlvdSBoYXZlIDUwKyAoYXMgc3Vn
Z2VzdGVkIGFib3ZlKS4gVGhpcyB3aWxsIGJlY29tZSBhIHBhaW4gb24gbGFyZ2VyIHN5c3RlbS4N
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+IElITU8sIGl0IHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlmIHdlIGNh
biBkZXRlY3QgdGhhdCBpbiBsaWJ4bCAoc2VlIGJlbG93KS4NCj4+Pj4+PiBXZSBjYW4gbWFrZSB0
aGUgdk1hc3RlcklEIGNvbXB1bHNvcnkgdG8gYXZvaWQgY29tcGxleGl0eSBpbiBsaWJ4bCB0byBz
b2x2ZSB0aGlzDQo+Pj4+PiANCj4+Pj4+IEluIGdlbmVyYWwsIGNvbXBsZXhpdHkgaW4gbGlieGwg
aXMgbm90IHRvbyBtdWNoIG9mIHByb2JsZW0uDQo+Pj4+IEkgYW0gYSBiaXQgdW5zdXJlIGFib3V0
IHRoaXMgc3RyYXRlZ3kuDQo+Pj4+IEN1cnJlbnRseSB4bCBoYXMgb25lIGNvbmZpZ3VyYXRpb24g
ZmlsZSB3aGVyZSB5b3UgcHV0IGFsbCBYZW4gcGFyYW1ldGVycy4gVGhlIGRldmljZSB0cmVlIGlz
IG9ubHkgbmVlZGVkIGJ5IHNvbWUgZ3Vlc3RzIHRvIGhhdmUgYSBkZXNjcmlwdGlvbiBvZiB0aGUg
c3lzdGVtIHRoZXkgcnVuIG9uLg0KPj4+PiBJZiB3ZSBjaGFuZ2UgdGhlIG1vZGVsIGFuZCBzYXkg
dGhhdCBYZW4gY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzIGFyZSBib3RoIGluIHRoZSBjb25maWd1
cmF0aW9uIGFuZCB0aGUgZGV2aWNlIHRyZWUsIHdlIHNvbWVob3cgZW5mb3JjZSB0byBoYXZlIGEg
ZGV2aWNlIHRyZWUgZXZlbiB0aG91Z2ggc29tZSBndWVzdHMgZG8gbm90IG5lZWQgaXQgYXQgYWxs
IChmb3IgZXhhbXBsZSBaZXBoeXIpLg0KPj4+IA0KPj4+IEkgdGhpbmsgbXkgYXBwcm9hY2ggd2Fz
IG1pc3VuZGVyc3Rvb2QgYmVjYXVzZSB0aGVyZSBpcyBubyBjaGFuZ2UgaW4gdGhlIGV4aXN0aW5n
IG1vZGVsLg0KPj4+IA0KPj4+IFdoYXQgSSBhbSBzdWdnZXN0aW5nIGlzIHRvIG5vdCBpbnRyb2R1
Y2UgaW9tbXVfZGV2aWRfbWFwIGJ1dCBpbnN0ZWFkIGxldCBsaWJ4bCBhbGxvY2F0ZSB0aGUgdmly
dHVhbCBNYXN0ZXItSUQgYW5kIGNyZWF0ZSB0aGUgbWFwcGluZyB3aXRoIHRoZSBwaHlzaWNhbCBN
YXN0ZXItSUQuDQo+Pj4gDQo+Pj4gTGlieGwgd291bGQgdGhlbiB1cGRhdGUgdGhlIHByb3BlcnR5
ICJpb21tdXMiIGluIHRoZSBkZXZpY2UtdHJlZSB3aXRoIHRoZSBhbGxvY2F0ZWQgdmlydHVhbCBN
YXN0ZXItSUQuDQo+PiBPayBJIHVuZGVyc3RhbmQgbm93Lg0KPj4+IA0KPj4+IEVhY2ggbm9kZSBp
biB0aGUgcGFydGlhbCBkZXZpY2UtdHJlZSB3b3VsZCBuZWVkIHRvIGhhdmUgYSBwcm9wZXJ0eQ0K
Pj4+IHRvIHJlZmVyIHRvIHRoZSBwaHlzaWNhbCBkZXZpY2UganVzdCBzbyB3ZSBrbm93IGhvdyB0
byB1cGRhdGUgdGhlICJpb21tdXMiLiBUaGUgbGlzdCBvZiBkZXZpY2UgcGFzc3Rocm91Z2ggd2ls
bCBzdGlsbCBiZSBzcGVjaWZpZWQgaW4gdGhlIGNvbmZpZ3VyYXRpb24gZmlsZS4gSU9XLCB0aGUg
cGFydGlhbCBkZXZpY2UtdHJlZSBpcyBub3QgZGlyZWN0bHkgaW52b2x2ZWQgaW4gdGhlIGNvbmZp
Z3VyYXRpb24gb2YgdGhlIGd1ZXN0Lg0KPj4gQnV0IHdlIHdpbGwgZ2VuZXJhdGUgaXQuIEhvdyB3
b3VsZCBzb21ldGhpbmcgbGlrZSBaZXBoeXIgZ3Vlc3Qgd29yayA/IFplcGh5ciBpcyBub3QgdXNp
bmcgdGhlIGRldmljZSB0cmVlIHdlIHBhc3MsIGl0IGhhcyBhbiBlbWJlZGRlZCBvbmUuDQo+IA0K
PiBJbiBnZW5lcmFsLCBndWVzdCB0aGF0IGRvbid0IHVzZSB0aGUgZGV2aWNlLXRyZWUvQUNQSSB0
YWJsZSB0byBkZXRlY3QgdGhlIGxheW91dCBhcmUgYWxyZWFkeSBpbiBhIGJhZCBzaXR1YXRpb24g
YmVjYXVzZSB3ZSBkb24ndCBndWFyYW50ZWUgdGhhdCB0aGUgbGF5b3V0IChtZW1vcnksIGludGVy
cnVwdC4uLikgd2lsbCBiZSBzdGFibGUgYWNyb3NzIFhlbiB2ZXJzaW9uLiBBbHRob3VnaCwgdGhl
cmUgYXJlIGEgaW1wbGljaXQgYWdyZWVtZW50IHRoYXQgdGhlIGxheW91dCB3aWxsIG5vdCBjaGFu
Z2UgZm9yIG1pbm9yIHJlbGVhc2UgKGkuZS4gNC4xNC54KS4NCg0KV2VsbCByaWdodCBub3cgd2Ug
aGF2ZSBubyBBQ1BJIHN1cHBvcnQuDQpCdXQgSSBzdGlsbCB0aGluayB0aGF0IGEgbm9uIGR0YiBn
dWVzdCBpcyBkZWZpbml0ZWx5IGEgdXNlIGNhc2Ugd2UgbmVlZCB0byBrZWVwIGluIG1pbmQgZm9y
IGVtYmVkZGVkIGFuZCBzYWZldHkgYXMgbW9zdCBwcm9wcmlldGFyeSBSVE9TIGFyZSBub3QgdXNp
bmcgYSBkZXZpY2UgdHJlZS4NCg0KPiANCj4gQnV0IHNlZSBiZWxvdyBmb3Igc29tZSBzdWdnZXN0
aW9ucyBob3cgdGhpcyBjb3VsZCBiZSBoYW5kbGVkLg0KPiANCj4+PiANCj4+PiBTbyBmYXIsIEkg
ZG9uJ3Qgc2VlIGEgcGFydGljdWxhciBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2ggYmVjYXVzZSB0
aGUgdk1hc3RlciBJRCBhbGdvcml0aG0gYWxsb2NhdGlvbiBzaG91bGQgYmUgZ2VuZXJpYy4gQnV0
IHBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgdGhlcmUgYXJlIGJpdHMgSSBhbSBtaXNz
aW5nLg0KPj4gSSBhbSBhIGJpdCBhZnJhaWQgb2YgdGhpbmdzIHRoYXQgYXJlIOKAnGF1dG9tYXRp
Y+KAnS4NCj4+IEZvciBldmVyeXRoaW5nIGVsc2Ugd2UgbGV0IHRoZSB1c2VyIGluIGNvbnRyb2wg
KElQQSBmb3IgbWFwcGluZywgdmlydHVhbCBpbnRlcnJ1cHQgbnVtYmVyKSBhbmQgaW4gdGhpcyBj
YXNlIHdlIHN3aXRjaCB0byBhIG1vZGVsIHdoZXJlIHdlIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVk
IGEgdk1hc3RlciBJRC4NCj4gDQo+IFdlIG9ubHkgbGV0IHRoZSB1c2VyIGNvbnRyb2wgd2hlcmUg
dGhlIGRldmljZSBpcyBtYXBwZWQuIEJ1dCB0aGlzIGlzIHF1aXRlIGZyYWdpbGUuLi4gSSB0aGlu
ayB0aGlzIHNob3VsZCBiZSBnZW5lcmF0ZWQgYXQgcnVudGltZS4NCj4gDQo+PiBXaXRoIHRoaXMg
bW9kZWwsIGd1ZXN0IG5vdCB1c2luZyB0aGUgZGV2aWNlIHRyZWUgd2lsbCBoYXZlIHRvIGd1ZXNz
IHRoZSB2TWFzdGVyIElEIG9yIHNvbWVob3cga25vdyBob3cgdGhlIHRvb2xzIGFyZSBnZW5lcmF0
aW5nIGl0IHRvIHVzZSB0aGUgcmlnaHQgb25lLg0KPiANCj4gVG8gYmUgaG9uZXN0LCB0aGlzIGlz
IGFscmVhZHkgdGhlIGNhc2UgdG9kYXkgYmVjYXVzZSB0aGUgbGF5b3V0IGV4cG9zZWQgdG8gdGhl
IGd1ZXN0IGlzIHRlY2huaWNhbGx5IG5vdCBmaXhlZC4gWWVzLCBzbyBmYXIsIHdlIGhhdmVuJ3Qg
Y2hhbmdlZCBpdCB0b28gbXVjaC4gQnV0IHNvb25lciBvciBsYXRlciwgdGhpcyBpcyBnb2luZyB0
byBiaXRlIGJlY2F1c2Ugd2UgbWFkZSBjbGVhciB0aGF0IHRoZSBsYXlvdXQgaXMgbm90IHN0YWJs
ZS4NCj4gDQo+IE5vdywgaWYgdGhvc2UgcHJvamVjdHMgYXJlIHdpbGxpbmcgdG8gcmVidWlsZCBm
b3IgZWFjaCB2ZXJzaW9uLCB0aGVuIHdlIGNvdWxkIHVzZSB0aGUgZm9sbG93aW5nIGFwcHJvYWNo
Og0KPiAgMSkgV3JpdGUgdGhlIHhsLmNmZw0KPiAgMikgQXNrIGxpYnhsIHRvIGdlbmVyYXRlIHRo
ZSBkZXZpY2UtdHJlZQ0KPiAgMykgQnVpbGQgWmVwaHlyDQo+ICA0KSBDcmVhdGUgdGhlIGRvbWFp
bg0KPiANCj4gVGhlIGV4cGVjdGF0aW9uIGlzIGZvciBhIGdpdmVuIFhlbiB2ZXJzaW9uIChhbmQg
Y29tcGF0aWJsZSksIGxpYnhsIHdpbGwgYWx3YXlzIGdlbmVyYXRlIHRoZSBzYW1lIERldmljZS1U
cmVlLg0KDQpUaGlzIGlzIGEgZ29vZCBpZGVhIHllcyA6LSkNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

