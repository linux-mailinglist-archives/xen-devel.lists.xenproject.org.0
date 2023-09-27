Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E67B00D3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608794.947519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlR5o-0005M6-7F; Wed, 27 Sep 2023 09:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608794.947519; Wed, 27 Sep 2023 09:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlR5o-0005JZ-4S; Wed, 27 Sep 2023 09:44:28 +0000
Received: by outflank-mailman (input) for mailman id 608794;
 Wed, 27 Sep 2023 09:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlR5m-0005JO-LR
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:44:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 705167b9-5d1a-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 11:44:24 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 05:44:22 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5807.namprd03.prod.outlook.com (2603:10b6:a03:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Wed, 27 Sep
 2023 09:44:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 09:44:20 +0000
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
X-Inumbo-ID: 705167b9-5d1a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695807864;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A87O4/epQO3MrXamSdb6qyQHSvOzUkfj/S95fuEJ6NU=;
  b=iNZpbJ8JjaXtVJuob6zlh8ccpzBflx9Lws0lMYJIwgctVObPiIMtAPyq
   UKnSkfIk8MWVv2U+TSMcBmuo1fVvSymWu63M/sbGqHK/8tbd78NRBQLJp
   PS8Q6Nisihwomo6pVH0DALjeO8z4kR5aRY4bzGNinlJPHKur2H31OLipT
   k=;
X-CSE-ConnectionGUID: LQoG/4xgTMWA7k8LsIsV+Q==
X-CSE-MsgGUID: oSMd0rARQc+xznLccCeLVQ==
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 123941180
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:O+yes6qME8m8UZHS0bKXnnZ0VuFeBmLWZBIvgKrLsJaIsI4StFCzt
 garIBmPP66JY2ahct0jYY23pBxUu8PUmt5qSgBu/yAyQnwX8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5wePzSZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQ0aT/E2/K5/JeEY7Zv1uA4DdLVf7pK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKKEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhJReHhr64y6LGV7msoLRFOT3KBmPL6mly4f9lUA
 EEwxBN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbpo4eTSAcwv13TRjj8tlw/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:/CAd0K1a8319oMTrtp8A7wqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:aGa07WDNjBgTuSn6Ew1e82FTRtAqTlji5SjTc2ujKH1XC4TAHA==
X-Talos-MUID: 9a23:kGY7UQizsCgNzoVz5qHONcMpM/xN7/y0IXo0mtYWqc+gPidbNhOjtWHi
X-IronPort-AV: E=Sophos;i="6.03,179,1694750400"; 
   d="scan'208";a="123941180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQPUNLQPG5guLBjrl3Um1y/jxt+g+Qtr6vjQMK0gmLVgUzakiy8n6ioHn14CcSSqCxpLkN9eJnKdmIObG4kk3sKmkBSbE4EtGDc+0yFP8pkmzQtcHmoLbDEh7f/MfM5TodEhLKEBhG0o+zBpCwKdvfB6gapa+2ac2NG48MWxOZxNwc9Sj2VmClLjliVcOh8xMaELp5emXKcxHmKySuVViOOLu/FfSti83ViD8qmc7iT0Hh89eFqy4ZGFsgoAUTgl4I6gvpSA/NA4DPxQBSoMIufgrDiV9BvFnWDtt5dN+qgJV0WJZhnii6HssD273wN7j9x+BoKXzs4ax8sGUm9tMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRQOR4pn7vW1Uv3oIea21Tw40/Z1SPOjrWh+R4pYCH0=;
 b=DeB10ba290sLW2oCvptrtVW+s80YTgnR73fAgUo2Z9UXCvoGfb+sWYjFjQDf19aEeag89SmTTC8Alc3ocC4ja3R09iXO9L1dnZCbh8aCWdg8u1llPnsCFh2ZXxAmjeG8MCXCPloqgyiPJWqtZMuOFKQfKpsxyuifT7dxFtKI2FiPh5KcHA7zSjzIUi28KoFdEAootTp0yd+fgZ+1vsGPKh4XECaix0z6srQG94BWnArs5YW49VR8jOQOI3H46XmuWHup1sgPM3ed761NbfDmACxFOwv1K5GzUeT8Bz6/Nx2H2simHRuRAroGTHCflf5+wv5iGLOd9AqpGa6rhmLF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRQOR4pn7vW1Uv3oIea21Tw40/Z1SPOjrWh+R4pYCH0=;
 b=HPF1ioYn6EhS3i7XThUSBL2o6kNwhZQgyENVTIWki9XSq3I/B1qhvti9Ssxnp/Mtypw80+F9yRmCsEY+Jmd6X2kb985gYloWjMk/uW2N4aqKiS7dRi3D6DLbDTthiTrLWyYoB3xL3VuXuVuLLMgdEh/vUaa7qdtJW4jE3A9ISZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 11:44:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/8] domain: update GADDR based runstate guest area
