Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DB95237FA
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 18:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327090.549818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noomm-0007Dy-VM; Wed, 11 May 2022 16:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327090.549818; Wed, 11 May 2022 16:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noomm-0007Bz-Rh; Wed, 11 May 2022 16:02:00 +0000
Received: by outflank-mailman (input) for mailman id 327090;
 Wed, 11 May 2022 16:01:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nooml-0006z4-Fr
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 16:01:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe06::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeffd61e-d143-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 18:01:58 +0200 (CEST)
Received: from AS9PR04CA0094.eurprd04.prod.outlook.com (2603:10a6:20b:50e::23)
 by PAXPR08MB6686.eurprd08.prod.outlook.com (2603:10a6:102:13e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 16:01:55 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::c0) by AS9PR04CA0094.outlook.office365.com
 (2603:10a6:20b:50e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 16:01:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 16:01:55 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Wed, 11 May 2022 16:01:54 +0000
Received: from 910a192f79d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22379CFA-E944-4AE4-B7F3-AA5C327787D4.1; 
 Wed, 11 May 2022 16:01:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 910a192f79d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 16:01:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3708.eurprd08.prod.outlook.com (2603:10a6:10:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 16:01:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 16:01:46 +0000
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
X-Inumbo-ID: aeffd61e-d143-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dYIc/hy1v6mNepv+OvUAq4gc9LtuzH7Ex5Kxqee6PyetzLzNPzMvh6kf+i7y/5lj1/kpqs51goZ59dlR1IAba49UWAa/kOZHUg+C9VUekL4SK80nD5poG402HTY/caY4JlAAQ3ghOhtE8e+qvNXkzCCr0fURv+7Xo2m4w8jKS0BT4AuMjp0LGg+A0H64f+bZpq6FJ/fjK6rCwGEnodobdJCQ4axu9NMLE43GvoBRt/+HQ5cuO0Gr4sqVWHfJl1MxeAtWaC00e3VSTErThZG/cvMnzYsOZSWsal2yuLLvxB1bxp4Efv7QuD7T7dw65g+oIjdch88IrHCU53ujad44EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUCm5lS68CvkA4ylVhubdNduPXcnxjvk5JZ/KlJXQng=;
 b=iKqSemJj+i5qCXczL/MF9CLyvleSHjgZhuARw8HO/EHSXjA4Rs/vgnkdq27ktImW662PUVhGZAn4sKuzsiWu54KWGLX9OEe47UWpceMAFYuc3JU6gJjgDbrfpYH7V+GhVwjfnOVyeFE4FGy6ue3147stWzhXSPWOt0CmsZKiOibRMy82HdvBR+19jSr7JA8fv0nPpPF8gv0FDLSgvzYP2NYdpi7jdtQ4BJtcL8phQjmM9i0rzw9j/yADk3URABDTMCwzMxjL65rqTw4lH+czCXdjX39xWPA3Vv2DuVoK/e1wAat+/N6mvrwPkQz2CrRck9PiQ0ByMiQx737owcq8TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUCm5lS68CvkA4ylVhubdNduPXcnxjvk5JZ/KlJXQng=;
 b=cjDhUdBAFIGsJ9obiN1TiSuDl4ooZ7uZ/WnbSr1AR7QkNXfBNfTtBw6BsxhZ6WEWI2fdnadX1MDRH5cyMrlnF4uZBL0Ob00l4w40yKgHmAoYCsaSQDpeQ+XNXBi6WphmtFJ1eD8RfYNAt0WhAN1cjlrOMGB0dL5GnSggsbCdnhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: eea01e9b5c9dd235
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD+Gop+GXhFV/7u907Vt0/c/GVB8yf9aRT8Y/d2wbabUGRM5jD1msHqNQKRb3qGpFhil5Ielso7/eubFleS6/UCR9E1SppR1V9Hd/LgDnCl+RCVKSDbJAgzfC0aKttNe6TGLKb0yXxgyItSA9MLOIEUdymGldIRrdMm/pI4QZnVvwJX223NQ7ecGTtnKWU+6/8CIaOe3FdSNa+gdN9ooEzq/BAM7Sya8vw8r85TNaRdnwGE9TVQXLwK1+9ry6Gbv1i+E3BDk8NhSJ6J21QQPzp5ypNeDNZMBnTLR4GWPppOhhUFHkIYXfsbZqZ5OQErGxLwL0PjWmvLzy8tObMFZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUCm5lS68CvkA4ylVhubdNduPXcnxjvk5JZ/KlJXQng=;
 b=LM4dm0dD9ul3wq78ts7fX++bmNZ1IhwpIOt3DYQCGf+yYDfPpSwP+RlpoygOibBHJmtW49uyf/TmrZQhEsXrAAnS2hlO8YBUpgqEIOfhPXDae4a4yZ/HPu1x2skhEUbBQahGF9EJaS21/yUhbds2RFsIuq6u3KYb1XbquLFvJ8d8xwSj6QBlEK3y3cPK8SPOsw5uifwht4iyZy/FNcSTQHdqaZduscBkMpA+mIayd2TJlL0vcS8ilhoF1VaNAfrXPLMXA14ypahiSXxwHEaRH7K+5NernLWeWmLdOUphpLhyKectND72ZnntAYR98tkYjJbi2ltlDuk00d5PMx6GQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUCm5lS68CvkA4ylVhubdNduPXcnxjvk5JZ/KlJXQng=;
 b=cjDhUdBAFIGsJ9obiN1TiSuDl4ooZ7uZ/WnbSr1AR7QkNXfBNfTtBw6BsxhZ6WEWI2fdnadX1MDRH5cyMrlnF4uZBL0Ob00l4w40yKgHmAoYCsaSQDpeQ+XNXBi6WphmtFJ1eD8RfYNAt0WhAN1cjlrOMGB0dL5GnSggsbCdnhk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Thread-Topic: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
Thread-Index:
 AQHYXtGhqgeBKorGIE+S3ZHm07cmGK0Nc+GAgADisYCAAAtXAIAAGQ0AgAAhcYCACMpfgIACZduAgAALAICAAAXAAIAAAeWAgAAD6wA=
Date: Wed, 11 May 2022 16:01:46 +0000
Message-ID: <BB14834F-424D-4024-9A54-4BE20F7700D5@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
 <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
 <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
 <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop>
 <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
 <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org>
 <F60293D4-0A44-4365-939E-5C1A80D7A159@arm.com>
 <0a1faec6-b265-567e-0ad1-478dff6bc81d@xen.org>
In-Reply-To: <0a1faec6-b265-567e-0ad1-478dff6bc81d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0afa3262-b9ba-4b3d-3124-08da33679209
x-ms-traffictypediagnostic:
	DB7PR08MB3708:EE_|AM5EUR03FT027:EE_|PAXPR08MB6686:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6686DFDF93C9659A550BA9AE9DC89@PAXPR08MB6686.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4h9GrFvXCUieCXsM/HPJOs2kIW2gzKlkEMLCdnGv3ZwDYHqVzeU3szppzLTILRltLcL9Bo72XtL2Paszd/jn1dFHS7iI3jFE8y3C5McQOpw2sB6z0dxJrvAP3QLZR1QB3H3/T56Ikl5eUQ7KtFu/XEw1sAkwGLMxYMdWLMjPFv0S+8pxKs/LqaQAAEB22rhFcn1Z8XEsBuvVNNKRJn3R0oD/kTfuV5DSur6JCqYHKiRGgNjkYgJw2n9G4IAeAXabW+zgBsR2n3XfZiUWLaBccHG02exYrxITrGDNydz6QWD80binFefzDGFyG9s/kD9QchoU9F1/vdZg+NrhoYG4XQ64+2B4avHw2by4Gir4j+gtCPwBlMWIyYCqKMP9K5WVoCwPigHdB8sGBzcEesBTthRDE9y88E7ZFnDP4naORnZGsDo72HoTyYP0RrpaT4eUVXhsX/U0AScjAA0geo3phK/rs8tIL4SOJWStD9Z4Qe6ixQCfJyU87z5dYcJeO/A9P57M6kBpgIvKJbf6DQUr0SBDzGC0gUZlDEEdutCKqVFrFSovrWBkX4aVEgPjp0XCUtR2dhEzks8g8qAQ9xvNj+KkNiA3rr4FTQ2k5h6bBdaDyIeJdja9OhhxyflT3iv0oIsqNkaFU0i1jbdRu8Nc2qa4jeIY8usFhIJe1WjBDo9KiCg0smCHfLCcEITZ2QJfw75Yy860wYLYVhnUBYVIOcNeqZzmSxH5jj/x3ndgxUwBGQma9Y2hfQbDg8xG7tfR/9A4DxK5Mc7L1G3gi+7G3ysVKnijvPNddF6zAzAc44U0xqUcElyCWX+HRRmOGPsxlFoI47m6cg2Aw+5uOOuXtQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(2616005)(26005)(122000001)(38100700002)(91956017)(53546011)(5660300002)(36756003)(83380400001)(6506007)(8936002)(38070700005)(316002)(966005)(6486002)(6512007)(508600001)(66476007)(64756008)(66446008)(66556008)(66946007)(76116006)(54906003)(8676002)(4326008)(71200400001)(6916009)(186003)(2906002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDD488AFB3F85C49A85021C55934F26D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e570fb3c-cc8b-475e-e6d6-08da33678d12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nO3Jj9ed+yFxyIoMR3qsw3JEBjMY5UnuA9RO6Y5hmpcJnSG29fCJyWQxdxuKVAEekuFtTRiltnWmY1G8ysqfTDYDJC2lGL3G0Ffhb/D5r2ybYHV2EBQ6s/eq9ndvm9eqoj0goNcSXc8bu2Em6gDCFIVsQ7vNGOhvFpqqGYNgihudXiSCC2R5P07okQQjMyXJMfVLP6yczGikQmOIKBgJUk4f971oQE+sHI97TsV9pJEHEa2N68qYKXIR9julkiBYKYFgrfLjLDtUOFYRfGmc/sYAPMz1DUP3DlhQPbpD0l6tzUZ0ER4huTVTx2e4a3EF+DOq6cZsBdWCvxGXo/A+cvtsKOfqX5zrSXm8g0yLLLmyVCbpL7+yhvahvcAMEyyIC3RaNJ84dWZBAUWX935ctQWumSxwJf7kD5kCwhTowD7acyfwwPMuOtkDJ0/MQBgRWB74HYlJlzCS6juAArRWhcXgznRdK3eS/OsicWirwNR8EVgBzXIhv00hP8JaVuZ6TeB2FoLMp6ipDI5M4cq0Qxeapm7bAdNsMfad1Pn0e5I9qprJHCdXaD+LbvSLG715pdrfMtRNhtDCz0JqI1mvMLMUuTYGe71AGvIgKMiMT6nw6Hvs4PgHqc/aAENzBJEsrG0klRFCAAGeC882/uPqPOuxrfp+quRVbVy/avxcgKsWW6Z+JPjn52OuytMy7TVbAeZoywFGuk5pMxoOsw5XIl/62/vurdfa5rVZQ9yFoJ+WXPSjWSjqzKO4L7v9VY9CKrOmBa21ug3fyMyoCz7WDw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(966005)(6512007)(26005)(316002)(6486002)(508600001)(47076005)(4326008)(40460700003)(36860700001)(186003)(2906002)(81166007)(6862004)(54906003)(8676002)(336012)(86362001)(356005)(70586007)(82310400005)(33656002)(2616005)(83380400001)(8936002)(6506007)(107886003)(53546011)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 16:01:55.0301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afa3262-b9ba-4b3d-3124-08da33679209
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6686

Hi,

> On 11 May 2022, at 16:47, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 11/05/2022 16:40, Bertrand Marquis wrote:
>>> On 11 May 2022, at 16:20, Julien Grall <julien@xen.org> wrote:
>>> Technically, speaking you only copied the code from Linux and therefore=
 you are not the author of some of the changes.
>>>=20
>>> For such case, our general process is:
>> Could you tell me where this process is described ?
>=20
> The closest description I could find is:
>=20
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/process/sen=
ding-patches.pandoc;h=3D7ff7826c992b68804b41cc4a8605329f7a10e44c;hb=3DHEAD#=
l75

This state to give the origin which I can easily do for my patch.
But it does not state that we need to list all the authors from all changes=
 in the origin.

Are you only requesting to modify my patch to add one origin line with the =
SHA or to actually list all authors of all patches for all changes between =
the previous state in Xen and the state after my patch ?

>=20
>>> 1) Backport the commit as-is (i.e the Author is the original Author)
>>> 2) Add the tag Origin (recently introduced)
>>> 3) Add your signed-off-by
>> So following this theory, if we import a file from Linux we should list =
all the people who contributed to it since it was created ?
>=20
> Technically yes.

But this does not apply here as I am not back porting a patch but syncing a=
 file.
The origin as said upper should be enough to get this information.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


