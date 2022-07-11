Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA756FABE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 11:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364964.594958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oApbE-0002Gs-NE; Mon, 11 Jul 2022 09:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364964.594958; Mon, 11 Jul 2022 09:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oApbE-0002Ey-K8; Mon, 11 Jul 2022 09:21:04 +0000
Received: by outflank-mailman (input) for mailman id 364964;
 Mon, 11 Jul 2022 09:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oApbC-0002Es-8V
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 09:21:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6205fca-00fa-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 11:20:58 +0200 (CEST)
Received: from AM6P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::37)
 by VI1PR08MB4272.eurprd08.prod.outlook.com (2603:10a6:803:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 09:20:56 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::39) by AM6P191CA0060.outlook.office365.com
 (2603:10a6:209:7f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Mon, 11 Jul 2022 09:20:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 09:20:55 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Mon, 11 Jul 2022 09:20:55 +0000
Received: from 1420e168e85f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34AB0E42-F08F-4D82-97D5-C5C98CA0213C.1; 
 Mon, 11 Jul 2022 09:20:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1420e168e85f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 09:20:48 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by VE1PR08MB5870.eurprd08.prod.outlook.com (2603:10a6:800:1a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Mon, 11 Jul
 2022 09:20:46 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 09:20:46 +0000
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
X-Inumbo-ID: c6205fca-00fa-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Eo3AD1hSWKynx0vwKtHX+H9mEnWyQBzMpMlQj1t0aePb1zDvqwvPoUQe/i6291GyZkF3qC7zjeZQlEA9kuHcVIhuli7S16aXHQnZZeleZG7Qh75r/5jDcpkE9pnGMZWDVyTc+gmooxtrTHvBUeVKgaB1dz+UGWFEwVVVgs8CHdib/w/9P41yi3W57ya9xt5+kzyKowqxAGPKbM0nkfV0OfdJ+np5lkCgmM8pYRDZex807KCmYE2oB+W+1fCIrReWD5SEYUn9zykHqKmQyy+UicKjuGUKEfwN3MuilVH89fOwkofZ7TO2HvwhQTPmWjX1VaMk49393S9OIbAjKb16Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FODdx/1HmDE7I6VeO3mvOhyvv5jnWK6h02+qYQ6RbC0=;
 b=eRf3nXjdJbihXm17E/OEePmX7HDRajNR+1Otwq1h5xXrDWa5ZpAupmVUkRpt6BvO/lj2xloy436AAhpGPHzlBsknoL9z5eMOyqkDsr2WTq+PGm3ElD2JvbdPIYHkcgSrfRXuabmWSy/WTMxPOEb7R1TgzjRAhJlbdL3IWEIRWKJEKFv5HWLBU4MjdnAdz/qoQPFVB9QVLDNXV7C6b5uD5GlMCClypskQSYu+KWGqJn5bCKk5K9Gs5csz7HoAbCxjt5ZPmpDVGmiIJHt3uiiaz1y/hlhgh7kb/jnPAvQnZDQCd9Jxx04j9/f1NlgvUTjbP+Mdim2fTuwwmFSxtKHl2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FODdx/1HmDE7I6VeO3mvOhyvv5jnWK6h02+qYQ6RbC0=;
 b=0heX+/OJWx9A9rCabmZURDr2jNifeXewwhxQlwfGKXCtRAtcD8XTKBcA5SDJDaMsCN5d/lfYPH2A6ykCrtBdMYRGUCcIOdqrxUqN4aBD98occTpMpgoEqi235qLs2RnNmmomqThHXoHyWwtMQFQ08TPxCHrfF8f3ezzM+0LnPyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 903d2891e31b90c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kucPb3IjY34K6uHZ6TjM9nlKrThfEKF4B8VwqpFViCWmsbyZXjEj/q5ADaT4DuC5Mny6id942nJnFHCOEdQUQWMC6F2FkgV6rOz8v4bJnhbni5mmGaTWr1cJNVkmPddlJMiPaWGsXRoSxCLO5xtaQvruAMBDeVhDtQbv7h1CIW9JSpoN9/wqA9OacTbjc7MSfdDCTSJoq5qVhM4ZaBr9sZpLv+yro/3fXy4+f6xox9WCmpCyQch4EWrXXwkwJ6HWmqht/WiFM6cGOi8IOaBi0PNkMXrurd4u/rZjN/Q01BGrNUB46KPqkv6Uh4Gz15iHpa6lNWQrCcYvPjdh71qqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FODdx/1HmDE7I6VeO3mvOhyvv5jnWK6h02+qYQ6RbC0=;
 b=IL3GAOAyWWWyMZE80+WkLJD+vpxMUw8E+MKBjyLaqO5bb1iAo1cKjlwgkzL5xcRtx78llOM6dLl1IVhZRsGKcD2vD6EySa7CHTOTRW/ALx4ec4WPN6hHe1a8sdRh3rqOdetJAbz9STC+Qbdc3M+PM6NrOaCBICLvzar38azP/r6ij891Qz2wyL/ClokHN0lH/lmcznX4lVkXo9Yj199HyJqsTeGHwiQFfJtiH/4HdfSTEhonQxwWUlTH1mKqD5m6HL3IlJoWTb6jZDHedFJlmItA+tAaPzxMsNYeX8lYkxoedrffMDk20Me3OteSJSzLIJB1UjpnzNxhEtlMuMpRYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FODdx/1HmDE7I6VeO3mvOhyvv5jnWK6h02+qYQ6RbC0=;
 b=0heX+/OJWx9A9rCabmZURDr2jNifeXewwhxQlwfGKXCtRAtcD8XTKBcA5SDJDaMsCN5d/lfYPH2A6ykCrtBdMYRGUCcIOdqrxUqN4aBD98occTpMpgoEqi235qLs2RnNmmomqThHXoHyWwtMQFQ08TPxCHrfF8f3ezzM+0LnPyc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v9] Preserve the EFI System Resource Table for dom0
Thread-Topic: [PATCH v9] Preserve the EFI System Resource Table for dom0
Thread-Index: AQHYkxKUjUJb6n+aY0G11gulhs4gPq146NqA
Date: Mon, 11 Jul 2022 09:20:46 +0000
Message-ID: <B8EF0CAD-7A85-496F-A083-957632414B2E@arm.com>
References: <20220708213403.2390-1-demi@invisiblethingslab.com>
In-Reply-To: <20220708213403.2390-1-demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8cb3c0ff-13e2-4c73-e6a0-08da631ea8b0
x-ms-traffictypediagnostic:
	VE1PR08MB5870:EE_|AM5EUR03FT055:EE_|VI1PR08MB4272:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x/q4OnD0VXF8l5VtocHTrs6u0wORb7oynhyUpjtoNfQ4B/JbLkZPNIdRmwte8x5BjuictZgYy7rYdbiQqqvAF1u2Cg/EsSaCpD1TaRy8Xvxi3YjPnvdCWYfx+qITN5myDaRE40QBKwf2CHpF4lZ/J8X1TmOtZgSO/7JrDPxcJgkC1Z9dFP5sndYx0mg/AW8pmmB+qGIghvqVV8FMIhHIAoL6Uo6EysZ1T5LYRH9dBW7Cq+WMeo2eI425zWjiqj84MQ+cS/9G4FRNn+Jdrds6zslRl19X/X5ySzVfKLjzOEDSKKk35e0/Lkp2fNnuUe8Yd+HmXeSQLKbdRV16wrJEZGBoKtNkQ2D3oZF6O1AZM+a84IoAmCj1Hl9wXj1RZrWTu+x1lZGZmxaU6MEEWaIsJOnG+obQaYdMbvEKGO+D6zZqg6HspmhyvRiCayaEWdf+avALJW6GEI7vOF/dbUNDxQ5zXi8lucyFXtGlIozFj/pGwTwAOA+zhFJP1OGt3XV6ROBKZukvpXoIbXx5lrO9SUD0/J9V3agO48vgmJeBVeNZbaz/Tr1EtYhNq7YJ2+3VlY/WeNMPQrGzPMuBWGeItTv2zZPH0YR9rQY+HC/Qj8rSXBjTsE3GkavAjbLkkpdSnvceYErvHeqMUmhtWjWLshlEwmhI+j4vKQAWfZ19M2DsBsbJLDNA4XkU9GtTILHWrNcZVqIHSQFoTcz1j4FtVmn/G4Q65jdk3rBQwsYcsrsSP3gCjfh4A2UvhkACM53ViR8plhufKiB9VJpYNbFzdst4jvVh/CMZcmTQkwLlTKFZoNHxCTcclFIDYBL5Hui2JJQu/hZiivv43KmzYt2mEytpLuFHGR2iQh2t1mh+dJGZZCXxMZYEUBiymNjQ29pG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(54906003)(6916009)(6506007)(53546011)(966005)(316002)(6486002)(5660300002)(2906002)(36756003)(38070700005)(91956017)(478600001)(41300700001)(6512007)(26005)(33656002)(71200400001)(122000001)(76116006)(2616005)(4326008)(66556008)(83380400001)(66946007)(8676002)(66476007)(64756008)(66446008)(86362001)(8936002)(38100700002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB334CD25306F9439820B12BE1652B8D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5870
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3d3dca1-60ec-4db4-9267-08da631ea31d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xKdGVWDOggwZkE1awbiOs1vRiWYImD1cQKlbAg2VIV8jatbwGo1ZC7QTUFqNRS6YDNW4sxTgottdpBOQbIBuLQmwYKNBsCsrhEr/EpVZFwHWapECL/kxflOWThThND3qBYa4MYZ75992NyHH2e9PaddO8RUn8MIvFcqcMOlan1VsBvypGfBj24CNqnVQCFRirUsv0hBb3naqagca9rH06I3TZyhUXHY+OMD/4u3DNdIW0XSJq7jnwvd8hwFcb+ODBgdgyRflDZ8qUjPHAg5ApgIQ7gNLJu1d6Pp0ROSL3NFKmayEa2S4PK6d7+t2g8fQ/wjvgK+qblGbH2ksKaoimayupqWf+2RRc/8NqJIlLx+UaScVy7k2HTyDRG5NYcKwlaIC9hC4hU5KLEmTcU5AmKkLkygioh0BPqRhF5HpF7/DOlzd3b6aOKb/bKiloXUMmwNdPfevXLCX0oVqZQ4DPBX1wNpAnHX+yoVo8ydoeR8/3jBaUgoQuEdZRc9sPiFop6n0CkAMFcf2/ZE3GzgVKRqp4CYD84UX5fPAc83hg88a2pM39q7UiScnityXMsPmn9FymfNa3AiUrp/3e9I75K8swxohjorge1HQmMhRRkczbTjrWlsxh00MFgpaOzvTPz4YrxYwq7jqXWgtMMtfbMHPSERnxaSIX/ad0RJMmYavlZr8BlcBZK8QqvOscYHj5W942Q8vZmXYdtHTN9HLTDpqKhajeRKQ9bArSd/4ICE7Fc3iQsG5wKZm3a4R+IUYXQ2QDwn1ZnvZTn37N9XNwCdoZvEZNiaeqJrqu/1nYhsjGbZpTHjQtiasv0u/ouOTFyr/fTg+DxuqF9c6XGmLGRbbcLbDVtGktCChSCi3tZY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(478600001)(47076005)(83380400001)(40460700003)(54906003)(86362001)(82740400003)(336012)(107886003)(81166007)(356005)(2616005)(6486002)(966005)(6506007)(41300700001)(82310400005)(53546011)(26005)(4326008)(33656002)(36860700001)(40480700001)(70206006)(8676002)(70586007)(8936002)(316002)(6862004)(36756003)(5660300002)(186003)(6512007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 09:20:55.6055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb3c0ff-13e2-4c73-e6a0-08da631ea8b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4272

DQoNCj4gT24gOCBKdWwgMjAyMiwgYXQgMjI6MzQsIERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBp
bnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBFRkkgU3lzdGVtIFJlc291
cmNlIFRhYmxlIChFU1JUKSBpcyBuZWNlc3NhcnkgZm9yIGZ3dXBkIHRvIGlkZW50aWZ5DQo+IGZp
cm13YXJlIHVwZGF0ZXMgdG8gaW5zdGFsbC4gIEFjY29yZGluZyB0byB0aGUgVUVGSSBzcGVjaWZp
Y2F0aW9uIMKnMjMuNCwNCj4gdGhlIEVTUlQgc2hhbGwgYmUgc3RvcmVkIGluIG1lbW9yeSBvZiB0
eXBlIEVmaUJvb3RTZXJ2aWNlc0RhdGEuICBIb3dldmVyLA0KPiBtZW1vcnkgb2YgdHlwZSBFZmlC
b290U2VydmljZXNEYXRhIGlzIGNvbnNpZGVyZWQgZ2VuZXJhbC1wdXJwb3NlIG1lbW9yeQ0KPiBi
eSBYZW4sIHNvIHRoZSBFU1JUIG5lZWRzIHRvIGJlIG1vdmVkIHNvbWV3aGVyZSB3aGVyZSBYZW4g
d2lsbCBub3QNCj4gb3ZlcndyaXRlIGl0LiAgQ29weSB0aGUgRVNSVCB0byBtZW1vcnkgb2YgdHlw
ZSBFZmlSdW50aW1lU2VydmljZXNEYXRhLA0KPiB3aGljaCBYZW4gd2lsbCBub3QgcmV1c2UuICBk
b20wIGNhbiB1c2UgdGhlIEVTUlQgaWYgKGFuZCBvbmx5IGlmKSBpdCBpcw0KPiBpbiBtZW1vcnkg
b2YgdHlwZSBFZmlSdW50aW1lU2VydmljZXNEYXRhLg0KPiANCj4gRWFybGllciB2ZXJzaW9ucyBv
ZiB0aGlzIHBhdGNoIHJlc2VydmVkIHRoZSBtZW1vcnkgaW4gd2hpY2ggdGhlIEVTUlQgd2FzDQo+
IGxvY2F0ZWQuICBUaGlzIGNyZWF0ZWQgYXdrd2FyZCBhbGlnbm1lbnQgcHJvYmxlbXMsIGFuZCBy
ZXF1aXJlZCBlaXRoZXINCj4gc3BsaXR0aW5nIHRoZSBFODIwIHRhYmxlIG9yIHdhc3RpbmcgbWVt
b3J5LiAgSXQgYWxzbyB3b3VsZCBoYXZlIHJlcXVpcmVkDQo+IGEgbmV3IHBsYXRmb3JtIG9wIGZv
ciBkb20wIHRvIHVzZSB0byBpbmRpY2F0ZSBpZiB0aGUgRVNSVCBpcyByZXNlcnZlZC4NCj4gQnkg
Y29weWluZyB0aGUgRVNSVCBpbnRvIEVmaVJ1bnRpbWVTZXJ2aWNlc0RhdGEgbWVtb3J5LCB0aGUg
RTgyMCB0YWJsZQ0KPiBkb2VzIG5vdCBuZWVkIHRvIGJlIG1vZGlmaWVkLCBhbmQgZG9tMCBjYW4g
anVzdCBjaGVjayB0aGUgdHlwZSBvZiB0aGUNCj4gbWVtb3J5IHJlZ2lvbiBjb250YWluaW5nIHRo
ZSBFU1JULiAgVGhlIGNvcHkgaXMgb25seSBkb25lIGlmIHRoZSBFU1JUIGlzDQo+IG5vdCBhbHJl
YWR5IGluIEVmaVJ1bnRpbWVTZXJ2aWNlc0RhdGEgbWVtb3J5LCBhdm9pZGluZyBtZW1vcnkgbGVh
a3Mgb24NCj4gcmVwZWF0ZWQga2V4ZWMuDQoNCkhpLA0KDQo+IA0KPiBTZWUgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjAwODE4MTg0MDE4LkdOMTY3OUBtYWlsLWl0bC9ULw0K
PiBmb3IgZGV0YWlscy4gIFRlc3RlZCB1c2luZyBxZW11LXN5c3RlbS14ODZfNjQgYW5kIHhlbi5l
ZmkuDQoNCk5vdCBzdXJlIGlmIOKAnFRlc3RlZCB1c2luZyBxZW11LXN5c3RlbS14ODZfNjQgYW5k
IHhlbi5lZmku4oCdIHNob3VsZCBiZSBhZGRlZA0KaW4gYSBzZWN0aW9uIGxpa2UgdGhpcyB1bmRl
ciB5b3VyIFMtby1iOg0KDQotLS0NClRlc3RlZCB1c2luZyBxZW11LXN5c3RlbS14ODZfNjQgYW5k
IHhlbi5lZmkuDQotLS0NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGVtaSBNYXJpZSBPYmVub3Vy
IDxkZW1pQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQoNCknigJl2ZSB0ZXN0ZWQgVUVGSSBib290
IG9uIGFuIGFybTY0IG1hY2hpbmUgYW5kIFhlbitEb20wK0FDUEkgYm9vdHMgZmluZS4NCg0KU28g
aWYgaW4gdjEwIHlvdSBkb27igJl0IGNoYW5nZSBhbnl0aGluZyBhcGFydCBmcm9tIHRoZSBzdHls
ZSBpc3N1ZXMgbWVudGlvbmVkDQpieSBKYW4sIHlvdSBjYW4ga2VlcCBteSB0ZXN0ZWQtYnk6DQoN
ClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQo+IA0K
PiArc3RhdGljIHZvaWQgX19pbml0IGVmaV9yZWxvY2F0ZV9lc3J0KEVGSV9TWVNURU1fVEFCTEUg
KlN5c3RlbVRhYmxlKQ0KPiArew0KPiArICAgIEVGSV9TVEFUVVMgc3RhdHVzOw0KPiArICAgIFVJ
TlROIGluZm9fc2l6ZSA9IDAsIG1hcF9rZXksIG1kZXNjX3NpemU7DQo+ICsgICAgdm9pZCAqbWVt
b3J5X21hcCA9IE5VTEw7DQo+ICsgICAgVUlOVDMyIHZlcjsNCj4gKyAgICB1bnNpZ25lZCBpbnQg
aTsNCj4gKw0KPiArICAgIGZvciAoIDsgOyApIHsNCg0KSGVyZSwgY29kaW5nIHN0eWxlIHdhbnRz
IHRoZSBicmFja2V0cyBvbiBhIG5ldyBsaW5lIChKYW4gY29tbWVudCk6DQoNCmZvciAoIDsgOyAp
DQp7DQoNCg0KPiArICAgICAgICBzdGF0dXMgPSBlZmlfYnMtPkdldE1lbW9yeU1hcCgmaW5mb19z
aXplLCBtZW1vcnlfbWFwLCAmbWFwX2tleSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJm1kZXNjX3NpemUsICZ2ZXIpOw0KPiANCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

