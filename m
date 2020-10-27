Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9C29AF8F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12902.33381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPic-0005Pf-Dl; Tue, 27 Oct 2020 14:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12902.33381; Tue, 27 Oct 2020 14:12:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPic-0005PH-Aa; Tue, 27 Oct 2020 14:12:58 +0000
Received: by outflank-mailman (input) for mailman id 12902;
 Tue, 27 Oct 2020 14:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bP4d=EC=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1kXPia-0005Ng-NF
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:12:56 +0000
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d17d290-c339-455e-ab5a-8dac409db236;
 Tue, 27 Oct 2020 14:12:55 +0000 (UTC)
Received: from nodbug.lucina.net (93-137-71-201.adsl.net.t-com.hr
 [93.137.71.201])
 by smtp.lucina.net (Postfix) with ESMTPSA id 4ECDC122804;
 Tue, 27 Oct 2020 15:12:54 +0100 (CET)
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 5939A2683D52; Tue, 27 Oct 2020 15:12:53 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bP4d=EC=lucina.net=martin@srs-us1.protection.inumbo.net>)
	id 1kXPia-0005Ng-NF
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:12:56 +0000
X-Inumbo-ID: 4d17d290-c339-455e-ab5a-8dac409db236
Received: from smtp.lucina.net (unknown [62.176.169.44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4d17d290-c339-455e-ab5a-8dac409db236;
	Tue, 27 Oct 2020 14:12:55 +0000 (UTC)
Received: from nodbug.lucina.net (93-137-71-201.adsl.net.t-com.hr [93.137.71.201])
	by smtp.lucina.net (Postfix) with ESMTPSA id 4ECDC122804;
	Tue, 27 Oct 2020 15:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
	s=dkim-201811; t=1603807974;
	bh=h2OzsMInKjif+yY3DceG3feD9iaBujgGV9ZwqWPl4jw=;
	h=Date:From:To:Cc:Subject:From;
	b=TvSzT6I5LPOSShABikOcf1ng7ddfFojtXjZOuHBIObybR5blM90Blu3SVDy/SlQIj
	 O8otzo1Xh+cL6zpO/31kx5ZAOAce/0gac1H4/AgBC06ZARSezcKMm03YaU72jBQ9DJ
	 q15gt4ygSiuCK95TZriJLNPV6/6kZTQssh3/rk1IymeAK2wZjLPTBkxMs+cCAPRUwK
	 cyQlI/FkW0cfgqWTafIw4q4/oJnO9HUAKeHW/F+fUFjGBHwRTCYfCPIlaFSwO/uwrd
	 4D3x7q1RcyythveykijyiDYhA4zWOA/iE2O/Pig7JJh2POz+fh4wyAEaGMQs2Bun3+
	 MbskA8aOJ4QvA==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
	id 5939A2683D52; Tue, 27 Oct 2020 15:12:53 +0100 (CET)
Date: Tue, 27 Oct 2020 15:12:53 +0100
From: Martin Lucina <martin@lucina.net>
To: mirageos-devel@lists.xenproject.org
Cc: xen-devel@lists.xenproject.org
Subject: [ANN] MirageOS 3.9.0 released
Message-ID: <20201027141253.GA14637@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
	mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

Dear all,

We are pleased to announce the release of MirageOS 3.9.0.

Our last release announcement was for [MirageOS
3.6.0](https://mirage.io/blog/announcing-mirage-36-release), so we will
also cover changes since 3.7.x and 3.8.x in this announcement.

New features:

- The Xen backend has been [re-written from
  scratch](https://github.com/mirage/mirage/issues/1159) to be based on
  Solo5, and now supports PVHv2 on Xen 4.10 or higher, and QubesOS 4.0.
- As part of this re-write, the existing Mini-OS based implementation has
  been retired, and all non-UNIX backends now use a unified OCaml runtime
  based on `ocaml-freestanding`.
- OCaml runtime settings settable via the `OCAMLRUNPARAM` environment
  variable are now exposed as unikernel boot parameters. For details, refer
  to [#1180](https://github.com/mirage/mirage/pull/1180).

Security posture improvements:

- With the move to a unified Solo5 and ocaml-freestanding base MirageOS
  unikernels on Xen gain several notable improvements to their overall
  security posture such as SSP for all C code, W^X, and malloc heap
  canaries. For details, refer to the mirage-xen 6.0.0 release
  [announcement](https://github.com/mirage/mirage-xen/releases/tag/v6.0.0).

API breaking changes:

- Several Xen-specific APIs have been removed or replaced, unikernels using
  these may need to be updated. For details, refer to the mirage-xen 6.0.0
  release
  [announcement](https://github.com/mirage/mirage-xen/releases/tag/v6.0.0).

Other notable changes:

- `Mirage_runtime` provides event loop enter and exit hook registration
  ([#1010](https://github.com/mirage/mirage/pull/1010)).
- All MirageOS backends now behave similarly on a successful exit of the
  unikernel: they call `exit` with the return value 0, thus `at_exit`
  handlers are now executed
  ([#1011](https://github.com/mirage/mirage/pull/1011)).
- The unix backend used a toplevel exception handler, which has been
  removed. All backends now behave equally with respect to exceptions.
- Please note that the `Mirage_net.listen` function still installs an
  exception handler, which will be removed in a future release. The out of
  memory exception is no longer caught by `Mirage_net.listen`
  ([#1036](https://github.com/mirage/mirage/issues/1036)).
- To reduce the number of OPAM packages, the `mirage-*-lwt` packages are
  now deprecated. `Mirage_net` (and others) now use `Lwt.t` directly, and
  their `buffer` type is `Cstruct.t`
  ([#1004](https://github.com/mirage/mirage/issues/1004)).
- OPAM files generated by `mirage configure` now include opam build and
  installation instructions, and also an URL to the Git `origin`
  ([#1022](https://github.com/mirage/mirage/pull/1022)).

Known issues:

- `mirage configure` fails if the unikernel is under version control and no
  `origin` remote is present
  ([#1188](https://github.com/mirage/mirage/issues/1188)).
- The Xen backend has issues with event delivery if built with an Alpine
  Linux GCC toolchain. As a work-around, please use a Fedora or Debian
  based toolchain.

Acknowledgements:

- Thanks to Roger Pau Monné, Andrew Cooper and other core Xen developers
  for help with understanding the specifics of how Xen PVHv2 works, and how
  to write an implementation from scratch.
- Thanks to Marek Marczykowski-Górecki for help with the QubesOS specifics,
  and for forward-porting some missing parts of PVHv2 to QubesOS version of
  Xen.
- Thanks to @palainp on Github for help with testing on QubesOS.

