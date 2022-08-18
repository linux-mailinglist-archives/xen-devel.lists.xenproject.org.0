Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61AE598407
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 15:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389547.626537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfVq-0003ia-FJ; Thu, 18 Aug 2022 13:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389547.626537; Thu, 18 Aug 2022 13:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOfVq-0003f7-CR; Thu, 18 Aug 2022 13:24:42 +0000
Received: by outflank-mailman (input) for mailman id 389547;
 Thu, 18 Aug 2022 13:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLbC=YW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOfVo-0003f1-VR
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 13:24:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1beaecc9-1ef9-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 15:24:38 +0200 (CEST)
Received: from FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::7) by
 AM6PR08MB5157.eurprd08.prod.outlook.com (2603:10a6:20b:e8::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Thu, 18 Aug 2022 13:24:36 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::96) by FR3P281CA0125.outlook.office365.com
 (2603:10a6:d10:94::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15 via Frontend
 Transport; Thu, 18 Aug 2022 13:24:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 13:24:35 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 18 Aug 2022 13:24:35 +0000
Received: from cc4c2f2a695a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C21D5247-EB6A-4911-A850-27ECE78A5156.1; 
 Thu, 18 Aug 2022 13:24:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc4c2f2a695a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 13:24:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 13:24:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 13:24:26 +0000
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
X-Inumbo-ID: 1beaecc9-1ef9-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=l1bzqxIN7c0HiAR05ijTChSOawEG678i0gfEEDcnjDayqya4eemxqcJs33mWqnhw6S887MfBffZLjOYl+oSmkh2HbU+ysnYuA+6Fp887V6Eh4Ts5scYlproriUk4ksCXQ7AnrYmVJ0t5ushlGWrhle5lSHqWlEwH6VQqrq2pvaQ+Z7gQOURg1GJt+NWtzIV2mUmsIKfykgn4gYo2s0LmguOGSZm2WLh6li8H3eNC37AdvsB1VR2jG1ix6IpFtLoAqAMGS9knnZg0a3nG4bBMWWjIQIvao1asXD3TQ4quyBMOnqmqvMdEt0bln5a2r//87BWAzkTjGvqK8j/XVLAFrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEsdoTEncAOGFBz4FcYUSTCExsceFCuBX+FI2byXY6M=;
 b=OtMEkjAafA5KOPtXHciNHyZ6enhirctW1veyfey7wpc6EPtNVP9MRpGsuNt9HGAAO+2Gi1XlyW1T07k0pJaT+O+yI0jRZElqk1WPC9Dm8pNNl83kvUh9RHM+HpWbVo7Ms/hynQEgahRXAEnfbWESpG0PpxdcgwbY9T6WsKepocgZj3LoLeiK7BO/V+r7EOgnbNaE2KtZRVmmIB8UgMGqkL9J+eKKZEZpXN6Y8x1b6WAy03JwxGttcwx/1txCx9sDGfyiVaMpfrt9SnMCYH80XcByLw83fukeZZnSTJ5linXp60R+Mrxi+290kbY0lfH8BdSu2Ex86kQ0DR3fxi8c5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEsdoTEncAOGFBz4FcYUSTCExsceFCuBX+FI2byXY6M=;
 b=n8yFKMwnGbqPbdFmSNTXqC9DvcsfAmkuIUJmXh9fDfrS9oaZqk3rlEoxxypz/aBR+CSGu5I2LXxyVUv/IZjvi5knawBSzL7HJB3UczEPDXDqH/bj7WFWKxX0RkeUkPNTQAnYAEp1R1VgMirexbnN53vHzz/rOAw+6b3SVHjps0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d06c9dfa99295b4e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktjBAqKpKG1GNvU0D7I/yY5Kt69jcbctYGm9MIRZP4pZ5UMpPMgRwA90gHYuypOX/tPAFD76pFMzZey2hBACGOVFFf7atP4ILJj0TTrKHWCqZJ378mwryNZboxa9B/O9TBob+sCaRHQc4uyF2qhIAsH2E6iT5RgjYsZU/p8WXfzUk8uUe/XlAFdAwDtx6z4nj2V4bc9oLLi9J9ZgV/wyIkfMMSyVkhinx7YrNrP9CgZpDHWwQamhBI2GceTXNEoU0gxYwUcWo7/0q+L2c7AzWV4M+VgFUzMbWQ+ROUjA0ugGvdUchORweYkTuf7e9gQBZ8Cl+8k6JK0zw2rirnVojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEsdoTEncAOGFBz4FcYUSTCExsceFCuBX+FI2byXY6M=;
 b=LP4hannC/HZkZow8UJQu/dP4fF6POhf/wQRPraOiB0VtDmHSCs+7XmowRhcyF9RFdO2dPIHv9UhxZYoKjOV+wu/I88uMRP2K6winACV7i/sLvbBQsvYt5Wsle9jARzktuQXI9DvyPlVQvrP1dcyjWF7oj+SfTR6Qjr2S01sjg0YdgnRNIuLcGjRB4QG7M/l02qFnLnuN0uNafqRIMfhPtRcFbRucUHpQPRwqDdsd52hSE8z3Wdy5xSEtSHV8MM5PteXmVJIN7/QX9sd8Gdga2C002DpmOi42Jh4DmsOHMU/9orsqJnlJVcg3bb1FjWo6hI7PU9mvrlB6zprjZbczgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEsdoTEncAOGFBz4FcYUSTCExsceFCuBX+FI2byXY6M=;
 b=n8yFKMwnGbqPbdFmSNTXqC9DvcsfAmkuIUJmXh9fDfrS9oaZqk3rlEoxxypz/aBR+CSGu5I2LXxyVUv/IZjvi5knawBSzL7HJB3UczEPDXDqH/bj7WFWKxX0RkeUkPNTQAnYAEp1R1VgMirexbnN53vHzz/rOAw+6b3SVHjps0g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, Jan Beulich
	<jbeulich@suse.com>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin
	<peter.griffin@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Thread-Topic: [PATCH] xen/arm: acpi: Support memory reserve configuration
 table
Thread-Index: AQHYsigvymQYV/In6UeZ0JR6afFs5q2zEzOAgAEyTYCAAAZ4AIAAW2OA
Date: Thu, 18 Aug 2022 13:24:26 +0000
Message-ID: <8C515123-62CC-4D4C-B98E-8EEEE42C9EAD@arm.com>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
 <5afa9c15-d7c5-2fb7-ed14-bd8839c4d42d@xen.org>
In-Reply-To: <5afa9c15-d7c5-2fb7-ed14-bd8839c4d42d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1d455fd2-05cd-4aaf-fd71-08da811cfe96
x-ms-traffictypediagnostic:
	AS8PR08MB5910:EE_|VE1EUR03FT006:EE_|AM6PR08MB5157:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 30FJ/jB5ddnmi+3ie4T/d4sxKXSuFLt/J2CZc3MdCZPEYixQlXKZXP7QGy7WG8Wb2NbsbWiA1kDTg8b0gpnACE8gJxjRjN6sV99HijS3cTkBgMd/DhrUnZjzBgkKgDi+qSgcMZJEsNgLU1TlNwUKZrBTQ69Y99GXcPQ8NQ+6GcIcL7hwWF0EBIkb1TQT8Xjsdd85pqCpKCyWKzzd4+dfIvxYIYt1EyIRqNcuMuygLoE84xI6jqdrKePcMEBKtLD4wlim8999bzhUpAtn6+GrprqU9WuZqSgXxOWgeMiwIraBXyiv2tm04PQ4Oq9VseOghh9IOyt/iqdcdkGlarRebgv1TkIGiImriyaq17kEfjSbR6tX0NlZmkPPXsAIkXaSfT7mpb98FeWtcvJvYo8gTObW4TkQ3s2LTeU8qea+hhUg5WHzNlR3MWaKUSzlrvV54S45NGiBKlIfnw+sKwJSjdNzEKjrqlsBpkaNutFYEOA2yYy+H8vXw8D77iABiTvLQ0JnlxljFJyQ16VMTjwYYYVTIUD3uza/gVdwyYh8wbGD2a8fj1RPfJ6rxotSV7eizRa5kPTQtCPOH5yal+l0CZuLqrdWNYfvO1eMY3ZWuojAUn3pvUlWD/ods97Bm7BUvQUOcdQzHgW+wf4tDFYxRJcqIN94WfDwjs3irMIsDt73gcIzbuyqCZuHWZEokhPqrDpT02UjqJ2k9rtoZ7yJWUPUzuwageRng//FvLh4DtBMJv8iCwVivTiSBN1r0Jeg0BWPaX0foXXXyWaA5xD8P2LxerwjGShxH+2ElKI2EEI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(8936002)(76116006)(66946007)(2906002)(33656002)(5660300002)(4326008)(66556008)(66446008)(8676002)(64756008)(66476007)(38100700002)(91956017)(6916009)(86362001)(122000001)(316002)(36756003)(54906003)(38070700005)(478600001)(71200400001)(6486002)(41300700001)(83380400001)(26005)(53546011)(6512007)(186003)(2616005)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C315AD60B674F46B1D5402A613C3D62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fb8040e-fbbe-4658-2a4a-08da811cf8f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZU7k3JmEDneNngSOkOb5KLVSB8nQI3cL06pWkJmbgMkzx80vd31DZXahGShQjtGH6OCAapcMZMKuFGUAjbysLS+22MMkqT6L7b8ybR/06sF3j9JjUrYKBz1efu9wvFGiDURA0AydUA1mXsLqCuml47t+onImjnDAi1aKAXu9bUjUexYzNc4RQ+IueJH3zaji2oQCJEM0OsNIZ9w4xye3V+3kdwjn1+GFVbRfRBa9dNnixpKlM2A79XSGehZnh8n6Zd0SgF2aQquU7dEICpOMpvqy73VPNRQqOMdWp+5+spI6M/a+S4TtKACw/EBVZQfAU7KeGUGchMdQEyrTgzufbPECqOZE+2656logX3OlkRRRt4Ro6xJ0hVB5VGRJElalPmeVluU3VfVkt+f+TvMj2PDuLFXvwKu3VKFxR7DYoKXqzaGCAgRSuZgdluAz7I+WweEJIBiJKpfCTUI5NlBNyu8jzWWut/H3YvC5/t8mcJdeZHGi8OZTlz70kGzRov6G1epJEzvXaYIJNL6ul0Xx7PmOiCDnJEUOdMj54TeJJYwy4FPJjPZMyvV4p07/SDel+w29VCixKiIqBeeVG/6zI62GeWimM6NQkhIfPELpvxB8T1X0i4nyssO+KLbTw3zOBha4IdFm9ve7yqT5QAatUocUvPFv9BvrFkynpk/iinncX30zQI01WY96sMfk+v8C7jOTkagOy4AINCoj5jIwnShinp718lhto0066yUarwiSoDUn1wZtW5uctpuQJC3BZOENBWhd90Cx5c0qzh+sug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(356005)(81166007)(40480700001)(316002)(186003)(36756003)(54906003)(36860700001)(83380400001)(82740400003)(82310400005)(2616005)(6506007)(70586007)(70206006)(53546011)(4326008)(8676002)(33656002)(2906002)(47076005)(6486002)(336012)(86362001)(6512007)(26005)(107886003)(41300700001)(40460700003)(478600001)(8936002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:24:35.4847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d455fd2-05cd-4aaf-fd71-08da811cfe96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5157

Hi Julien,

> On 18 Aug 2022, at 08:57, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Leo,
>=20
> On 18/08/2022 08:34, Leo Yan wrote:
>> On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:
>>> Furthermore - what if Linux decided to change their structure? Or
>>> is there a guarantee that they won't? Generally such structures
>>> belong in the public interface, guaranteeing forward compatibility
>>> even if Linux decided to change / extend theirs (at which point
>>> consuming code there would need to do translation, but maybe using
>>> a Xen-defined struct [plus translation in Linux] right away would
>>> be best).
>> I saw Ard has helped to answer this question in his email.  As Ard
>> said, the general way is to rely on Linux EFI stub to allocate the
>> data structure for MEMRESERVE configuration table.
>> Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
>> short term I don't think Xen can support Linux EFI stub,
>=20
> I agree that using Linux EFI stub will require more effort. I would also =
need to go through the mailing list archives (or maybe Stefano remember?) t=
o understand why we decided against using the EFI stub.

I think the problem was that EFI also includes some functions and to have a=
 proper EFI stub we would need to support those (console, mapping, disk acc=
ess).
Maybe this is something we could discuss but that would require to have som=
e kind of binary providing those services that we put in EL1 or at least a =
stub calling Xen for those functions.
One other solution of course is to run uboot and boot linux from this.

>=20
>> so we need to
>> maintain this structure in Xen as well.
>=20
> I have looked at the commit message. IIUC, if this table is not created t=
hen Kexec will not work. Is there anything else that would not work?
>=20
> IOW, would Linux be unusable if we don't create MEMRESERVE?

No it works perfectly fine.
There are some warnings and as pointed out later kexec is not useable (but =
is not supported anyway).

>=20
>> This structure eventually will not change frequently, so I assume
>> later we will have little effort for maintainence it
> The problem is not really "maintainance" here. It is more that if Linux i=
s updating the structure in a non-backward compatible way, then new
> version of Linux would not boot on older Xen.
>=20
> We would have similar probable with new Xen booting older Xen because the=
 hypervisor doesn't know (and should not need to know) which OS is used.
>=20
> In the nutshells, Xen should only use stable interface. If MEMRESERVE is =
really necessary then we should either switch to the Linux EFI stub or stan=
dardize MEMRESERVE.

As we do support kexec on arm right now I think the current status should b=
e kept.
Those questions would need answering if we support kexec one day.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


