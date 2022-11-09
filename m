Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7D62277A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440774.694947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshhj-00052W-65; Wed, 09 Nov 2022 09:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440774.694947; Wed, 09 Nov 2022 09:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshhj-00050f-2M; Wed, 09 Nov 2022 09:49:07 +0000
Received: by outflank-mailman (input) for mailman id 440774;
 Wed, 09 Nov 2022 09:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oshhi-00050X-Bd
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:49:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be1c11bd-6013-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 10:49:04 +0100 (CET)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 04:48:50 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CO1PR03MB5842.namprd03.prod.outlook.com (2603:10b6:303:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 09:48:48 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:48:48 +0000
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
X-Inumbo-ID: be1c11bd-6013-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667987344;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bOxXToXWwbp92YVZPk3fKz3PonQxvuiq2f6LNxKjvF4=;
  b=DNcMgiwp7zWZ5lCDJOpCic8oaisOQBRsGnxFib1ZmjsRoKDq6V6JTpig
   Xgzed9Uaw/2fWEVjR7Ijdh4QgmWnDd3nY5Yt9/wk7m+GM5FDANaZUNHxJ
   NFjYYaYQuFoAWNafkVqb5EtPJxEQxGzAmm69tFbmbrlEEDnfkY1cCfnQv
   E=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 84477279
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jVstfqwoaxXgEEYJfZR6t+f0xyrEfRIJ4+MujC+fZmUNrF6WrkUOz
 2EeWGuBbqyKazSgeNF2Pork/ENTv5+AydVrTwU9/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPaET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWVE0
 uExNwInUiKCqb2x+LGrTO58pMt2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMtuFTuGIO9ltiiSMlLn0Deu
 mXc+GfRCRAGLt2PjzGC9xpAg8efwX+kB9hNRdVU8NYxgkGtzGYsJScbUEqdh/y3yR6uC9Bmf
 hl8Fi0G6PJaGFaQZvnwWQep5kGNuBE0UsBVVeY97WmlyLfQ4gufLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqaSYaQCMf7tLkoYV1iQjAJv58FIalg9uzHiv/q
 w1mtwA7jrQXyMsUjaOy+Aibhyr2/8eVCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pn3jxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:LDMrw6o4S9avBJ4U0dRtZzEaV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZ+w2a/pgVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLggFkPsulqSRkoeMNIbDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84477279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPAkXIeini8EQ7xBBj/tVQrL/70x+afWcl9o0o6JebHMl9dWDc9fCBzLwlIbn7SnY7nIfKwdyc+8AbCI0ckI5Tv+ydAZ30zhAh4J58jSMCOxwJfYKty8mnj+moMxJ1POUCwjvsagyR0o93LGxs+28XVjXSwwTr0nnmiLGCl+NHXHo91+PKarGpPwAuR3++fu2vcy7dBCMRbwAw6E7n9B6LN4SpmcJFwuFmMEHS5iPmH10vJEMnNGj+XP9/lYh1e2IgUJoz9iVvPqfJ9zgxXI3zI/FRd40U72ysl+dy0HQopGK2M++pAX/iYAaFj5MHakw9o1KAmXUMJfxBwv7B5vIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOxXToXWwbp92YVZPk3fKz3PonQxvuiq2f6LNxKjvF4=;
 b=IY6plBxGDqDqd4Ke9TcL8k8/p8O8A8I102XaYJi4J3TTGnsqZynS5hzlDwStA4cVrs1zi3MDDMizy+1qSRDg9ohM4hIWpTAsvg5v43GFNIWS5JkfXgZxmM8PWEV8GDkGOXf2e3iTOo3ZYWcYHSSkZ5GzGJL+lpGKKtXr0fqREpirEo6VFWoYbFKfc2hhyNHRABbYEtUqL75VIOWSiOTh5Q3O9NaM/j2tTtVwRM5A3fTSyukdtE4KtLsO9jUz0WzQpbXykrPZWTCyy04DkDCrOVuEx/f/aZPkfz2BsES2pdQrYCcRX153ZF/Zivgn5Gt8Fkl0fX4gXM29lvmQ3QCMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOxXToXWwbp92YVZPk3fKz3PonQxvuiq2f6LNxKjvF4=;
 b=e9ak1bpybhgXnPXvDrx7FCNr8tp6sNHYE2b/Jmx88KMizuf8KQB5fe6WI2Olwe/AbUQ1CbiHqRanRet7u9LAkYG0qiL1rwiPpqe7ZYpHH5bO80jK+5ghz0uKUyyix3mpstlXLeRT+BIwkYDp15cMJQ5dtkP0sIyp9xlu7z/kzfE=
From: Edwin Torok <edvin.torok@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index:
 AQHY84fA+Ym2JRve3kKJcIO1APAKeK41MEgAgAAQaICAAAaygIAAAw6AgACiiYCAAGzVgA==
Date: Wed, 9 Nov 2022 09:48:48 +0000
Message-ID: <8C5A0430-A754-4D1A-9E82-DBC751849478@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <B27F889D-619C-4D34-92F0-AFB95DA84547@citrix.com>
 <1f8c90cd-8037-84eb-d6f7-c639f8a87585@xen.org>
 <7BD7C0AF-0D72-4125-BE97-8AD5FC15CA93@citrix.com>
 <AS8PR08MB79913BFE50B314E2ACFD8936923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79913BFE50B314E2ACFD8936923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|CO1PR03MB5842:EE_
x-ms-office365-filtering-correlation-id: 9008e39e-9c3b-4c8c-e8bf-08dac23799b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6g5r0WbPSivFqeFUS55BVyRUyQp+mmgC7Hty5cZ9uhKKQRpL/HMy0ayAH9kQ7FvWKRpWuVhh080rk1EfzOq+lVO2jCDZN5vSgYAqBAmy4mnd/RToKyOkEGZDDAPwGMytaNJLQyPae1mG77DFacs9/lZauv8+C0yR+9k8ZynaQYWX9sclG7zegRzk0VM7jOoq3Q4U2SIvFGjHBELlm2jaIkpJxMAWNcbF+nn3ME5vGweSbMVOcOlCSBvFw/J38OWNDsHraoSRQ0et938YDK34bz1T7KtFN//iBv+PekENtBw5++1FxfnNM+71ZZ/6oQ4XVZNx+7hCz17G4+tO/O01lf7Gk012RfhFlo6WOZ4lRfkebGNQim8I65w4pHIyf9EDzY+2bfXJpSptV/TNnr2MUXpkX5SPF3G0I/P4v7pNwS7FuayFV7EBNVRyFYw+ggdR9ifXYQ470B16XGDRJ29ALP7ksfpUBSnFnUIrXZburi8S2KpD+gYXiPilYMPU57k/DIJ6LOEAyFvRMkzDKTNWSkOR2QJg3bz/CFbATdCbxna/TfIBr5B6VZsP0WOKOmTPvVRU/y1H3lb3dpaKLUg6sDZHaD78fOEFwqHFW4LTN6pvSPiesdx0XHMTObHUb56XIcTwo4QUNcnsT8VGL5jBX7b3xhZfZniVShmGR62BQFoyH8DlRR/fZMerWQim5aJcrNTyUISUA+QmdISiomSVG2C9PXBhv8u3KjpN2PnNxuDUfrG3x6zAAK+HlL4KB66FU7tB46Ga1UkbVUMaPwkXF4sxqqV58dwIyacn35D7OVu4DJgv59pyAqAC/qsBX/Wss8nMPYm9lqSwLO33HqTP5FosUGlXWY22BLqzpoUVAL5f7reDfaNED4oJDuupQoPn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199015)(966005)(6486002)(71200400001)(478600001)(6916009)(38070700005)(45080400002)(54906003)(107886003)(6506007)(316002)(4326008)(8676002)(33656002)(66446008)(66476007)(64756008)(82960400001)(66946007)(53546011)(91956017)(66556008)(76116006)(26005)(122000001)(38100700002)(6512007)(86362001)(8936002)(2616005)(186003)(36756003)(5660300002)(83380400001)(41300700001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BY5JYbtlx2M+obLCjzslGa0xbnjIWiOQYPxpEiORi3yHavIB3hZ6+MIsQ1E1?=
 =?us-ascii?Q?Aixf6iwd6T5ECySV3ZSvAC9aLEXjdKYOGB5ougsidfhN1HN5T2yOem32G0aX?=
 =?us-ascii?Q?NRn9UiuxDa7SQpNpya3n6peFu8S4BXSuZoOMfTbnuh1I0CPSWkgU9XiDOvPQ?=
 =?us-ascii?Q?SHR57jDzt7xFCiYOF05Qe5qaHHzu+ecyBflNign+qk7zYjxLBjE+NWxp/bcq?=
 =?us-ascii?Q?QyMjmlpMZ9TDwhFMW7qKN2x8TuLLkrD0BWTVsHsr+t7g5yxmSWdP3KAa6tKA?=
 =?us-ascii?Q?WhT66EduixfYBvGTmtRoPkdXS521JUVIgRv+54AsZDN8ZxTIx8KiYtAiN4sa?=
 =?us-ascii?Q?khunbIbjL9Js3f1AqnVbLeCA+gChcyIScskSy/m+nYYHNtSXv9WDIOdL2drV?=
 =?us-ascii?Q?prWEtFWvsPUtjuDggQuLiV/I7nahakv+0UWAISTAldBRzUfQUe2gd9a8viY2?=
 =?us-ascii?Q?BUiLf5WMET6yZL955LWHPdjl3TCzpPBBh+648vIWQgP/XHvd/l8QCg4vLgmr?=
 =?us-ascii?Q?i8ql/AOco7s9qOPCLobDpKTLG35TQ46UCiCfDbhUG+hXEeA4ArHmRkCG5jBU?=
 =?us-ascii?Q?hf+bkckae3btcnt2QqDxX2vjczOj/bc7PBJ5tynYMourARZiiLoZk53sK4II?=
 =?us-ascii?Q?OF7QpkJlPUc8HOH1oAFXrJ5XSsLVdc5Vsh1o9NnsNqBLSZ5IpZmS0vHpUlC0?=
 =?us-ascii?Q?2TdM+eL2J7i8BwMRripSQtKVF9BnjVGIBK7gwXPuGFGVDYbWOmaSmcbDAhGm?=
 =?us-ascii?Q?zA8OmfpzbqRNLvMlfGflw2+i5KbVRdQRLHt/9GLmV/uOOIEYN5y5LD4LCboG?=
 =?us-ascii?Q?3SVnM0YoPiE9OAlAN5/jRliGDoSt03V3Rl5DCv4UQxCxFC6VURI0IswdoXLx?=
 =?us-ascii?Q?vGFZhbKgZIEHqK646R+hqm5KgjvHx3eCCTHhMxWiebbeFlux2rUm5rZVLNLo?=
 =?us-ascii?Q?cfXrkpBMWFxfvNnFIRAX5xSlHegAyWEYlzbGDpGK2Qnepb6iZUyRHg5jkKzf?=
 =?us-ascii?Q?/r1nul6y4M3A0wE8z+eCcUEDM7Y2p4xuZEVtXKtIgwqIngXxeMjGJFUBM9VD?=
 =?us-ascii?Q?WteaKUvVkuKIRW11DrA/IiSIJ1jyujXHRl/7zVj2UYDWC6MCOMion67MJGXj?=
 =?us-ascii?Q?lHd8kZgFnkB3nKwEB4zHTNV8bDSwDzR8IsyAvCKdNYeUv01vEnvCg/Bnzgb6?=
 =?us-ascii?Q?CzmRyJiPnNU87Xx8UlL8to2vezFhdxdAL0g5M5VKXabc8nSzLZlClrtL5G+E?=
 =?us-ascii?Q?sYpS99LLsQn5+hxiFS69YJlVnh5uuU2ZpRTAYn6E9R+3bhEE8gvnpj9VaS99?=
 =?us-ascii?Q?YO1vM6KEtFwOcaukhktEc8LkaYc2qQATlR7Mb6sHP6HaHR2oVuOEltPZ38sJ?=
 =?us-ascii?Q?8zmLeE9t+vz3Ai8hZWvooyXXk1dVP1UeqlXD3WbMp4HN4ZkqqhbwYxHFVe5H?=
 =?us-ascii?Q?uIiPm/4a7P++CCWSZAl6QraAIf2uF4a2fMyoRrq9+9ruX5CRwSy3LGVamza6?=
 =?us-ascii?Q?mUDO/suQr1fewj4VWHbdL1mNpXs/qeXTw8vUJdwS+J6EIeeE/zfNYYhoT4/C?=
 =?us-ascii?Q?9SFskO22Wzus+yLPfdWsa+vLvSjaWnogPMOdUjZy+5UbUUj4QxxBLZ6S3w/6?=
 =?us-ascii?Q?LQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E4C7FEB6098A094382E61D614ECC1E7D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9008e39e-9c3b-4c8c-e8bf-08dac23799b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 09:48:48.3809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ku8PG079QUffxVHcnaMQHMjQGM3htAP08wjeQ4IhpnYLl2l0gUIw+D+8Aa1C+666uDyOFoZyc28nEeAu+onvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5842



> On 9 Nov 2022, at 03:19, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Edwin,
>=20
>> -----Original Message-----
>>> [1]
>> AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08
>> .prod.outlook.com
>>=20
>>=20
>> Hmm I thought that is my Outlook rewriting the link, but the archive at
>> lore.kernel.org seems to have this mangled URL as well which I cannot op=
en.
>> Could you send it in such a way that it is not encoded when being sent (=
e.g.
>> base64 encode it...)
>=20
> Appending "https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flore.kernel.org%2Fxen-devel%2F&amp;data=3D05%7C01%7Cedvin.torok%40cit=
rix.com%7C1c7455639df84f970eab08dac2012fce%7C335836de42ef43a2b145348c2ee9ca=
5b%7C0%7C0%7C638035607613905983%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dl0oQ0815ndwWt4buGasPYYmVV3FdnrC%2F4wKrIoLqki8%3D&amp;reserved=3D0" befor=
e the link from Julien
> works for me. But I think the link is just the release schedule :)


Thanks, this link works indeed (it is an Outlook message ID after all, not =
one of Outlook's link rewrites):
https://lore.kernel.org/xen-devel/AS8PR08MB7991145C8063D6939AFFED8F92829@AS=
8PR08MB7991.eurprd08.prod.outlook.com/

Best regards,
--Edwin=

