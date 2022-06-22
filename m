Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D490554F01
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354165.581218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42Av-0003yq-72; Wed, 22 Jun 2022 15:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354165.581218; Wed, 22 Jun 2022 15:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42Av-0003vQ-3M; Wed, 22 Jun 2022 15:21:49 +0000
Received: by outflank-mailman (input) for mailman id 354165;
 Wed, 22 Jun 2022 15:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o42At-0003FD-Na
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:21:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50082.outbound.protection.outlook.com [40.107.5.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07ca1e5e-f23f-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 17:21:47 +0200 (CEST)
Received: from DU2PR04CA0353.eurprd04.prod.outlook.com (2603:10a6:10:2b4::13)
 by PR2PR08MB4908.eurprd08.prod.outlook.com (2603:10a6:101:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 15:21:44 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::d) by DU2PR04CA0353.outlook.office365.com
 (2603:10a6:10:2b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 15:21:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 15:21:43 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Wed, 22 Jun 2022 15:21:43 +0000
Received: from a73f32a2332f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F495646-A82F-4499-94F0-B91C49D91E0F.1; 
 Wed, 22 Jun 2022 15:21:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a73f32a2332f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 15:21:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6813.eurprd08.prod.outlook.com (2603:10a6:102:15f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 22 Jun
 2022 15:21:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:21:36 +0000
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
X-Inumbo-ID: 07ca1e5e-f23f-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GwYvtfwx8s1mS3OSFwFB/7hcHpOMsTwLHNFlgoboWVkUkvE7koXclo7kyAmmvou3HBQGY9bo1Oxn/BCmgZSaEnbAYu/YSkAKUhp50Wm9gejJ3His/eoMBSG8MZGxuJKcAUyPwOrcYTt/E7T9H2JNZAQtseEJ1X65osdhZr4dbOuHI+pjVlILqcZpQc6CBiaALSmT7sGrEMa+7hgOIIuCS3rZ/sfr3v8EcWn5TiPb7bwrmvUpDw3WYNDfKqL9Ur09eA+FCIy42UOw8htdypQ1caSZZZGHL3yeWGwmgUj48vBxGzY5NinaGJnZHdqRrLvfs/XKnWNVHBQUMxTUvcLV+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6f/osCnMMDoF/xXxvUEBQIfwtEhSDGWQtqTReoF29Y=;
 b=daU6oVrGQr+91L12q54G7V4lNpfYOyNzYPiYQ/2l8PldPIfDo1tLjZ/rGCfcQ8WoIx0ebSw4IfXmeZo2KSyoFmFJ8eCGQZOSVa6L6fxPdzf80dFlidRlS9P1ivhHLmXvYzVILjO5zmo0mKI2npyZFnYSOSilhggmHC63YgSRTc/Cn1D66Bxf9IoGO/KDY40M4AwOvK1yGAyT9njDW/AetmZZ3a/4VWbCjMwQzvjNLQQguqQy3p5dqW9RvnhNrtznNsywASqhJVfp5zUqIAkO+2qcjoc+q5/e3nVu8GrusefGVS7g9m2k9rhnmi2y0tynsoN7UfS1NP/VZnq1IkNJ0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6f/osCnMMDoF/xXxvUEBQIfwtEhSDGWQtqTReoF29Y=;
 b=i06cxzYZw0/z52CFP1UvYPRWWk4UT5pl7l2MJ9lDGwziKaBhavqEc/w7YiY+8YUa2EQ5Pc+4QNal1eM7i/e1l6aoEKKVZivH18bXSR77/7z4R4rFlMhfhJSLvaFxsO1knYpLs3+wefPSohwJc/mGMMN4jr+uhcofuDUblUOFL5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78f9555be067c37b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqpbFbnLwqm6VllR17JbHbq3CRKsDeepNlHmmw+e/vjaQY7dJFbXPgZMj+lI+8hokary/nOKpTv97qNnQirxKu9fSGGDRJO5wTEnGAdhxC6K42WJrqWY/2orziKi64Y8ec5KRbnjzG9E35JNuPoOMCfpfWaxTOxApRgcp9qTw6k8pZYxbS31Fh0vzAitOEZ0Mu9Hl7TiFi+uDSqnqa5qKFyT/A33NaWOppg00H2qPZ0FvKgzW18/2Y/TPb3wsWgpmdUPEXIjvKaFbUNxk4jkOl/thDo92pPkuBqu8d7b+WRMg9RmmlPMEYKb8pIMQCvrtEtp3DoDOWbNMt3h8cbiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6f/osCnMMDoF/xXxvUEBQIfwtEhSDGWQtqTReoF29Y=;
 b=eMAKpjkEKAn1jOhQ0npJUaMHNUO7Ac4kmX1PahUGH3jgOeNzsXAzvo4brQTXqX6h1z/fvYW5S7p/atuZ5PYlU+EOU5+Srz9aqEDTtvzNjEqBVPFNqUbp/dcQHHpb5Vev4jRZRo8VPgu1vx2OX23Sa89p5Q6z1+PSxANdgiHQd3NHhr73N8Nn5wojSa1IjbeG1rMJTPN1xQjd5ZJO0JuEjKwmleK67nYf3kkvSfFRNGNcJNdfrwdVqw7JhTl1bWifDHsy1ok3TnhltAT4oOyDf8FnxWhwqd/bxxcFtdNW21c5y+meTfG4dYLL6N3MWoKXwwC/6CH58PvC25Yki94qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6f/osCnMMDoF/xXxvUEBQIfwtEhSDGWQtqTReoF29Y=;
 b=i06cxzYZw0/z52CFP1UvYPRWWk4UT5pl7l2MJ9lDGwziKaBhavqEc/w7YiY+8YUa2EQ5Pc+4QNal1eM7i/e1l6aoEKKVZivH18bXSR77/7z4R4rFlMhfhJSLvaFxsO1knYpLs3+wefPSohwJc/mGMMN4jr+uhcofuDUblUOFL5M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] xen/common: gunzip: Fix MISRA C 2012 Rule 8.4
 violation
Thread-Topic: [PATCH 3/3] xen/common: gunzip: Fix MISRA C 2012 Rule 8.4
 violation
Thread-Index: AQHYhkr4CzBVsyJHpUKOeXKFemajka1bivAA
Date: Wed, 22 Jun 2022 15:21:36 +0000
Message-ID: <D8CBC78E-709E-4C04-AF8A-5789719BADDF@arm.com>
References: <20220622151514.545850-1-burzalodowa@gmail.com>
 <20220622151514.545850-3-burzalodowa@gmail.com>
In-Reply-To: <20220622151514.545850-3-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7c576a44-0b36-44bb-fb8b-08da5462ea23
x-ms-traffictypediagnostic:
	PAXPR08MB6813:EE_|DBAEUR03FT017:EE_|PR2PR08MB4908:EE_
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB49081E9230F7F6AAF48462819DB29@PR2PR08MB4908.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y1R3KKPNXO+MWsRpsvvfDFrhMn+OReIgJxnHjRLYTscLRvqW1pt23qv8rM+ZgSPJcEGFhH/db6nBl37wVPCs2J6AMug6SqUNVVlmP0P0HmZzoZADZhoiNyFneyuP0+vSFgi/j+8YvQma7urhCxu3OiKzADUynCquiQzN44ovNwS2IdZlpA1u68/lSpj3Xjz9+spzh3QQl6tazbmjC5sWAQDVzHnci53RKZhwevPj0mnQd7JHmHWUZiCoe+U1/Tzp0DwA246n4DF/4dnn0jNjr/Yww8mdSqVZnYwOjHFLtw7tSN9YNfcwM1aQxPF9re19rSt+95cXA8z2RJlsY6THavOx93IssGU/Z/AJdXQU3FWod5pMyyq1aWlJzhCd51B003ZOHgp0nat3USVdANk/oRr1B7r/d2clifkzJLdIkk1GWmpBtDEouhReOYnp/yowUDZBBr66J06faC9LwgsmUaDK5bamMV00kRqY9XBcdbhSFAk+eX9gJO2HLccUJqS1JYwlPaKToLQG/d9cPdnq/kUXIL4F/XZsnZ7DAbnKTBKgYq8xDfyCiE88Ufic7Ku4lKlpzzVYnjN4+ssCecNjMeJe+jRS+aIwe33MEaTmr92dlovTAEQaB9W0R2CdntnUNrqXXrRUKW3FY7G1VkdY0CZGnUBPdY286geO9OTZXprHlmrexUzokMANLKVUFZ0kGXlZeyjmf2zYhGyeQGce4QqtEuAd7F46gNVX/wBdmAbknpzTCFUJMyynY59Abhk31nfyNHuGh+nAgtwv4Y+gnyXHWUourD6ZLehdQ2M4wT0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(91956017)(4326008)(66476007)(66446008)(36756003)(38070700005)(66946007)(76116006)(66556008)(186003)(8676002)(71200400001)(64756008)(478600001)(8936002)(6486002)(316002)(6512007)(38100700002)(54906003)(4744005)(5660300002)(122000001)(6916009)(2616005)(41300700001)(6506007)(26005)(86362001)(53546011)(2906002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60900A83FCB8D74882602CEB32A50FAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6813
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f1ece56-16d1-45d2-5aee-08da5462e5c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VWXuNa65a2hOHZwKwRyb/8o0JgHGpQCVmXH8pJARsJtxJL1iI00Vix5Covi6cTwx1qoOXHtltM7+NUcNYmw5xbN4IbnV0XrE3ppUoJh+2a+294wDEofg9N/ae83MRfXgpU2o0LEwp4fBIF+7RFHCQGOQ5VMyf5MplLNmg3THqfjPfCIpHNXBSPnp6DtEk1j1043WbO9+j1gpMLjzcN8MnMv0JlHvtKdIMY+1U1Fi1ejSBko83eRwlqVW154vcUQJdwsStFeJ50t+yjelpoVQGgq+Qw7Yy3oxdl3+RwrMR4iUtt10EZoVovbimrx07vRce1cid6fJ5T8DUCBM/uvENdv+NVJiQkNikaWlPS1mVEt5usYWokl9dEmTTBqFS3RdctV/2hxDmX0B1J8bSZe/pAxF76N6B9MpZP48DTmyPJf4VMmiBtkhjeQii39oDE4B3Wf4HKkFO/r1XW1FqxCRx4r7b8VqDcJoZOAxO08I3WaP35hPTvHM0Fm9yUsX3heOdgYhkVYpY7pXaKv+wdVsZUwTy19kLl6m4OCNdDDeABsEn5zjACmvCz0+lbLDfGux4lCiwgdmK0KzmbkMWQBRXX2Jxe/HG8dcsx+ncXPV0z+pp+52rrHqoktbKj3dAOimtGXrzCkkkAXrhMd1RYn4hT9yRLxRPNHp31RY03bzwdjQdN7sGz3g2iNQqqiWHomLQzs84SlPxjYznPUbe7F1henCTzRzHkCr/dMy/2YPzkl8fgRko99KE4xx3HmIvKSuiSs97ZIPoFpBZlo8Rm1TTw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(40470700004)(36840700001)(46966006)(6486002)(53546011)(54906003)(86362001)(316002)(478600001)(8936002)(5660300002)(70206006)(4744005)(36756003)(2906002)(8676002)(6512007)(4326008)(26005)(2616005)(70586007)(41300700001)(6862004)(356005)(82310400005)(83380400001)(33656002)(186003)(40460700003)(47076005)(36860700001)(336012)(81166007)(82740400003)(40480700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:21:43.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c576a44-0b36-44bb-fb8b-08da5462ea23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4908

Hi Xenia,

> On 22 Jun 2022, at 16:15, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Include header <xen/gunzip.h> so that the declarations of functions gzip_=
check()
> and perform_gunzip(), which have external linkage, are visible before the
> function definitions.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/common/gunzip.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
> index b9ecc17e44..aa16fec4bb 100644
> --- a/xen/common/gunzip.c
> +++ b/xen/common/gunzip.c
> @@ -1,4 +1,5 @@
> #include <xen/errno.h>
> +#include <xen/gunzip.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> #include <xen/mm.h>
> --=20
> 2.34.1
>=20
>=20


