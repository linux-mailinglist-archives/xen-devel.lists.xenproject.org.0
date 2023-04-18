Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EBB6E67F4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 17:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522969.812655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pon97-0004Cj-Fp; Tue, 18 Apr 2023 15:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522969.812655; Tue, 18 Apr 2023 15:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pon97-0004AE-D3; Tue, 18 Apr 2023 15:21:29 +0000
Received: by outflank-mailman (input) for mailman id 522969;
 Tue, 18 Apr 2023 15:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqrX=AJ=citrix.com=prvs=465e465d1=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pon95-0004A5-Pm
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 15:21:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6be02e-ddfc-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 17:21:26 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 11:21:21 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by CO1PR03MB5809.namprd03.prod.outlook.com (2603:10b6:303:6e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:21:18 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 15:21:18 +0000
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
X-Inumbo-ID: ae6be02e-ddfc-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681831285;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RqItxdo61GXy4k94QWiXwDyJBjp/jzETgPuMVBpt7A0=;
  b=RHZ6aeb4P4yYaylHniJNT2tiQdIDX3ss/xY74fUZ1FbVzO/P89x286hN
   uMNKC1jkxZQ6kp401rGHwHnjBQTg9mnPaun71xu7I14se6DIFHWjhJ2ey
   xAZmP0xeAwj0U6dyFCeCJpptvigkvEyPQLtM+1Tm3VLhNPXjHqaVIFmea
   E=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 108414613
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XgdNi60Bm9gj2owK0/bD5RZwkn2cJEfYwER7XKvMYLTBsI5bp2NSm
 2MYC2qOOq6PMGukeYtyb9m0p04Gv5fWx9MxQFA+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAlhQ0
 9NBKC4xfB2vhcyY/KmRG+Nqr5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlF0ZPLvFabI5fvSQQt5O2EKRq
 W/c4G39BjkRNcCFyCrD+XWp7gPKtXqjCN5LSOPhrZaGhnWw5GcdKjIPd2CeuMujiUC3Bst9J
 X49r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9BWwFYzUNQU0a4t3giIYphxnLQ5BoF6vdszHuMTT5w
 jTPqTdkgbwW1JYPz//ipQGBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHflrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:SsgyJ6C9A+Ko8VPlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:c3rlRmMa5oGQDe5DWxB50mFNGt4ZYHDxzln+H1SSWGxvYejA
X-Talos-MUID: 9a23:TtNBygqDDJ/Yeaq6DQsezxJAP8lKzL2MM2UUo48FtcDZLA5+CR7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="108414613"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQBFmxtiEV7GPYDOhWiDwMW49+asrAjmYG6KsEFU9k3m6EWTQpWqxsWvhU/KgPER85tiViwSxqOfxjrRec2WLcmiTc+IXkVqFsD43vraxOi7qqB+g+MRf+cBtjjsqGvXnyJ1vv5dzPguOpkWPdENFmyE+geelmCy7rK3m95StzVsdkV7X3akOjGdrmEYdir9j1tSAXpplIwcsQhlNcH0V/O5zt3accxe7vwR+4oIuM39kk+AY0UZKnRdCvasJI7tgyivI6yV4ymuuIl+M39fapK0wsGMU7XqC6+wBMoBsjKgj5Sh+VEVBeB9OIQU76YMjlRr+J8ZGenyNudOuvdJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqItxdo61GXy4k94QWiXwDyJBjp/jzETgPuMVBpt7A0=;
 b=AMDaYsXRwRlnXi1eCDn4iuxMUc8RFdn0I2xAhCNHXpBP3WsWmYxbU6GbupsuqSCkXZ/nUSMG4DEtg+DsA/D+7K+SfUHetGFEfGk0kSLD4VjMpbvKMR1/ODP5uLtyQKiIH260FPUkXyH2KKiTCzwPJXRUG9hm+CMSQJPp1mPMCjmnb8A8dgXVSv+VQ2ybpZUKMoBMM6OI5EhNPnpmc+69yY15RjulmOoohMyF/HwEBTiHAplNsiqSQqmyAa2uptOnISFw3zXB6OK8V04CMxmUSavZZtl5MqsLKC2NG/SNlERP81xqHyO5M0hGCadHK8EannCk+E46TaKyfcjaa3wXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqItxdo61GXy4k94QWiXwDyJBjp/jzETgPuMVBpt7A0=;
 b=IeoL6AP8JlUYeBEwm0Q+GbqbAjvDvymNiEUDHqtnggmoBtqqZw2KXfZjFVbgzy2VLPhiI6mRtzVBmF/OPI595D7d48OZKSnfLTs60AzhokMZci3QcYlK6665hrri7aMQZvAuovoXhzzABrH4MEsJDf/RxcERyHwuSImO2+IuzI0=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Jan Beulich <jbeulich@suse.com>, Roger
 Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>
Subject: Re: [PATCH v3] x86/livepatch: Fix livepatch application when CET is
 active
Thread-Topic: [PATCH v3] x86/livepatch: Fix livepatch application when CET is
 active
Thread-Index: AQHZceZuos1XEE2/ekWAsw5hIrlFZa8xLr3Z
Date: Tue, 18 Apr 2023 15:21:18 +0000
Message-ID:
 <DM6PR03MB53728958A3638343888DFEB8F09D9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230418111032.487587-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230418111032.487587-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|CO1PR03MB5809:EE_
x-ms-office365-filtering-correlation-id: 13bba099-b5e7-42e8-0692-08db40208ed0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HW5lAorSWA/SzeV2tY3P/eIYMBA0kKo+OAs4BCtfHWNHwOK3qnlElnjr/dWY6MC4DczrcmsxfntKGBzyBWKYdF6k6E3DsbBkcUVDwVxUNnqy2D7rN4eZYNsdqpG3zy9ijrncSCoAcwO6VdWxYbXNaPyR3IO+W1WXv7Mn1tSdGgD5B/E9/HCvbdTCmm42t61Jbk32o+VOrE9cxR3qwt2RM0PSlMqaCLd94yGLbUXWNDolMFVy+nMkLyXcGCVAjLFd7KpGObRMPBAUD25jNmwzYu8m5vT7R3mfExSIWr4jfU3C9yfCQIBOasHQNv/in1wptgklFAMdKGUemuLIHWYrxIX3u9Ygtm/4ucZW4XFp06XVc9uXrRewo7EJCv+7HwYio2I47X4/tbc0Tmjfh4ZHoUyxCxZ3HeA0vS0BLT8zy8TiaveSZ4VYmF3UxLV4n/5CRlvNUUJgG1Mu60kLKIaSnrioFFOawWvGJVduRaG3xYX3uA/obvtvhZCa3WxJq6CnV6JirikgJvgV2xDAwurpbl0TT9Hlw/4J4HfH+qCJ3cx8qoO3OXfiCOTrS2qt6D/bRsosU2xh9YChNTDgCoY8I5jmuolWdfgLcmYghcQNX1qjxussSmgwx55HesS43zvz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(76116006)(316002)(110136005)(54906003)(91956017)(66446008)(64756008)(66946007)(66556008)(66476007)(4326008)(33656002)(186003)(53546011)(26005)(6506007)(9686003)(38100700002)(122000001)(82960400001)(83380400001)(5660300002)(8936002)(8676002)(478600001)(41300700001)(71200400001)(7696005)(55016003)(86362001)(38070700005)(52536014)(2906002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jUGX3ZwGIyYDuQyxwWkpw5GuJjRjBSno7Ax4jN3ik+1tadZKBsPJ0yMLZ3?=
 =?iso-8859-1?Q?N30PHWYRB5Ca/7v6zQhZwXt6jKIqjbQc5NQBEsehMUySblk2WebuPjthwo?=
 =?iso-8859-1?Q?ZMTxNawi2ziJDblNKmvSOvxUAq0zGy3JMP34F2iT43yRaWhE/zKmdU2T5O?=
 =?iso-8859-1?Q?VCj752Cxmg7YCFG5eZYm6oVtsA8oZ14Jh2lelyqd31V5/Fl5Ome025t9Vu?=
 =?iso-8859-1?Q?y/54rSCZsOzyBEmSAXVBmJ0jXFJlv/JOkN5++sZD1na58IwAXbFFrWBwTE?=
 =?iso-8859-1?Q?0Q9AVQbz/jjwqzuKEiMC4W6F46EMm7k3I2Cxnummm2yRNsItA9DtdzqJ1s?=
 =?iso-8859-1?Q?P/DOGtPrDTFIXbslUmd8KIG+mdjC1N1MZ2Cpj+sz+w8Z81SJrsItaMpbg1?=
 =?iso-8859-1?Q?wLCS6LZAz48FX1KeOotjCEXFNNWv38dWw9hq/ZsngmHegDloD9dtjcqo6H?=
 =?iso-8859-1?Q?gTcBJDmM4P3g31GbAnzsleNrW8OyGzUrarVAKNCsLUOu9tI1wKzhYaUvmB?=
 =?iso-8859-1?Q?8SGVhDn09wFnqSeIdciYyBExvXXN+n8SXxAGZtzL/9HPT/aNlSd4LMcNaj?=
 =?iso-8859-1?Q?u/V7umayFk/EMczcTvvoRl8yBd96ApTkMPMByf4VFTe/zVKIXWSRZ024M1?=
 =?iso-8859-1?Q?Yn6EdFEZE0mPtJirPtsh3cMS1hICs0yCcPdwfO/bOkOuzmqZ+Y6q8CDhxT?=
 =?iso-8859-1?Q?iz/Z6kbYJ+Ffth2zCQ366pfyUH3SIvuHpXh0iaIUp7ANhz+/jmm8+iBoJd?=
 =?iso-8859-1?Q?yh63N6sN01wt2oVe4s5SGVJTAsdWUH2mOlZf32ngTT4EGrPHe9jPkCd2qt?=
 =?iso-8859-1?Q?ajTyqileFqpB5Td0iJlzl7bGCcbewIgalCMxGtCJbs4W6X+5XiLKu0y9Cn?=
 =?iso-8859-1?Q?EdHIRzlBYLJnNj9Bl70COAOxUMz39fL/W34Y3k8Ihd9g9ljubhpzUoTajq?=
 =?iso-8859-1?Q?A7vVNhdqJnuwB2mhJH/IwCMajuDefGHi5IWGBrjAajWgxtu5BkvVQ43Mp0?=
 =?iso-8859-1?Q?vgZNpMlAVDfY1wCglP3mEFALPIV3HmZB7ZdZ3lslkaYAIF9wxaon2B/MVj?=
 =?iso-8859-1?Q?b5Su8DtIl3Xnwp/M1e/a02WUpyKpQImocxGZfyR+E5e9vOGbLpjJFGODfc?=
 =?iso-8859-1?Q?3itN1ADVkx8zSpvGpvvJtC+rUhYS7OMyxrNSQc2shqgWgafx0tMvilqhZv?=
 =?iso-8859-1?Q?NBg3yWIUTAXOgyur5IV3Kv8OagnKMJXYo+hAqebvnDSz8Ypv1G94Fmg3dp?=
 =?iso-8859-1?Q?B1ws8Izf67IdXmBc9I1L3UdkfVBy3pWt0sdVGa7diAl8t6xF65gvdXTjMO?=
 =?iso-8859-1?Q?0XlAXKPI8AiyEtaIFEDzwuIN3Oe4gcRvb6IOteuPecjGM1uCUTcHlMHhID?=
 =?iso-8859-1?Q?7NlDq5aeGylrzUZRopd9MKpTEoUHoKjw7+Uv81tvhunLjvM4zA5lig8Cv6?=
 =?iso-8859-1?Q?ajzxqhWWebqEANYZjrz5arh6GeQhiDA4i5TTvjrkrP7gi4UB3tIW7t0KiC?=
 =?iso-8859-1?Q?yEV+gRkHeK8eECjrhJ1Zqu4Nar1bv56GaO4mRdvbpPcODkAJ+bN/wID44z?=
 =?iso-8859-1?Q?L/mmJHQsfd45SWUekC1l5tmDCCeUucXKvGKWrXl+tuYnnrW+nCpxmotFQJ?=
 =?iso-8859-1?Q?lyS5TVfynwK+CpcIo8d20YLFHasFFo5FDW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0CbBQO0bQIhdjSdOsZUPwi41NPlD67pN7uSAkZZCj97sAWhAYwkc8D1BU8+NGAEjgLdxcuVvF8pPr7DCIn/i15DSQT6MhnBcjoPknYIdD0BEhJqzGbPesWAfZL1S96JgFX/4hxncTdIuMJ+rsEjf2UCTXAM+r1lVWUfYsDH3pSw9a3bavxDFFKmzd1y8gOrYPsbpWRJC8bjbyL0juXGvAr8ssVPuu0x9zbxMOGs/mRYYiETOqIAbhkz9BTgd/y4Y8go1HAjAVnjqnj5BMjHuv3Pr3b4lN8bvqTzKaCyPXpuDMSSo1nFfdMOXHj1lqmBf9yyniMyRZKJI8TSa2kmdW2cCJj0Zcq/6SecdEcZ+OoSb2FZw0xbkj2BJIghQONLyv0ppxDEdibyo/dzWb6h8SCjjQAFCUOUJzui/iWIL6VHNwB+qwgKEluJuqxJ3691VMiCu5wG3ILahn1v6lh98V2ahDsiX8L3t1Nh3473MMLYUMBZP8tuF0JXMmCx5YRPJJ9Z7UAe+VLYVhSLnVWo7IgpBgVEp9hJyJGpu36550YjIgS9MCeXpnj1SOlgw/wm/Shs3b34C4fVmNoB2e/miXDhXpt9SIiRJBx927txsLS7jRKE22VYppkswItVef586xk8b2G2f7GzZ8jKSkAQ6n2HKFifiLPahIi3h+liZ6X4nDG2cJiSK0SfT9psnQxpzJhI6Hq1qDZvjsXxBbBLPQEBV4o0LQpz/ejQAz7cVkPwekt10EN+96voIzc5GrSZ9fYOF8hE8FhAspcTEpYEFGxKiPnR5aYcwl8eN0SCLrQkbTSyVtj8GfsK8BrxGncb71I+CxMP/jDDH+vrxTxVyccaNP5f2ewwk953X03XzIFs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bba099-b5e7-42e8-0692-08db40208ed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 15:21:18.1598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9dCwUxqTK+dwT0QYgEkOrid07tdKkEuLbwOpTeNYhXqX5CeOE45PNTSeTCYfXnQyU65aX8LvGqKsfHV3+QbauQxOt/A2sqqq8wseLG9zYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5809

> From: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Sent: Tuesday, April 18, 2023 12:10 PM=0A=
> To: Xen-devel <xen-devel@lists.xenproject.org>=0A=
> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; Jan Beulich <jbeulich@suse=
.com>; Jan Beulich <JBeulich@suse.com>; Roger Pau Monne <roger.pau@citrix.c=
om>; Wei Liu <wl@xen.org>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; =
Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH v3] x86/livepatch: Fix livepatch application when CET is =
active =0A=
> =A0=0A=
> Right now, trying to apply a livepatch on any system with CET shstk (AMD =
Zen3=0A=
> or later, Intel Tiger Lake or Sapphire Rapids and later) fails as follows=
:=0A=
> =0A=
> =A0 (XEN) livepatch: lp: Verifying enabled expectations for all functions=
=0A=
> =A0 (XEN) common/livepatch.c:1591: livepatch: lp: timeout is 30000000ns=
=0A=
> =A0 (XEN) common/livepatch.c:1703: livepatch: lp: CPU28 - IPIing the othe=
r 127 CPUs=0A=
> =A0 (XEN) livepatch: lp: Applying 1 functions=0A=
> =A0 (XEN) hi_func: Hi! (called 1 times)=0A=
> =A0 (XEN) Hook executing.=0A=
> =A0 (XEN) Assertion 'local_irq_is_enabled() || cpumask_subset(mask, cpuma=
sk_of(cpu))' failed at arch/x86/smp.c:265=0A=
> =A0 (XEN) *** DOUBLE FAULT ***=0A=
> =A0 <many double faults>=0A=
> =0A=
> The assertion failure is from a global (system wide) TLB flush initiated =
by=0A=
> modify_xen_mappings().=A0 I'm not entirely sure when this broke, and I'm =
not=0A=
> sure exactly what causes the #DF's, but it doesn't really matter either=
=0A=
> because they highlight a latent bug that I'd overlooked with the CET-SS v=
s=0A=
> patching work the first place.=0A=
> =0A=
> While we're careful to arrange for the patching CPU to avoid encountering=
=0A=
> non-shstk memory with transient shstk perms, other CPUs can pick these=0A=
> mappings up too if they need to re-walk for uarch reasons.=0A=
> =0A=
> Another bug is that for livepatching, we only disable CET if shadow stack=
s are=0A=
> in use.=A0 Running on Intel CET systems when Xen is only using CET-IBT wi=
ll=0A=
> crash in arch_livepatch_quiesce() when trying to clear CR0.WP with CR4.CE=
T=0A=
> still active.=0A=
> =0A=
> Also, we never went and cleared the dirty bits on .rodata.=A0 This would=
=0A=
> matter (for the same reason it matters on .text - it becomes a valid targ=
et=0A=
> for WRSS), but we never actually patch .rodata anyway.=0A=
> =0A=
> Therefore rework how we do patching for both alternatives and livepatches=
.=0A=
> =0A=
> Introduce modify_xen_mappings_lite() with a purpose similar to=0A=
> modify_xen_mappings(), but stripped down to the bare minimum as it's used=
 in=0A=
> weird contexts.=A0 Leave all complexity to the caller to handle.=0A=
> =0A=
> Instead of patching by clearing CR0.WP (and having to jump through some=
=0A=
> fragile hoops to disable CET in order to do this), just transiently relax=
 the=0A=
> permissions on .text via l2_identmap[].=0A=
> =0A=
> Note that neither alternatives nor livepatching edit .rodata, so we don't=
 need=0A=
> to relax those permissions at this juncture.=0A=
> =0A=
> The perms are relaxed globally, but is safe enough.=A0 Alternatives run b=
efore=0A=
> we boot APs, and Livepatching runs in a quiesced state where the other CP=
Us=0A=
> are not doing anything interesting.=0A=
> =0A=
> This approach is far more robust.=0A=
> =0A=
> Fixes: 48cdc15a424f ("x86/alternatives: Clear CR4.CET when clearing CR0.W=
P")=0A=
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
> Reviewed-by: Jan Beulich <jbeulich@suse.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com> (live patching bits=
)=

