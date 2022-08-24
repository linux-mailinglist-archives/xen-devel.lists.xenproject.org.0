Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45F59F6AF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392337.630620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmwE-0005XW-0j; Wed, 24 Aug 2022 09:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392337.630620; Wed, 24 Aug 2022 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmwD-0005VS-UF; Wed, 24 Aug 2022 09:44:41 +0000
Received: by outflank-mailman (input) for mailman id 392337;
 Wed, 24 Aug 2022 09:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQmwB-0005VM-RW
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 09:44:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cbcccbe-2391-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 11:44:37 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 05:44:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5369.namprd03.prod.outlook.com (2603:10b6:5:22b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Wed, 24 Aug
 2022 09:44:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 09:44:31 +0000
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
X-Inumbo-ID: 5cbcccbe-2391-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661334277;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kwbnY7ykDoyYsdByUWKkkankSyCOY4YGz+mW9LrjSwU=;
  b=OHtROl3bz0njcgAsRzx0MzFxVyAOoZklk9ZOH2o9uUSRsXsmmXB3+lOw
   ugrtBBDotsRsqzG4Vt6VDo2hoo9gEvSf5rKxT/l4QGmGsSIIynOPfHOzO
   OjWDlt7LLLMojLFUl+X7n6fG6q4JQ7V3BCg2wSGCulcs4p3ACyGqhPIwl
   c=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 78797272
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A523pXKugh+VbnmtPQHT8wbKjAOfnOphVZkbc3?=
 =?us-ascii?q?cifNrXeuWXxXwvKv0XisSsq3Mm8OoGr1iCbPhvvLs5IgMKsczub7p1jDyG6W?=
 =?us-ascii?q?RXHpZgm8DeMTj8RQzKCDm8/0Oi1lX8DQW8eGMzZDMzyZTbtFikXqvUwKTCmG?=
 =?us-ascii?q?z/sfAgDUKlGl+WDhaQAD3LtuGdVdCmdqTiaXHOulgVdVa8LxE6s7ad6l+9S7?=
 =?us-ascii?q?IY2b2DGH+kJzw6e7Nd98uqBTAwe6+3NSq6kvUTDU4uDdlsCJRjJvWK4c2N64?=
 =?us-ascii?q?7gfwwKTrSJiYrEmSAaZVRznkjHuT8rOxo4fpx7gh6zU/aK3WPOl6BkYu2SVM?=
 =?us-ascii?q?dlMu2SsqwkWqjO2wWTOCAklNj8HyRe9x2J0WQuKkZ1+63ebyLY58X/8t2elp?=
 =?us-ascii?q?Fqj5rGDNNP4+8tHUS0SI58wqGvd+qUIiomxufrOGyo+ITs/mZxd3RmNqCL8s?=
 =?us-ascii?q?soEnfyFI1Z0Bbs2x+42lvnPaTCrGiZcccfjwnV1oGXG/YpOu1QMQ/ZhosZxt?=
 =?us-ascii?q?RrBU5qrGFh86aADrhP/pXkUM7u/JjOMIN6aG4DFngBC9Qx7eEbGCLNWmlhbS?=
 =?us-ascii?q?0S8IqzSnPyknaxKsGRbYQ3Me7g5ZvjGX+gPugBm83YQ2YvHa7EIuvEY3mvaW?=
 =?us-ascii?q?Xat6frpvVdp0BtLHZxb8d66KnRRjFbAu0+u9SOCJj9nO+5NMeojv8i3DrGLu?=
 =?us-ascii?q?mcB/NAx6I7HAcXNZZ8Qz30Dl+7GZv8WyRI/onTf0zPVQYCdYglslp8snsY6q?=
 =?us-ascii?q?lG0SX8C3krgyaBivuQpmO6lvUV57CIGcrbzi782OTwoSXs6IbHgNpBRaJKZC?=
 =?us-ascii?q?/uv2JJoE0XyWvGwaM+qA14x9gxJ381Y6f94eEGu+P2tiZpJ54oIYtJfZGuWV?=
 =?us-ascii?q?SiLVR8iX+2Uhd/bYriOyz7BCTVvLb7KplyGI+/lnyufxKbfkDrGB/C9TFzhw?=
 =?us-ascii?q?gdGdHW/9mbRmtIzQAU4oGyG+AISh71FxdQyGr8apfUlecyxG8AiLU4PaNXVS?=
 =?us-ascii?q?gfpWa1TeD1NiGYmS22vfbYwUvuPW+Z9EaEMZB8QPWhVPjxapF3QKTuoquKYW?=
 =?us-ascii?q?1EmVh2UwLx/CFvhy727Ha/kIB5rwPbxonagNSTJqrCH7EiHVOw5i+a019shR?=
 =?us-ascii?q?T4DhVaByF5PN502r7sdfs1RnWktpKFDUnuNZ2zbybdpVRPfEFiYDBhgBN7ki?=
 =?us-ascii?q?4v5LDg0ZgL85FeX70UqmvwHKpisMCY7rMVjzhB+kBahsQbjjEa51nJ+ILZNn?=
 =?us-ascii?q?/9zlRnV5KUPQHQJYIXKSsTtqYSsfMhkpSVuHgCX1WWmP8T4f/k8n5RJ8h5ZJ?=
 =?us-ascii?q?ZQ38BkT2W84upTj+UPf+/xc8D9jkZ+4Ga4NBLp1XFPZyZ8pYUEwuJNaiVNxM?=
 =?us-ascii?q?4t5W1rZoGNjtsozZaCX87xMHOpHxfNusjaE49nZBNXiUS8SyOekHKceOPkEg?=
 =?us-ascii?q?dJjOkjEo2i5hAGqrngcDdPC6V+oiD5jADGaPzlXJ59J1o50grGEQMVJNpNlk?=
 =?us-ascii?q?TOpazJf0SFu3Yjn0P8HoW+xbiW60lQBjGvLO4D+QPIdNe5XrZAlMIvK9KUlB?=
 =?us-ascii?q?EbpoASkroJYyr9CuzR0vXg0hp+ow0uWMCrtxfRowPXp7PS4l91+AHfVqkFm3?=
 =?us-ascii?q?taoaVF9jN+dEGEl5wBttQcikuK106Z3JMbUL4X31hp927IrNp1JjvU+pNGVu?=
 =?us-ascii?q?wOAVakdfcPMF/sORnXWjeMN7MDUquufy9s24HhhwgbdkXyw+LdIrGx+Z5ODV?=
 =?us-ascii?q?SkOjKdzZf9waFmUAL2S4JFhXf0tIY/SAMgXXYlfhhCgtsp/u4mmZUvMDiE56?=
 =?us-ascii?q?F5IbLL1VPdnOSUW+8UeTvfCHLdSHEKQyeFQp7qMX6E2qA2zpo42ImufVRs0P?=
 =?us-ascii?q?MUZTml1crXz+6JFlk8qK4/pxo1Mi50Uqs1s1BBJeeuMwxumsWTTscI1VMBfv?=
 =?us-ascii?q?bdor/iFeO7GOJt89zCm4FBoGgQlbF7NRoWhQ/2sRIoVkKZlYjJJNTOLACWnY?=
 =?us-ascii?q?K2bMmUvU+z1K/f6J/d9yZ0HKWdteP9i5dv12tTE53/229EZHqtJFD9tDDE6O?=
 =?us-ascii?q?8djwS846o+cbqdTWPJr2PNv6kdEcFa44D+n/CEyCOVv86fpnObFQjQ9YpYhI?=
 =?us-ascii?q?wtTX+ULGXz7otL98t2gRVzh+PF7faoBgFKPGtfaI/xGrBAmfdZ0OlrqYgqen?=
 =?us-ascii?q?ApBZWEqSBmrFtB686O8OP964Qz93z7HWaJ/2TXmKGoU3jctFazNDh0rewzbx?=
 =?us-ascii?q?CRXOwG3MCzZJz53aB8ZlnVO4i/oIEFj6GZe/o2QH+GbSBhghDMXI7w5EzPv8?=
 =?us-ascii?q?KsJcPbF8/5SAe+rrHefIUGfk7Jri5kKLBpbZIei8Z3XJ4tCmsk8FzjcmEhz7?=
 =?us-ascii?q?xo0E7PnsW6g206zpOTdVCgdF3e28caQoIq2xmBNmgCzfA9/g4Cbj8LmWffGN?=
 =?us-ascii?q?CRVvIYUhzNqIgbVkZT6ytvl5iZUmovhjGsIhwEUfRhHB9aEYeziASY+yZBd1?=
 =?us-ascii?q?iI66moTf3R6KERDWZLtExvvv6usrzPjL8F8oLNPg9ynDX9Y+XXFLCxubUd2a?=
 =?us-ascii?q?ZzgkeKocO2g9R8x4Q7Hr3i8yY+SN3F3F3TiIUCWQpMBWstSpGGRVCLey2iFY?=
 =?us-ascii?q?ndPghYYhe5vYNLfcjbGOme14cH2WZ5aBhgIrDn877YOODIvxHGEwdM2OJePH?=
 =?us-ascii?q?oXkvOPZEv3Ln8fSboOCt3eDPgC5Q6iJMMMGUEIU3YXEQnSS8KBT9lPbi3QyG?=
 =?us-ascii?q?uCGwgwz0tYC+xv6ap6oITDEG7nQx0A25JkWWIb+wZ8vx6+3rwOf/5g4Hiv4X?=
 =?us-ascii?q?T+Y8tczhv+Uc4JE5PMaewpvEh9tucjcVegclNftLZNL9xfzuwULfL2L1ZrFn?=
 =?us-ascii?q?i+kJabaGPTEetYSpEH3zKOq0+tpPORfcoK7LzGtTDBYTxqTn1Hsgg8M91hvf?=
 =?us-ascii?q?IZvQcIb5HMboHR5b+Vd5g1+zuhOy8Gb58sw/38TrX77IGXi3+G3E9yny+QoZ?=
 =?us-ascii?q?pLfwk2pXczHBOeXYHHna0GlDwALAAddhm+xAJ11pP3OOAGxt31pnw45vjLEh?=
 =?us-ascii?q?Zl2apjCnixuQF9byfulF/wzk0Vd8nCC38HbmhyJOWTYM6znFQjgSaeiknI8M?=
 =?us-ascii?q?cjEzzaxkNPJkBasUmG8LS+1/KdUCb5+N8P0uFvoDbOMFNnraNPhnHRfdLc28?=
 =?us-ascii?q?hUC4Ly5Job67cy4LHWW?=
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78797272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTSNRJ3VVrImgS/BzKbpLDtzS+ArxBRxbaAfSEbcMvakgPWkjqkzZ728JYGZ6981O1hAZg2gpjsPHlFdkKkitxmy5rx5pTIgXzwFGkKkMW6BMCz/JiuCQAVkNY3xUrqYA2QvTdeUHglgvmWLOI9QCm7bwZY0SC14SKNrk2djYehWyPu2Fx2oRfmp+wBE0PRsL0nz02e0FFikYWgH28YX8VRaP27rl2r2SNnKYW6e1y/rwGrYe4qB9AZl4BbRbJgkO+zbiDRIDzJrYt00yP4hZMYSUGI6MxMf+8x3TNMy7ITe3DfKbI1csPGAlLeqR3/Dj+O5bz/yzvMj7zgj+qDUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwbnY7ykDoyYsdByUWKkkankSyCOY4YGz+mW9LrjSwU=;
 b=WQTvZhlQ0Hog3XssOahvTsN3lsJdkdWV22cs60NE0pWgFzmuvq7SASsGEB2tAn8Xe44xrr1Omm0SMwswtZMgnThE8Js4vGX2Lys+Ou9OaQpceZxLQ8jyaJaauNxO1XlgVKSJzrA6RlxKLmrVxPTUxYNHLdJIOkH6RW3d04gGhqA/bwPbMX0NP+p8d2JIW/HQGpykouRpRZQMw8STQoI+gCP+uLsbc8U1HIl16SHYNCDmFVYXMOcUZOwbyFUSGUBIuqpYIZNZ5Gea31Cx8sZMAmG+Nf+grXvnIhudZj8G1EnL+WE5THv7eiGoxpFsbhhJSf8yOaZjDli+6gmaz8pYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwbnY7ykDoyYsdByUWKkkankSyCOY4YGz+mW9LrjSwU=;
 b=CmJtFZZghgllxJ3aCmmXPi59cyPfyYn5JKheYADHoJUP2L3ozniQNZhhS4J4VBrjJKr6AprsaWCuMKUfYOGK5bd51NcZbY9cxk/K1m9uA6phg74dlV/lh90k6vuaG4CxQT0TWmTKeS2kSek2KAtpfq9lHrGpsIWnoUU61gZYHuE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>, "Stratos-dev@op-lists.linaro.org"
	<Stratos-dev@op-lists.linaro.org>, "mathieu.poirier@linaro.com"
	<mathieu.poirier@linaro.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "olekstysh@gmail.com" <olekstysh@gmail.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Thread-Topic: Understanding osdep_xenforeignmemory_map mmap behaviour
Thread-Index: AQHYPyB2MlnPWsZzkUKnVxqi+u89/6zN/SaAgPC5xQCAAAcKAA==
Date: Wed, 24 Aug 2022 09:44:30 +0000
Message-ID: <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com>
References:
 <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
In-Reply-To: <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf8a38b0-0d27-436a-a2fc-08da85b53e72
x-ms-traffictypediagnostic: DM6PR03MB5369:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jo9nIun5HHk7jer8gcU+6raXxYsq/z7/gdWN4RiZhftrWsTmaDty4UNHkNjJ7mfcrB471b8NKJVpH3DwF1ogoqmhx58/7qsMq0dPPmmAYT5YnI6Yqg5ox4T2nqRuLGX4a5jnXb6c6ncB9m2IBSLMRG/T/bu6o6L32Nwv+rqAvMqt+RV/c7eOQ4dMmKnY9M/NZkVuVv85jCw40KHJfXXsHqbrzwaRLFefAYIuPUiU/RN4DV+fyqgjlQxhHBi7kWOS/la3+gQvdnMK41naU4vwo0pDlD/QRii1RzKRNojGcaS76ZmpZju3jpHTS0jqmCRI74Sxmn++n/7F+HTiJ2emdHiixfSOZTOKKuBzzLRlhDhQn4a6d5Jdc5arFg5ievrnhJAILbYE751QgmYVzXIdj9Tvok2yYn0mt86BM3IbJnc4+b88yVc1j8Cb9zzdJ6s7Gs0d3+RyJ7QcqPIcw1Y0bJIXvRjNJyPeLXuyMzrMqBFoMq2aR1awjRzyxZ4Tk4ZvVKxMyQFeANtYqSqcIWZ5CApRrrFSS+nJmVk0GJtjpo2o2wHVuSbMdH31Y75HjEoaTmQQuzP30v/xn2Doqa08dkRU5cBhIYor+LJxK6q3peLry1yzPbrH6YzQbEsn72TWI7KoYPPsIrcO+GY9FqFV8i1e4j+TZoOIHHtG5TKiQLCe9xf23kEXkihlVH9scKBeeWXa7hnlrm65Dw17X46JMIidYWTvuW75q9wh90QuvsPKvANLZjmMeyICyToU7bIUdTNpk1ElD6jGMjs9KsNVL3KFIyy9CnsomEkUY9LbNzajScLEEAA+ZLTHdlwPduU5Mr+z6o2sHI7/sxpEwetn5w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66556008)(86362001)(8676002)(38100700002)(64756008)(66476007)(31696002)(31686004)(110136005)(66946007)(66446008)(76116006)(54906003)(91956017)(4326008)(36756003)(38070700005)(82960400001)(122000001)(83380400001)(186003)(26005)(71200400001)(6512007)(41300700001)(478600001)(8936002)(6486002)(6506007)(7416002)(5660300002)(316002)(2906002)(53546011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlA4MVhhTVpmQnUvVFg4M1ptUldZYmZLbmNqc0NyZHVhOXo3R1dhZDlqZjJ3?=
 =?utf-8?B?QjVwZnlkeG1sNXBLOFcwSzE2MnpjUlZWQXFpeFN1dkVIb3c4UWJHT05VckRP?=
 =?utf-8?B?MXVjOUxPb215d1BVc3d3aUp2UGFoZXJNVlV3VGNCZW1teW94dWJpMStlVzBo?=
 =?utf-8?B?cWFUY25VdkpkcXozQSt3RDkxS083SnE1Sk9VN3RxbXBveTJkTXFaSjFZWmlF?=
 =?utf-8?B?Z3dTOVRPZHl1M3J4blR6RG9JTjBCaGpSSkl4ZGd0UDIvZStZRWQyTzRHUWdm?=
 =?utf-8?B?cnlnakhtVGFMcmdhdjNZTEJjTWNxTUpjWmxFWWUwa0hpN1hSeTJud01ET1Fh?=
 =?utf-8?B?VnZjY1h0dTROcmZWVTFWeXpFNVR0Tk5yRUNIMTNLWGxsL1NuNDJmSWtmcmhr?=
 =?utf-8?B?MWh1U2NwL0NNckQ2Y3JlV3VWK1V5WklKOW5QWmJpa1ppYjByWHpzR3BGcWkz?=
 =?utf-8?B?NGdIU1hSSi9Gek9vSElMOXp5WVFOZG9kcXF0MFRzUzhRSHdMdy9Ucnpzc25u?=
 =?utf-8?B?SFAwZngxYkNrU2lCdVpBNittV0Jtb25TcXEvekY2ZHh4NXNKSmJKK01sQytW?=
 =?utf-8?B?aVcrTVArMExBdDJ2cWx3QldXSFhLMlNsRWhEQklUUnpJdm1jT3kwYzR6ZFlx?=
 =?utf-8?B?Z0Jza0dIK3BUTHNjWW15WTJSTlB1eWlVU1dqcmlRZXRWMGJxL2diYjFrbjlY?=
 =?utf-8?B?bUMvSStJWTl3S3l2Wmc4ZVdqTUJ3cG9maEtGNHJRTGFOUEtvYzMraDFxenRE?=
 =?utf-8?B?S0ZDcWZmWXpsMFJoSDZKN2Y0WmVkRlRRazZ3VW8zUVgxbG5zQlJsUmVGOUpr?=
 =?utf-8?B?N1lqS1QwNGlWM0VtV2RZdS9udjd0bFNqcVRhVExOSmpidUVIZkZNTWVJNlBV?=
 =?utf-8?B?MTVHcmdDZERsNi9DSmdGcmpvY3hLWFVRZm1ZTXJubHRjN1Z6NENKcFJhcGFa?=
 =?utf-8?B?aHpJMVhMNEI1UmtQSjQ0RHl5b2VRYk9SRXM2MUtlREtLeU5xTWI4Z2JsaTFy?=
 =?utf-8?B?QkpHMHk5djlEYVBDL3JyRWdKQlNMU25GaGNKY24reUJMTWk4YzFVbmJYZjFN?=
 =?utf-8?B?NFFHSnFjcm56Y01WNW52MUFkbXAyZHdEL09KTUxrNjlIZUtyR0h2RmNxdDU2?=
 =?utf-8?B?bEhsdVJsdVIyZWMvT1daWURzdzZaOTBBZWdrYllwZ0Fid2NXMUprMUN3ZFZz?=
 =?utf-8?B?K09qMnYwTVZxUEhpQktqTW9kNG5OeXVVYXdJWWt4WUh3QXdIUFlTRFA2dUI4?=
 =?utf-8?B?aGRsQTYySzBPbTlQOWJGL0JndEFNQlRTbG9hV0VMaDdyc28vTTFSaUhDOVJt?=
 =?utf-8?B?a1Q2Wkg2RFZwS2FkNjgvZmNpd3dUTERUZlFVb0VQdy83NlVyQmN6S2RGMW16?=
 =?utf-8?B?eGJYQUF1WWJ5dmtnVkVrR2k3YUY5UW9VTXFSazdJaC9zbVNaQ0ZpcjZGVUNl?=
 =?utf-8?B?ZC9iV0JPOE5MTEdQb2RiOXV3eVI2UFRDWVZRNm4rekxDdFJpc05Xbk94QUdj?=
 =?utf-8?B?WW1naytZbnJGUjZoQXIxbjlaL0N0d1pGL0hCSGxUdmZ4bCs3NFp4ZEZCcGtD?=
 =?utf-8?B?QWRmalhVeXZzZEZhOHgzVStBRmtpMVZobFR3UFIzcmp4WVNBSDJQS3ZkdEVE?=
 =?utf-8?B?R00wZ3YxVjNodUU2b3JrUWpZdXhGSmRiMGNhRENlZVk3UWxIdlpRUFBhYjYr?=
 =?utf-8?B?Vkx3SEFwVXdSQUpGSURRbUJyaXc1ZW5yYXRSaysrNFIyTkNhOXc2VnlHSHZl?=
 =?utf-8?B?TjRZeEF6ZFBhOGhiYTdNdnQvaHRuWlpQOGlFeHRPSjhwZ1c0N3dWUnJuc0ZH?=
 =?utf-8?B?cHMvZXl0YmFEenFQMStIREx1bElndjkwMkloNGcyeVpyRDdPL0Z5RWpPVldJ?=
 =?utf-8?B?L044OFlvVjA4RVRCYXgzUmlPU1BTaENadUdPK3JWaFNGV1BVT0JIdW9MTFEr?=
 =?utf-8?B?Z3FISXdxNVRPZnB3eEVrVTBkNjF6ZUhvMWM0djc3NTZjL2p5clRWT3Fmb3Nn?=
 =?utf-8?B?SkhyWE9jRVlvejN0bE1lNGx4NEpRVjByV2k1eDFsa2crVmUwOXh0WHV2NHF0?=
 =?utf-8?B?YkUyTVpvVkhydDRIcW1aZGdQdUdkYTV2OFhnV3VIVlltMkRGZUpnY2J2VEZv?=
 =?utf-8?Q?zHLewON7DqGd93HdpIb3CW6jE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74315D231B5698429328C3FFDDE01F9F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8a38b0-0d27-436a-a2fc-08da85b53e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 09:44:30.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83EdT6Swq4q2S5jI2Du9hfRCkPpLVNigjk7sH+fWebw2hlim7yWkU4Lj1Qy/qxMHxht41VvRVBD7PqCXtrobmtzF3ekk8vHhq43lo91o1IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5369

T24gMjQvMDgvMjAyMiAxMDoxOSwgVmlyZXNoIEt1bWFyIHdyb3RlOg0KPiBPbiAyNC0wMy0yMiwg
MDY6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBGb3IgYSByYXRoZXIgbG9uZyB0aW1lIHdl
IHdlcmUgdXNpbmcgIm5vcm1hbCIgdXNlciBwYWdlcyBmb3IgdGhpcyBwdXJwb3NlLA0KPj4gd2hp
Y2ggd2VyZSBqdXN0IGxvY2tlZCBpbnRvIG1lbW9yeSBmb3IgZG9pbmcgdGhlIGh5cGVyY2FsbC4N
Cj4+DQo+PiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGhhdmUgYmVlbiB2ZXJ5IHJhcmUgcHJvYmxlbXMg
d2l0aCB0aGF0IGFwcHJvYWNoLCBhcw0KPj4gdGhlIExpbnV4IGtlcm5lbCBjYW4gc2V0IGEgdXNl
ciBwYWdlIHJlbGF0ZWQgUFRFIHRvIGludmFsaWQgZm9yIHNob3J0DQo+PiBwZXJpb2RzIG9mIHRp
bWUsIHdoaWNoIGxlZCB0byBFRkFVTFQgaW4gdGhlIGh5cGVydmlzb3Igd2hlbiB0cnlpbmcgdG8N
Cj4+IGFjY2VzcyB0aGUgaHlwZXJjYWxsIGRhdGEuDQo+Pg0KPj4gSW4gTGludXggdGhpcyBjYW4g
YXZvaWRlZCBvbmx5IGJ5IHVzaW5nIGtlcm5lbCBtZW1vcnksIHdoaWNoIGlzIHRoZQ0KPj4gcmVh
c29uIHdoeSB0aGUgaHlwZXJjYWxsIGJ1ZmZlcnMgYXJlIGFsbG9jYXRlZCBhbmQgbW1hcCgpLWVk
IHRocm91Z2ggdGhlDQo+PiBwcml2Y21kIGRyaXZlci4NCj4gSGkgSnVlcmdlbiwNCj4NCj4gSSB1
bmRlcnN0YW5kIHdoeSB3ZSBtb3ZlZCBmcm9tIHVzZXIgcGFnZXMgdG8ga2VybmVsIHBhZ2VzLCBi
dXQgSSBkb24ndA0KPiBmdWxseSB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRvIG1ha2UgdHdvIHNl
cGFyYXRlIGNhbGxzIHRvIG1hcCB0aGUNCj4gZ3Vlc3QgbWVtb3J5LCBpLmUuIG1tYXAoKSBmb2xs
b3dlZCBieSBpb2N0bChJT0NUTF9QUklWQ01EX01NQVBCQVRDSCkuDQo+DQo+IFdoeSBhcmVuJ3Qg
d2UgZG9pbmcgYWxsIG9mIGl0IGZyb20gbW1hcCgpIGl0c2VsZiA/IEkgaGFja2VkIGl0IHVwIHRv
DQo+IGNoZWNrIG9uIGl0IGFuZCBpdCB3b3JrcyBmaW5lIGlmIHdlIGRvIGl0IGFsbCBmcm9tIG1t
YXAoKSBpdHNlbGYuDQo+DQo+IEFyZW4ndCB3ZSBhYnVzaW5nIHRoZSBMaW51eCB1c2Vyc3BhY2Ug
QUJJIGhlcmUgPyBBcyBzdGFuZGFyZCB1c2Vyc3BhY2UNCj4gY29kZSB3b3VsZCBleHBlY3QganVz
dCBtbWFwKCkgdG8gYmUgZW5vdWdoIHRvIG1hcCB0aGUgbWVtb3J5LiBZZXMsIHRoZQ0KPiBjdXJy
ZW50IHVzZXIsIFhlbiBpdHNlbGYsIGlzIGFkYXB0ZWQgdG8gbWFrZSB0d28gY2FsbHMsIGJ1dCBp
dCBicmVha3MNCj4gYXMgc29vbiBhcyB3ZSB3YW50IHRvIHVzZSBzb21ldGhpbmcgdGhhdCByZWxp
ZXMgb24gTGludXggdXNlcnNwYWNlDQo+IEFCSS4NCj4NCj4gRm9yIGluc3RhbmNlLCBpbiBvdXIg
Y2FzZSwgd2hlcmUgd2UgYXJlIGxvb2tpbmcgdG8gY3JlYXRlDQo+IGh5cGVydmlzb3ItYWdub3N0
aWMgdmlydGlvIGJhY2tlbmRzLCB0aGUgcnVzdC12bW0gbGlicmFyeSBbMV0gaXNzdWVzDQo+IG1t
YXAoKSBvbmx5IGFuZCBleHBlY3RzIGl0IHRvIHdvcmsuIEl0IGRvZXNuJ3Qga25vdyBpdCBpcyBy
dW5uaW5nIG9uIGENCj4gWGVuIHN5c3RlbSwgYW5kIGl0IHNob3VsZG4ndCBrbm93IHRoYXQgYXMg
d2VsbC4NCg0KVXNlIC9kZXYveGVuL2h5cGVyY2FsbCB3aGljaCBoYXMgYSBzYW5lIEFCSSBmb3Ig
Z2V0dGluZyAic2FmZSIgbWVtb3J5LsKgDQpwcml2Y21kIGlzIHZlcnkgbXVjaCBub3Qgc2FuZS4N
Cg0KSW4gcHJhY3RpY2UgeW91J2xsIG5lZWQgdG8gdXNlIGJvdGguwqAgL2Rldi94ZW4vaHlwZXJj
YWxsIGZvciBnZXR0aW5nDQoic2FmZSIgbWVtb3J5LCBhbmQgL2Rldi94ZW4vcHJpdmNtZCBmb3Ig
aXNzdWluZyBoeXBlcmNhbGxzIGZvciBub3cuDQoNCn5BbmRyZXcNCg==

