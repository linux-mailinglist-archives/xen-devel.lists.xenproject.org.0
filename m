Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C6650A766
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 19:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310399.527231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhaxd-0000Hu-C6; Thu, 21 Apr 2022 17:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310399.527231; Thu, 21 Apr 2022 17:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhaxd-0000FX-8s; Thu, 21 Apr 2022 17:51:21 +0000
Received: by outflank-mailman (input) for mailman id 310399;
 Thu, 21 Apr 2022 17:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhaxb-0000FQ-OJ
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 17:51:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4d9bd77-c19b-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 19:51:18 +0200 (CEST)
Received: from mail-dm6nam08lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 13:51:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4593.namprd03.prod.outlook.com (2603:10b6:408:95::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 17:51:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 17:51:14 +0000
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
X-Inumbo-ID: a4d9bd77-c19b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650563478;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1vn/PgBwFiDyetdTn8eGwhnUC3ObMABA8btvfgynp7k=;
  b=OQ+hCnOYzD4qh+VfZgePWU9Pk5fonMF7o43kIFNUP0Tj40igcMCInkM/
   CDq8k2LeTxh0rn0JN3rFMPyqhs2rXSg9b6VivSpBOJC6wWA4/O0cCTpoM
   pv1vbzDYCtKvMoYI43EHTSNgNvdEFkZuhsfhYVgf3/GI0bPua7+bNQBGu
   o=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 69039406
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F7gVSap57BXUvnuiB0AeqM/69rNeBmLvZBIvgKrLsJaIsI4StFCzt
 garIBmEPazbMWv8et1waI209RwEu5Hcz4JjHQc+ry9jRXlH8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4qq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBB7zAxeYSbx5kEQZjBKMd4YfiIUmHiJnGp6HGWyOEL/RGKmgTZdFd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkHh3Fs26iiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvTmLl10tiOaF3Nz9fIbSWPhJrGChg
 l3/0TnlBikwPeay1m/Qmp6rrqqV9c/hY6oQG6e/7eVCm0CIyyoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpasEitcIwbSwn0
 BmOhdyBLTZiqqGPQHSRsLKdtyqvODM9JHUHIyQDSGMt3d7np40iiwPVefxqGqW1k97dFCn5x
 naBqy1Wr7cZgNMP1q671UvamD/qrZ/MJiYq4i3HU2Tj6Rl2DKa9bpGswUjW67BHNonxc7Wal
 H0Nmszb4OVQC5iIzHyJWL9VQOzv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:AIHvKKkDFfpNu02CphWEIOkZDRnpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69039406"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QenYwEKeYmXpmfrTkDYXCXd0hrRSk2xKSqfJ6Njujf46Un3o7C3AdLP/NbbMNrp1oALynLksoep4hqKRzWMBs/5e40nh20a3Ts3L2yNXfiBJy3PgHnaIsJ9ll9prgDPrMF31QNdk1RK1HMRwbRfNVcytd8ttqAIGpXryEPtlI+7EYeOryiVXlRzLSr/0SA9uyxDU36CTG4/T8iCvolmYfLGd3K7kNx/wCtVSBxPikCTuutEJ0TaokLlzjcB07PjOK0P/Ec085EMNjK8a+fpy796UMu1E7YrUCrohdpb2FZJIbZUUONFqVd+0Lo9rCezFhpvP4hFklzj2PjxypSjyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vn/PgBwFiDyetdTn8eGwhnUC3ObMABA8btvfgynp7k=;
 b=McY5aTJc5od6p87FbsOd/GVf30cKJRkAp4dXHUX8KXzH2+IKRLqHT7Y1y5DkeNHVIqeIwaeDyjlSJDUqa6LzdGQKjoZEFbwNf56yT97mrUJyl/D6ACMq61OdQolI9AenFELsSqgcKLwqz8mt4NKHx9lZIDT+6T/1Hmq3BsXvNwKeB54xYe2/R03Af3+11VftQK6Gfk2CwsgU7djjPLXPLmI8L4KbHQMYwDLzVZqtbaUMsaTuHms1MoeI65XhMmmz9KfUvduFHnXty/BTgq1O6vEU8StACD6DoQx3DszC+Z5mhIfGwoQj4gzW8e2nEOUTJ2S2aQ0c97f/n1isisCLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vn/PgBwFiDyetdTn8eGwhnUC3ObMABA8btvfgynp7k=;
 b=CP1oLh1Jpdod/vSYYAHRfKyTTRmx0Q/XNFIPbNvE4240t3Pci3g3WzaJv0ArE22Gu9z2ykLktffYkyD9aZjAuajq0ithDWxXZntZIDBMopQq5eMbdRjAo3KNFuswAgeSAbzy1B8Glh+PZPOgLMB0dfUheUXFXgdyu/7CPnxv2Y0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Thread-Topic: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Thread-Index: AQHYVHuOvzYJLKPprEuLadRqUVZq9az6p9GA
Date: Thu, 21 Apr 2022 17:51:13 +0000
Message-ID: <0c8f5600-0a2c-5ebb-e83b-d902d0b74514@citrix.com>
References: <20220420055736.27901-1-jgross@suse.com>
In-Reply-To: <20220420055736.27901-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f07d1256-4c77-43e6-cdac-08da23bf8733
x-ms-traffictypediagnostic: BN8PR03MB4593:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB4593C359CDE71D891B007DD6BAF49@BN8PR03MB4593.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BUaZ9N0iuHAo7dPcFJ4W7ST7GNTQq+Pqokp3E8yBcgZM9OiiBEehSL+lbuXN2fCZIlLPqdZy8clZ5qF6ryvrZiTSQ5l4GYT3qA0RXxZ5TsDqt9shraCUdMXqCF0PjY+/AYHv0IMvOpHj7spkRaHgnvmFkh5fUVcIcv/SsdxU3OSAq18VcnZXHrQRvGD1/xzbIc+VSviYuVCk0ODhBaRrJCbNOLf8jNhQ50upgfO6lsHG77yau9muyqpHhShFIlXOn9Q05txgxlaC6S3ACspLwq9Qb60zxMkD4wDbLjdulP8hZ23UYoPHtsueqCk23AhDy8YvfnGnpO0IT6ThZ5LEjBcI/aipEvzdIGByldQEBdgiac9jH55Hq8mNMhTu3xwJgE306UzkIKQK3ajHeezhpD6kxq/azrcKknIlFK8y4ttDqMVZqr0dbuGtB0QJMQCCaATpedrxZ99VXU1sRvE1afWVbnDEMdZ8gIXVV7WICoQq6k2bllzytIiFGich/6MD3BZTpLjVUdxYK1iA37N93Saf/wyjZbKy/pdbMn+lL1m92q+SWdHdstMCNY1ZqNzq66sNtJe1OoRizV460ggeYMV5Yw1XDDVrMpuEyY9+P6E+wIEelSHFzLFXKf0TBfc0zhJPyGDMS1kmgFnSfAkpW3n6RE5eNp/tkuPDE7ndj+xanWqNql/6wMLko8AAp5Qjxq6y6J2691QFrr+3/itHFt2gT8j1YSOr2QWoYNVSyUJmj8ywPsB/Hpp2cqZ36gk66ZvDa/BJKDXeKi1euqRLEg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(38070700005)(5660300002)(76116006)(508600001)(71200400001)(64756008)(26005)(4326008)(66476007)(38100700002)(6486002)(8676002)(66446008)(6512007)(4744005)(82960400001)(31696002)(66946007)(66556008)(53546011)(316002)(186003)(36756003)(122000001)(91956017)(31686004)(6506007)(110136005)(83380400001)(8936002)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZU1iU3ZBY3dIODh1WnhVN0dHN1kvdFdsTE5MR0pEOWx1V3ZMdFlHckMybXlJ?=
 =?utf-8?B?SlMyUEFCK3dGYjdYVGtjeGd5enBxNFllbFJvcUNpUUhDcmFTOXh1WTFoQ2Zq?=
 =?utf-8?B?d3Z4UVhjcXQ5U1diaHBLdXlmRWl6cDNnZTR6SlZzRjBHUE9vRks2T2dBQUlL?=
 =?utf-8?B?ellWdmNpcDlid00zVVo2c3BMcmRyUjQrMitDRW5DT1J5L2xMejJESUFrZkpX?=
 =?utf-8?B?NytRYTdWYXp3NnV6M0dGT05jemdCUnd1cjE4aFQzbndUMVZxaUtaT1J1eWpK?=
 =?utf-8?B?TnNaWXBtNWp6dEQrY3NWcUNZWDVDZHNLd043ckE1aW5JSllwWnRkS2FyellL?=
 =?utf-8?B?SUxVWUlFOEJFZU45bDVvcmhxeDJ3dXQ2T3pyUXNCbDlwVDJ0bnFzYjc0Wis2?=
 =?utf-8?B?dE9Ya3JYaktpWTRUamkzNE80d1hYNkxJVlFBNUVzKzJHaHZEZHJzYXdaS0FC?=
 =?utf-8?B?WS9IV1Q0WWYxTTZGTmcvK3NDOWg0ZjRNYWIrbUdZMkhBZDBGTnQxalNZTlVa?=
 =?utf-8?B?aE5Eb1ZZNTZoYjZnaFVETWpyNnNJbFkveDFxeDhEdC9BdFlkTG4zWStJdnBB?=
 =?utf-8?B?YU95NFZ6NXRzdXllT1JZZFB2WjVzK1JOUDYrV005YU5tcW1nWVRTZUxoMjB1?=
 =?utf-8?B?d1JnS240VGlmTGJlRjBOY1kwZFh5azAxV3AvQVI3MWgwTUFUOGwrYXpxemd3?=
 =?utf-8?B?T3VnaVhSMUVkOXlNa0VMS0hIeGhWYTZkRDQ5RHZLTVRNZ2g3TE1yYXFjN2V2?=
 =?utf-8?B?V1AvZnVuNGlRQ1Z1V0dwbGxCdUZhU2tscWhnT3Z6bU05a3hYYVVHM2lIMjB4?=
 =?utf-8?B?MmpreUV1VFpxZXpnZThhZ2p0a0VsdnlOWE5hRkdyWWNWUkhUK3RkWVVFa25S?=
 =?utf-8?B?UHNDQmdxUzRzVXRNRTZ6L3ZwOTJYcklSUUJqcTk5YWlzQ2NPY1pCQldGUHpR?=
 =?utf-8?B?TDA5eWd4MG11dUxkRnFYTFlJckk0cUdXT3pxQUJJS0E0Y3l1MXkzT2tMdll2?=
 =?utf-8?B?MGZrbjNZeXFydERVNEZ2N3RFa2d1S016ZlJEV3ZtZEppTXVuNHdlWFpHckZ5?=
 =?utf-8?B?WXM1bVk1MkgyVHYxRVZ3czRxRUtzM3F0ZUlITzNvNU5IZmFaZUlRbnEydWVR?=
 =?utf-8?B?aEtPalM3aTlHVGY3ZXZNUHFJblJrME9aZzBHVG5oUXVhcUlUQWJWV3BxeHVW?=
 =?utf-8?B?TU9MVkVHTzZkOGxoWlFNNk8xdEZDTVBScld0S2xSUlQrMWxnV2l4WWp3b1pr?=
 =?utf-8?B?YXA4ZDVFT3crbW1XN05Ec3JmcXJSV3I3TU90WUpabS9UZ3FxUVNMb1JKK2or?=
 =?utf-8?B?WW5STkViMzJRN25ScjVycUZQQnFrdU1WbWFrZHc2ZEpOKzlrK2E3cy9JQ3Vu?=
 =?utf-8?B?eWc3bm1rbUwyQW13Qm16VXkvV0F4d2dSZXovcEFPWjUvOXNTM2RLRi9PM3hY?=
 =?utf-8?B?ckhUZy9mK2YwT0NyalJYbDQxSGJOT3ZpNStSdFZJdGxLT0l3alF5RnluTUpL?=
 =?utf-8?B?YnpackVlS0NwMUEwaHZwUVM5OHhOY2pWNndKSXhZb3E2Um81Sm5qeTRReTJX?=
 =?utf-8?B?cFlHSmVGVXowUmtQVktKdXlONnZIM2JKMjByQVB2RWN2d082bjhFL29rR1JX?=
 =?utf-8?B?a3hmWkdHQVhFek9CY3JYWDZ6WFRSRDNQM2gvUUpKL2hqcVhsbk1xUFlpZGdE?=
 =?utf-8?B?VHVEOHhJZXlFZE14eWd1c2lBNmhRdEVibDRnVzQ1enZzRTRsUjZ2UHBVY1Ft?=
 =?utf-8?B?aG9ZSUVIMnVVOW9rN2dZMjFvQU5lUWRibUF6TlA2eWRJKy9IWHlPNDJaWGk0?=
 =?utf-8?B?TFNoZEVpd3Bhdko5L1UwUU13OW42MDdYSGxkQXB6ZnF3cnNTRWxrR1l1ekt5?=
 =?utf-8?B?TVNJVFBvdXNHQmplc0FSWnp1cEZkRWYrQ1hrZldHeTZIdTlXbzgya2c1bGlB?=
 =?utf-8?B?VDRnZkVhVkUvQUtJT25MZ1hPbGdkcmxueVYra25vV3NOSkJHSmVubCt2WVFV?=
 =?utf-8?B?NStGUzlBYXUrUFZpeTBLRTBrdmpybzlTYTZicGg0dTVaTHY1MVBKbzFwSHdP?=
 =?utf-8?B?RXlBSytyRjNoWWI1dUMzcTdwaVJMWG9nSmJnVk0yK2RyRDJYMjdnSVkwNlhG?=
 =?utf-8?B?MWF0cHltWHRxMFdERVhIR28zNi9RNHh3dmsybi9XYUk4L1F6elovY3lYaHdT?=
 =?utf-8?B?K21sQWFZclhjNXNrVkp1aTcwWmhFbFlXa2NZRU1YM2VqOVZGcUh3ejduZGFY?=
 =?utf-8?B?R0ErSW9KamM4UmRqREpCOVV3TGIwOUppNW04eHRGbVpjcEVUVDdxVEYxejVZ?=
 =?utf-8?B?MHVTVWZaN0p6ZkozL0xJb2k3Z1RDSzRSRUdrVjh5djZHOUxhaEtndz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90D5B38EF6CC3C49A4B86CA3F5D7C195@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07d1256-4c77-43e6-cdac-08da23bf8733
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:51:13.9766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMtnQYIoWP+cyCBttJo6ytlLVCHexxkvElvx74L4XEAtIdp5qm8h5IZ8Es42jyjayCGGD0T52jSCdwMEu8FXm0Ses6+ow2wqpt1u4pR6x3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4593

T24gMjAvMDQvMjAyMiAwNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVG9kYXkgaW9tbXVf
ZG9fZG9tY3RsKCkgaXMgYmVpbmcgY2FsbGVkIGZyb20gYXJjaF9kb19kb21jdGwoKSBpbiB0aGUN
Cj4gImRlZmF1bHQ6IiBjYXNlIG9mIGEgc3dpdGNoIHN0YXRlbWVudC4gVGhpcyBoYXMgbGVkIGFs
cmVhZHkgdG8gY3Jhc2hlcw0KPiBkdWUgdG8gdW52YWxpZGF0ZWQgcGFyYW1ldGVycy4NCj4NCj4g
Rml4IHRoYXQgYnkgbW92aW5nIHRoZSBjYWxsIG9mIGlvbW11X2RvX2RvbWN0bCgpIHRvIHRoZSBt
YWluIHN3aXRjaA0KPiBzdGF0ZW1lbnQgb2YgZG9fZG9tY3RsKCkuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