Message-ID: <ZRP5b9qOUK_sCL51@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <65893a9e-e2ae-6853-7c4d-54f2bf19b17b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65893a9e-e2ae-6853-7c4d-54f2bf19b17b@suse.com>
X-ClientProxiedBy: LO4P123CA0567.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acbbf7d-7208-43f5-a32e-08dbbf3e52e5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9hnc8bhWzrKuwT4Xw5hmZQgc0lHmWYJUePeKHvL6IXqef+xomMSMCx/LqWURHVjw/YBBN4MHbD9wRjaRsAoz9LqlWn7aKZoBbJkywov3EkDgkL70kuIiUdDaJaCtNzcxuShDXYTjAAQWVrtcUAJxF+Jpv75HfoZ/Yk9PGwbt0ltZOD1btGaOmd9TxzuNQXy6pAR89C3N6yYWDs0SX8d6Blhelk2ex6X3mFthSE/FM9rVmnGBZhJV6TrH4DHuRRI5qsxqoMyEOXHqjyqsCxEUB7reR9B+rs/02Wy9Xs9+NvRArGRsX5zSkpzQhppA4MtUPj5Qy5uy6l8fSwUGEaxYy2XvV/KXwtHB3lipYLnAcDe2xad5FFTzPRGjHXmUAOeHVcMq57f5wh2uZWni+PScUOxEdb54rp+z4+bPr4njoKS0b8wej0++KUtTfH20QWzKWDzvyr3twhGKXASW7KAot9hhX2CO0OynyijQQCdQ0e92EjCpjlVH41jMv6JQArQiKaVINP0N2VXH4G/WMfjFpqFP2HATB6/g7ckgd8dLMJkB5Tm/nlGQFP0lSrmbf5a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(8676002)(33716001)(82960400001)(6506007)(9686003)(6512007)(6916009)(26005)(8936002)(85182001)(5660300002)(6666004)(478600001)(4326008)(316002)(86362001)(66556008)(66946007)(2906002)(41300700001)(38100700002)(66476007)(54906003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUJCV2lpUnVMb2p2NW5reENHWFN3RlBaN28vYVdNa3lSQTAwNHFBWW1ya0VL?=
 =?utf-8?B?cFo3cU82dGtCZ3VEZUV2SGVKbXdxS2N6MW9iNWtaZjNINmJTTEJsb2FkR0k4?=
 =?utf-8?B?UkFpTndkek5nYUN4dVNINzZWcGpxV1Q0cnlmcVM0MGZvR0gvU2JnWHRDakd3?=
 =?utf-8?B?NHV1RjVSdzNBTEVPWnZKM0dLQThwQkpwRld1b3o1MXc1bkg5bmxWQkJSRko5?=
 =?utf-8?B?T1BBVEhuQWc2UlBmOFJUcGtqNmNTUnp4QTJ4bUJHYjYrc0NaeDJrZURobys2?=
 =?utf-8?B?bExPeHdmenNsVEkrOCtwSlAxSWNvYW11Qzd5d2NSZWdVcUhXT0hYcGk3anVS?=
 =?utf-8?B?QUVNVGJ1WHVrQjIyWXYxem9vU1VPNEVYUEpsMG80NlhRK011S2R3b0J1cEU5?=
 =?utf-8?B?WEJ3OWNkVFdnNWptbWMzVWdKaCtGVElsdzk3MldReEdzOWNqazRHNFVhSTRx?=
 =?utf-8?B?SC9jRlR2ZXJ1KzhpalVKeFdCM2FHeG9xSE1VUTB3Q2pkOHFxOGZGbEtwWkNE?=
 =?utf-8?B?Y2RTd3lYM0FWQUV5UHAvYzNQTXBCNlNyT0h0SHJyV09tQjVEZEdvQi9CUm5V?=
 =?utf-8?B?WWkyeHB0SVJQanpPZTIxVzFEdktVS21QeXZ2RGJMek4yMkZUVitEdDRqV0hu?=
 =?utf-8?B?QVVvcHY4YnpTTkZCOWtmWlJaWXJuT0NRcDZ6M3BGN0RzZUo2THdWa0srdzdO?=
 =?utf-8?B?VEcrc1RtSnQzdFYwSHEzNS9UVytzNHh4R3lQTnNzM0FoQjFuOVlTcE5iWldk?=
 =?utf-8?B?R1dIdUNPNnhZL1hXMFlxTTMzeHl1R1F0eGxqMzI1ZHdMR1RHeXRtY3ZBczBR?=
 =?utf-8?B?M3ZUMUJCc1k1dDJZWllneHhhMVpTcmdxVUhQMWhtUEZwZkpaK1Y1aWN0djFC?=
 =?utf-8?B?UHBHSW5YVHhOY3FXakxLUVRwOWFxeWh0MWJXL3MyemN0Wk8yOU5mV3dSMDQx?=
 =?utf-8?B?OGVDbERxMmhIQ24xQ1c3ZEtBYm5qbWdrdGhtRVpGby9DNEdXLzE0TG0zQXNx?=
 =?utf-8?B?K1hZaFcyTjA0ZjZIbzl0cmJGWFMwclBMQjUyS0V5MTJoSDdBcE1kNkZnYit4?=
 =?utf-8?B?eTF2L21oWVpLVCt6emJIWkhSNEc4azk1N0F4dngwUnpBb1R4VFg0SjJmbXBs?=
 =?utf-8?B?dEE5QUVHbDVnZ0dKaTZHLzRiMVl2NTZFbkZEVmtUZmV4Nnc5REFzVjhsSXoy?=
 =?utf-8?B?M2pXVVNQVmpTRUtJYWhJN3ZIcUwvRmJ2ZG9HQ01NMXQyMCtLWWFtd28zOTkw?=
 =?utf-8?B?b1BjbDNSNWlCR2wxeW04Qlk3NkZQUDN1ZnRPa0RYaERpQlljLzUza1hocE9s?=
 =?utf-8?B?dGZ5dFNFQm41T1RSSFFrZGk3bzZNOTdmajhHYnBlL0JRZ2JER3V1ZU9lYUlQ?=
 =?utf-8?B?aE1VdEIyVk1LbFZ5THRMYytEWDZURkRjZGdwV1pnRnpRcUdCYWQ1VG9wNDhK?=
 =?utf-8?B?MWNrUGZPRUZuOGRIV3dJNVFvbFNTNlgxQVBDc2cwTjAyVmtocVpNTHBBK0Y3?=
 =?utf-8?B?STd0RXBheWdZL1l2RDZwSmVlVXBVVzRmKzYvakdWZm9pcXBkQWpNZDdqd1Na?=
 =?utf-8?B?WWNRWnBVTjIzU1pOSFQza3ZKaWt3cS8xaFh3dVEwTFJqcnNGNExWenJ1L2VT?=
 =?utf-8?B?dVgwOVVpYWVueTBZT0FnKzNrRDBqc1ZZZVFRVTlIcWZwV2w3QzI1aFNsZTc1?=
 =?utf-8?B?aDV4ejc4U2RudWF1Qkl0bFFYVE9NMUhyYXFqZExwZDRjOE8ydHNXYVdvbkJo?=
 =?utf-8?B?OXVKd2NDdG1XS3M5UjhEVFoxYmZRUGQvQWhKNEhPOVladW9rbjQ5ZDduc2RC?=
 =?utf-8?B?alVEajBVblRHU2FscGxLM1Y3Z3A4Z1FVeldYM0hWZFhBV3lHUUllY3ZGekp0?=
 =?utf-8?B?aWlFVmdiR1F3YXFsdjN2ZDNORmRHdi9GdEJraTNGKzNGY3Zmb2pZc1ZRSWVl?=
 =?utf-8?B?UkVsNTVOWml5d1ZaWGhyTng4RHE2eWV2MXVnVVRJOHhMMHRZMXZMaHJHRWJk?=
 =?utf-8?B?TVNVZ05nTkd0ZzZqd24zVGJhM3BSMXYzWXVjTTNPSnpNblcwMnNxRk12RW5E?=
 =?utf-8?B?SWxST2c5Q3IzTEpPb3dENmFtRlhlSEF3cFlndlY1K1R4Q2VscFhTRlp4WlI2?=
 =?utf-8?B?RlA1V0Q1dWlUWUlEeHdYK2diQmlHc292cjkvT00rS09UVW5tMDVsTGljTUxQ?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2klfKJiiqM0ZE7ZpL7ocBRVr1+gWZmQWWoc1ZauHy5RVDkXoA1jSv5GpgpfaftHClettzCkeu9R3Gwsn2Ej4oNNXe6kxP8eumNPdy9lLHC8TfetQzTA73FNkzFYDR3XkvwDN0NoPT+OknutjHAqOO25cjfpZJNCEhUKcOGDFSozh6tybpbBSLk3SlB/dU3uzSJktqYoC6qgsTLQ2kZ/FkOZPaosrcL53g4dKk7wt6XybloIGmL3SFp/R9rOf/y+Wq4OU9xMNR1C3ufpuJGpiratg9w4FkDVzV6yxX/MgStPY78c8CnZgkqFN+MSSThYE9eWsGc5sFSU4RCUr5/C4KVxv+13yJFMEbhq45Gpghk7+ZySJmSf4uJlUbXbVUmoBpRmXTbWKhcPo5Rd9Hn0ZejszL7kCl3LSWgt7KG4cTl0d+aNhrWQGcfifpQnRXNn6+qeB6qfIFyRbWZvIJoJX6K1coJcvMPCcJMqw1s8FnqogCSAVIe9NBToh4rtcROVzfQzxoLn/ashQUTc99rp4SSW5WT0BuP/qZ43gOqCndPAtJcKk9Fv20O25kbCxgMIdX4vu4zMT6VfCZgGYunVPYC+42uFPMM3kG3RpZeAiFI3ZvyG9B9pFBj3Da148fEdOPe3Cn4mpMkTzJuIi98ncskrgiHgBNDFgMIW+lYkMIkj8YarW9WEK7TBA/X4Hxuns0faqng4zvelUM9kh3XayFrQj6DaE3zXmH4BPUgs3J6SkIXP1XZ+Haq4dcMN/GiBeyzrSAxB/+WJdn+1zDrv8sHmlnoOkPXBGwj+uzrQcbacpKRS/DU9BIt6GkbTUXZWReZrxxtjcV8dZsvBo7lniZ4yhRggVZtiCORIOKTLqY68=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acbbf7d-7208-43f5-a32e-08dbbf3e52e5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 09:44:20.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/6JSh0VtUmCCSzMvMScHO2ERIzE9wy/Y0w4VdXMwUM5191IzP1jCbl9l6xxW9USwqt+7udRkMEXHwEXOxY4Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5807

On Wed, May 03, 2023 at 05:55:11PM +0200, Jan Beulich wrote:
> Before adding a new vCPU operation to register the runstate area by
> guest-physical address, add code to actually keep such areas up-to-date.
> 
> Note that updating of the area will be done exclusively following the
> model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
> based registered areas.
> 
> Note further that pages aren't marked dirty when written to (matching
> the handling of space mapped by map_vcpu_info()), on the basis that the
> registrations are lost anyway across migration (or would need re-
> populating at the target for transparent migration). Plus the contents
> of the areas in question have to be deemed volatile in the first place
> (so saving a "most recent" value is pretty meaningless even for e.g.
> snapshotting).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>      and alignment) of the runstate area. I don't think it is an option
>      to require 32-bit code to pass a range such that even the 64-bit
>      layout wouldn't cross a page boundary (and be suitably aligned). I
>      also don't see any other good solution, so for now a crude approach
>      with an extra boolean is used (using has_32bit_shinfo() isn't race
>      free and could hence lead to overrunning the mapped space).

Shouldn't a well behaved guest attempt to unmap the runstate area
before changing bitness?  I would expect this to happen for example
when OVMF relinquishes control to the OS.

Thanks, Roger.

