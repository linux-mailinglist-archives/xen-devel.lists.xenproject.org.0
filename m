Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992AB6DEC24
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 08:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520054.807275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmUOf-0001ZA-SI; Wed, 12 Apr 2023 06:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520054.807275; Wed, 12 Apr 2023 06:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmUOf-0001WQ-Nm; Wed, 12 Apr 2023 06:56:01 +0000
Received: by outflank-mailman (input) for mailman id 520054;
 Wed, 12 Apr 2023 06:56:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QpzN=AD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmUOe-0001WK-Iy
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 06:56:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12cf5f27-d8ff-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 08:55:56 +0200 (CEST)
Received: from AS4PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::11)
 by AS2PR08MB8381.eurprd08.prod.outlook.com (2603:10a6:20b:558::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 06:55:20 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d8:cafe::62) by AS4PR10CA0030.outlook.office365.com
 (2603:10a6:20b:5d8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Wed, 12 Apr 2023 06:55:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Wed, 12 Apr 2023 06:55:19 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 12 Apr 2023 06:55:19 +0000
Received: from 8ce5651f1bbc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4343D40D-5391-4EEA-8F3E-466E5BA9F7B3.1; 
 Wed, 12 Apr 2023 06:55:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ce5651f1bbc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Apr 2023 06:55:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9817.eurprd08.prod.outlook.com (2603:10a6:102:31d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 06:55:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6277.034; Wed, 12 Apr 2023
 06:55:11 +0000
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
X-Inumbo-ID: 12cf5f27-d8ff-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVWSCWaPCaSF2F5CYJf465h0SbWQLJccfkSY+GBw/Bc=;
 b=bP7iWe/TLAJ6UpL96lDBW9EFwcNXHKigvl+DisnWf+2c4KvO787DgH3J3P+xRwgCTWxDme5fZPBmU35XS0/e17vyi9IwsgH/GylZuvYdcMAouiSHKtRfbnQza62Lzm5QqMlXSJ6kiYw916/t++5Ewx97dev85+cbM7GX/bkmHSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKHN3oBp9P3+6EHVHS5ZEXDL0F7wNLgdr3HWV0kq3Ip20LhJyu7D+dZLjoTTc13RJtUMqrewef5LzQquDnMt5vOpS1ZzTBW362EApfoDxBFrSGfV2TEYqxLs5q5hf7Lx7A80UiU7+XVLRIEaNVFJMpoRSPMUzUUH6hr6RffwiSOVB7O/MfqTKAJSPhLQtAOiJ6eWQBswKsiF3kcGiyTKUaZEsN70FxqqrNPtKcM+1xLlYPqxDLamsGdlrqDnfx9VCZyKTzPNQ0UkIVsUHXWDXRevirONE4DDsM3jfuWV51X6b4xOiEr8fYGBzObD9iYbIHG7IF8QdiWlbMKd75bImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVWSCWaPCaSF2F5CYJf465h0SbWQLJccfkSY+GBw/Bc=;
 b=QvBCQV1mY19LAH0LB9i7KUq8Cfuc1PeT6Ck7Ex+8vhyzoKXL8CRzrSe7M6RFIOplwd4kT6cnEMMptegnaPfIUlkbIvfFljaAzRqRUEX+L5W443/u9AE/apGoM9PJsxWrfeySIwiCLSOPrZjQuMnozv3yJ6PpaPL5ulR0zju9K3pgFHrcpR211Ms0mjnXM4ndj+jNGK39JvN5ckFvYek4R9BAFoghZsxPLh+6kzXJwo9m8S7OyM4ZcDLSW0FL+no31JUOw9ykwj41PM3GlDmB/ZfpznJMDn7BuGDFi4fylvWv4MxifQBIEV1Wb5XpwcKJNuj1jMJPXW6UtT2coPIrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVWSCWaPCaSF2F5CYJf465h0SbWQLJccfkSY+GBw/Bc=;
 b=bP7iWe/TLAJ6UpL96lDBW9EFwcNXHKigvl+DisnWf+2c4KvO787DgH3J3P+xRwgCTWxDme5fZPBmU35XS0/e17vyi9IwsgH/GylZuvYdcMAouiSHKtRfbnQza62Lzm5QqMlXSJ6kiYw916/t++5Ewx97dev85+cbM7GX/bkmHSQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 3/3] xen/arm: vpl011: Do not try to handle TX FIFO status
 when backend in Xen
Thread-Topic: [PATCH 3/3] xen/arm: vpl011: Do not try to handle TX FIFO status
 when backend in Xen
Thread-Index: AQHZZ7BhM9d/TecBu020qzDpPrY4KK8nPD6g
Date: Wed, 12 Apr 2023 06:55:11 +0000
Message-ID:
 <AS8PR08MB7991B95CF8B3209FAADB1613929B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
 <20230405111750.12491-4-michal.orzel@amd.com>
In-Reply-To: <20230405111750.12491-4-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 49045ABDCBE97E4392E7DD52327A3008.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9817:EE_|AM7EUR03FT057:EE_|AS2PR08MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2fe3dd-53db-4226-d4a0-08db3b22e11e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TsNLowLfNpIpfZDhOUqRdxL8C5E+rw+oA3rmqR7Avw55gYVYgAkpkF1NKYe9eBmfVTw0DmIx40RHxwICLGEbS32zUWjEKcKVWBqJ3DscUYWXIRU36avbzsdOK4PQXltaN45ksU2C9hFzzrBJ8w4ggo4u9D4yjuccctdr2sajiaQ6gp8VdKR1pVWEL0B0uI0ZTiKwARW63yGcziMvEiX7O//DTbeLPtrl2yKZDxG9LPn+ckE3vnxSFaOGoM2NrVZC/bpk1hYMVBZxWzJpdNh8l5mNSGqTFdh9KD8PLrImhJztvtLM8yMWhPxoR4jZ4nglKtFvTu3lYl1B2Pa4/dT4BAg/WvB6SCngrM0ej6FaNYznml1WiteiR0kpChkvinfP2YRnM+M782dzmZ8asrKYnoVCDHv3wbKMIBXthW0DDHSFU6ndbTo2fUjhKMc+mw+6j3zDrzskogW4SgPQUddEQ7A+qrTNwJlvldmajmBZOoeEIHoH4aH4W2EPDudPIiwDJBWNRUjAaz+FwsvD3z8dKVsHlI+1psHMKwbMwTHf8El3CykMeu/kIhbn5M7qAV0SQz4ut0k3KYgkJ9YdAJmK59aGYSPDDwVCQdX6tcckUJtPvnoJO8XnyE+ir1lN8T1x
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(66476007)(8676002)(66446008)(4326008)(7696005)(66556008)(64756008)(71200400001)(66946007)(76116006)(54906003)(478600001)(41300700001)(110136005)(316002)(33656002)(86362001)(83380400001)(9686003)(6506007)(26005)(8936002)(2906002)(5660300002)(55016003)(38070700005)(38100700002)(186003)(52536014)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9817
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51587d48-102d-4b71-0f5c-08db3b22dc25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/3jL306WTHXVGJvhmWF9fjkTKkn/X3n+LHl+nZDblk8Xvg0uMf8qoIuSWm/h65CerlOZPpdrCTVO7tYEIzVRIc0qdDhr8MA8Oysa0DKEY73mCxhl8J89xq+39Ew/HC2CpFmzdw4rj/5vVoGvGkTMq7vA7/xw/8bDr6E7jFgh8DvKA5KfIdCM1w2N/uzm7Lq/ol0DndTpVCpbaNt3wVCsfkDsxkA2PrU9/rERL1SHtGlohQwNrpjQR2s43KPToPkQvmU30gu8pa80k5kNxBRqRQNQuB//UijrF4mC6gq/qrxzIyrCQbuAbPMr3qVSqZf5BKBOnCcCqzHwQrP9GXVD5s/urORK+MlyUFCjG7PDEjPKTtWz/55l4k5fizIbm6aHBNqbD2/ZZvIjWecZPyTlISf7dkqTYXTNsQODZmpw5JzH2PC0Qsee5j8JqO2dmKWM0OhXUmWRzAwtaTLAHMSBIqpW5BCxubAzwBZ4tjl+ran5Wuix8mi9+3w+FRBiDCA7B1StOFcA/Ul980chqwbdXCkm4ucgpKqeFufLcu6cLsJb/c5ePYlwLVfAo6tSdzraO9eQYfViI+JByeUC3qEtnP/jseqzvr42E66EI43uaxr54tWhckypVzxR8FV0BaDZAG7KH6eDEGHxkj3siPpRa33E/EQKFxvwgeyeGY/ILwFmBWGX5WjcMT8WciG2n3QNCdhu7t8XfRKttw4/xktNlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(478600001)(7696005)(40460700003)(86362001)(83380400001)(33656002)(55016003)(40480700001)(81166007)(356005)(82740400003)(47076005)(336012)(36860700001)(2906002)(26005)(316002)(110136005)(6506007)(54906003)(9686003)(186003)(5660300002)(82310400005)(107886003)(8936002)(52536014)(41300700001)(8676002)(4326008)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 06:55:19.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2fe3dd-53db-4226-d4a0-08db3b22e11e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8381

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 3/3] xen/arm: vpl011: Do not try to handle TX FIFO status
> when backend in Xen
>=20
> From vpl011_rx_char_xen(), we call vpl011_data_avail() that handles both
> RX and TX state. Because we are passing 0 as out_fifo_level and
> SBSA_UART_FIFO_SIZE as out_size, we end up calling a function
> vpl011_update_tx_fifo_status() which performs TXI bit handling
> depending on the FIFO trigger level. This does not make sense when backen=
d
> is in Xen, as we maintain a single TX state where data can always be
> written and as such there is no TX FIFO handling. Furthermore, this
> function assumes that the backend is in domain by making use of struct
> xencons_interface unconditionally. Fix it by calling this function only
> when backend is in domain. Also add an assert for sanity.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I've tested the patch by manually running the XTP on FVP_Base, and this
patch works fine. So:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

