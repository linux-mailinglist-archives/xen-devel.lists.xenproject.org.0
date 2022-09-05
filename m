Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3C5ACE85
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398618.639500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV898-0001bG-VL; Mon, 05 Sep 2022 09:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398618.639500; Mon, 05 Sep 2022 09:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV898-0001YC-SF; Mon, 05 Sep 2022 09:11:58 +0000
Received: by outflank-mailman (input) for mailman id 398618;
 Mon, 05 Sep 2022 09:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oV897-0001Y6-VM
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:11:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b1718e-2cfa-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 11:11:55 +0200 (CEST)
Received: from DU2P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::8) by
 PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 09:11:54 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::15) by DU2P251CA0012.outlook.office365.com
 (2603:10a6:10:230::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 09:11:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 09:11:53 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 05 Sep 2022 09:11:53 +0000
Received: from 40efb51d4ed9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F9FCBE0-2F0D-4423-A14C-2370BA9A5A9D.1; 
 Mon, 05 Sep 2022 09:11:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40efb51d4ed9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 09:11:46 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS2PR08MB8362.eurprd08.prod.outlook.com (2603:10a6:20b:545::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 09:11:45 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:11:44 +0000
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
X-Inumbo-ID: c9b1718e-2cfa-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NSdzgxCdDRVDM2HcEFfCNgKGNTNc0FjFF3QpsTCGjP0ePezOHADrinySP+E2qYZPPsJaReK2gQu5b8wgwGjLWlx0UzdwDXGUv88/KlyKbWmqnw7iUedm+mIBsnl8XYCUSHPr5FKlejlcvss3e7jOG8LUG27uBnBVAmLJ1wFRz77mTqpBV7FUB3kqlkHjIQ0p8jPJO9PPFrac1ewVDXHUVdEDpRJIisNMmqA45e8YtjAn19olWDFk/PR+SYNy+3Cv2KVeBccYqGHUMw8jqL3l4m5f4CNMVCbhn1r5FFDnvjapwESTlPtVv6EZrEy6K9frMC8zfB/E6FLgf8RylpUQEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXHzqPrFfTspFIw1SxP0IY02oNfxltXmy++thZqLMWM=;
 b=ZEmMQUhrCoIh1z9Ogn44GRcQA8t01mGUxvHHY8vd3u/Nf4yzEKw/0BzaUrE1F8QLp5akkCd5HIunCauDqLw3n0/6AOhcNyYuaOtXduNeFOQo2mAcdkS3WnhFFu0lauc7gjlEiD/hgmaIo3aBFtotdwPVL3/QtvV9fiJEqnSgRdnd2ceex9ivm6SpfWeDj8u8ho4hk5nc3WFHwsfAJUymlqLzRa2WWuy3rXUf/RBnaQsv8y9Z+03EDUwQxYhpaHdQDdpDP9rT5vbeCGEfpcNUJX7bXJmhyhHQfTxYJn7xwXi/1g9/lzZ/+7+C3/Z4a+1wi0WP+Ai5ndpQuUoL1lZhLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXHzqPrFfTspFIw1SxP0IY02oNfxltXmy++thZqLMWM=;
 b=jnunlRNlKiS2fikNKPbEbvWQ4uKtkoa+lCVZK9GdYimAqy6/6LWZXVw8Spnew5dygTsw25yE61U+06P6Tg790E8KmcO9lf/RZH9lLCfuSjFzwvVvOTU89cmIrJ2Ap1QbadXPODjyXxLmLYn19bkCKuulJh4fBjhVtCkQbuNCL2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29ace08cdaeac71e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFTgvocMc7g1HiLvxMUTZFIP/0yeD5TmO/J3wGPd1Z3nNELmpp8gozOctea+Kf9IaWi4i1QqLbV+9im1uUM57aaiWPvZ1kjeE3QOaJanyUv25SjnHk1uV7Tkz7rNocPgbXBvEBU4GILqBUm2eMw1mWedXCq0FzEHeQtuaakrIbGt6XRFdwRtvvuR1unQ2Q+9jpO3LlKtmwIhZRtAOfFHtSswYvzzqESCa+U56VmA/2Zg0Adx2NrIXcyQ2dZfU4xhWFlij4j1fyqjfl+pfpkOLPRyX0AHoLMEbrFtBsxBcQsjX8k43s3t+DpW9sRGaB+0j5IichRajOc/vjhrC+YgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXHzqPrFfTspFIw1SxP0IY02oNfxltXmy++thZqLMWM=;
 b=Sn+sziLwLzvwOjw7KYz5ifZSvyWlu+fW4ElvIZJjCsmYNghKjiK/iLy1tx/XlfyvKeQcMXjcUyL5BwBT6Qj56we0JD6qDFHLfgW1+jZHJ1VYx/qmA5KTTR73bHFO/Ty1+XsrTfnt0z/RN0Zf3+Qpm/7bZTfuKmtr4xw85kFk7HUpABVZkm6JBrxcZJk/4PdyLE9eppmA6KJ0Sn4t8gXfcPloDy8Mufqby/z/dSjs706+4HxqGeZwhaFjcZTwTUXRaxx7/h0OUfSNRGmqmpVwQ+ePEODPkTA4MwD33tAbQPJULw3u3CTdhtpdfgTBCy0zLNZqhOgcUK6kBkuHT3bxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXHzqPrFfTspFIw1SxP0IY02oNfxltXmy++thZqLMWM=;
 b=jnunlRNlKiS2fikNKPbEbvWQ4uKtkoa+lCVZK9GdYimAqy6/6LWZXVw8Spnew5dygTsw25yE61U+06P6Tg790E8KmcO9lf/RZH9lLCfuSjFzwvVvOTU89cmIrJ2Ap1QbadXPODjyXxLmLYn19bkCKuulJh4fBjhVtCkQbuNCL2U=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Eric Auger <eric.auger@redhat.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 04/10] xen/arm: smmuv3: Move definitions to a header
Thread-Topic: [PATCH v2 04/10] xen/arm: smmuv3: Move definitions to a header
Thread-Index: AQHYvtETH3/THBwEyUiOSo1yfqj9qq3Myi8AgAPHNoA=
Date: Mon, 5 Sep 2022 09:11:44 +0000
Message-ID: <8932E06A-F426-4185-8EF0-46B4DCFABB84@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <73362954b7395155c8287d2ea0737e132516cc90.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021628370.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209021628370.3931@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 97f7346c-27ff-4287-c86f-08da8f1eacaa
x-ms-traffictypediagnostic:
	AS2PR08MB8362:EE_|DBAEUR03FT059:EE_|PR3PR08MB5643:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jwoQPJfmogOUwQEeSi3lgcmHk0CqTogKXljPsO96YmftSRuybvVIjKsYOawNuIc0N5OUoUotr3rnISgQ3MT3WwBbQTYY0094MZVgXUDgUqLFWouAUY5VUVUl1oy1yZnN7EfMMcr01e3XI6hr82ZAXaLmAHDSlh2Ah3BjI4J82Wi7USnDE7UX59pYLxNogiigoH1C7bk/96xVnSRncemdT2SU89GpsuprEg29VCf+XHXDuJ5dlXzWolakQPFot5XXc9AeipEl3WUn+3arWQhNhFqBkxODuMtU2EB7nd4IldlBEQyCvaRHZ3MbcCkQbrIP3YeohlJM3SiajmCVEnkMrpBZEspQwPpN0rAFrAXlvhLwLZ+w/mOmMj0FTSS5K+nqjGBJiNLdpo1OfHyy/7jt/vVcBcwOuLWq7y9MAlqEX5ZzyNh6Qz6GT6Cd5TvuZSV7BSTGNeqCzc8Eemw4B7K9Znsc8u+im7jM3pn6beAIB47rBmw7Uw9Xy4lCQLr/y/YtU95V9mMPYo7/Kto0FgDgGwLn2Kb7f3IUGRdh3uetP19koMSJavpsGJZTz0P8+LKyASw3q51cBDZEHUSQHr8PlQ5Uelp7Po1PiPlbtfsAd+erkSY9nSriSY6+Yli7YDlcJFmZF7aWHSWK6MjL74/pIN9tFBkx/0bhjlOu9+pyMDNoZ2gupVQHD4a8mIPdgkOoGgxBUdAvpxnSxT0UD3zEKSe5F2znaXzi4SeaUWJYaqdXcEiqQvtcYpMu8IgU+DYbvjoEOQUBM+2ZEb3MoAUTU6+k7UNIZw0uB+xvQgMP8n4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(71200400001)(2616005)(53546011)(76116006)(66946007)(66556008)(6506007)(66476007)(91956017)(4744005)(26005)(2906002)(316002)(6486002)(38100700002)(86362001)(41300700001)(6916009)(64756008)(186003)(8676002)(54906003)(4326008)(6512007)(478600001)(122000001)(66446008)(5660300002)(36756003)(38070700005)(8936002)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ECA5337415DD5149AF2875F33F4F1AB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8362
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06b83682-2fbd-4293-3d80-08da8f1ea74b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cjhpX0D7+VqkjOXDHx7Xoupz+PwbysH9JSMxBGGZFGSNCrFw8SjYU7xrBDOn67CxEGiC5S2KFAn/eImwu/bfR6+mg8r3m22j+rmBTVWFnqmtJj7BuOTpWqEIVsK7ZlvZUfwHQGY7oUPZz5bQJm4++CKjhohKZPHbhqJ/Z5XCUqW1TnqQWnyHcKu+uBUxz6pVTUjDMiyuwluqMS/3OjZ2BRlhwUlzOZUX72AB6UCd3DxJektzrKhFHesvFi7/EP37mbfxzGBGd4DimnhwzT21sEqzihBvddOOS86ZrDC6hc3/limojSL3XDBgjqY1YpTwjJKTM4jwBXWaYR7ajUzYxzCU2pjBqdslRuagUTEAR+yFUfgAvXqPn9DOHTxnMo11X11a14dlM/i5o5ywGm1Yx46G4rdYPc0qevhPpx+b+6v5SY9w0wP3CBcOawKnKbZQWKcyMjQDihexy1FKEIBMksLZZ7XkUA7b56fgv822aYlo1mbr8byGcfl43xGJhSnv1leANpVmIvr1CivnpCbcRSmnbo6VufQy17pY0iLFEfI7R6CbfgKB/lrHzzrH/Fz8mZkjoovpCrL2AW3z6vRXphOI/u5+bR/Ia6aTFdt/GoR9DhbNIuwUmucJCGD6eGXE8KY/8pJjXNpee7pkwRury56q4Fo4frK7g7BcuN0QH8Bpi4uYnjZRyeYZaYHBYU5fQKaAsg83QqJ5gyoraqPKCK2DMBdNt9o2zC+M8Y4yZJ8F1vb/IT+XECkHcYAHYkK3HGb3H9RNIXqVyX8sBCbeiQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(46966006)(40470700004)(186003)(2616005)(53546011)(47076005)(40480700001)(6862004)(83380400001)(8936002)(5660300002)(4744005)(336012)(41300700001)(86362001)(36756003)(6506007)(6486002)(478600001)(107886003)(26005)(6512007)(81166007)(40460700003)(2906002)(356005)(316002)(70206006)(70586007)(82310400005)(4326008)(8676002)(33656002)(82740400003)(36860700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:11:53.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f7346c-27ff-4287-c86f-08da8f1eacaa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643

Hi Stefano,

> On 3 Sep 2022, at 12:29 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Fri, 2 Sep 2022, Rahul Singh wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>=20
>> Backport Linux commit e881e7839fba. This is the clean backport without
>> any changes.
>=20
> I don't think we can say that this is a clean backport because there are
> differences between the two patches.
>=20
> That said, it is just code movement, it is similar to the original
> patch, and it still compiles. So I think we should change the commit
> message not to say that it is a clean backport, but other than that is
> fine.
>=20

Ok. I will remove the clean backport msg from commit msg in next version.

Regards,
Rahul=

